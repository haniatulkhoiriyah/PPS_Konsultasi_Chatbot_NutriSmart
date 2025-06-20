const express = require('express');
const bcrypt = require('bcrypt');
const crypto = require('crypto');
const db = require('../utils/db');
const router = express.Router();

router.post('/register', async (req, res) => {
  const { name, email, password } = req.body;
  if (!name || !email || !password)
    return res.status(400).json({ error: 'Semua field wajib diisi' });

  try {
    const [existing] = await db.query('SELECT * FROM users WHERE email = ?', [email]);
    if (existing.length > 0)
      return res.status(400).json({ error: 'Email sudah terdaftar' });

    const hashed = await bcrypt.hash(password, 10);
    await db.query('INSERT INTO users (name, email, password) VALUES (?, ?, ?)', [name, email, hashed]);
    res.json({ message: 'Register berhasil' });
  } catch (err) {
    console.error('❌ Error register:', err);
    res.status(500).json({ error: 'Gagal register' });
  }
});

router.post('/login', async (req, res) => {
  const { email, password } = req.body;
  if (!email || !password)
    return res.status(400).json({ error: 'Email dan password wajib diisi' });

  try {
    const [rows] = await db.query('SELECT * FROM users WHERE email = ?', [email]);
    const user = rows[0];
    if (!user) return res.status(400).json({ error: 'Email tidak ditemukan' });

    const match = await bcrypt.compare(password, user.password);
    if (!match) return res.status(400).json({ error: 'Password salah' });

    req.session.user = {
      id: user.id,
      name: user.name,
      email: user.email,
      role: user.role // penting!
    };
    res.json({ user: req.session.user });
  } catch (err) {
    console.error('Login error:', err);
    res.status(500).json({ error: 'Gagal login' });
  }
});


router.post('/forgot-password', async (req, res) => {
  const { email } = req.body;
  if (!email) return res.status(400).json({ error: 'Email wajib diisi' });

  try {
    const token = crypto.randomBytes(32).toString('hex');
    const [rows] = await db.query('SELECT * FROM users WHERE email = ?', [email]);
    if (rows.length === 0)
      return res.status(200).json({ message: 'Jika email terdaftar, instruksi telah dikirim.' });

    await db.query('UPDATE users SET reset_token = ? WHERE email = ?', [token, email]);
    console.log(`🔐 Token reset: http://localhost:3000/reset-password/${token}`);
    res.json({ message: 'Jika email terdaftar, instruksi telah dikirim.' });
  } catch (err) {
    console.error('Forgot password error:', err);
    res.status(500).json({ error: 'Gagal proses reset password' });
  }
});

router.post('/reset-password/:token', async (req, res) => {
  const { token } = req.params;
  const { password } = req.body;

  if (!token || !password)
    return res.status(400).json({ error: 'Token dan password baru wajib diisi' });

  try {
    const hashed = await bcrypt.hash(password, 10);
    const [result] = await db.query(
      'UPDATE users SET password = ?, reset_token = NULL WHERE reset_token = ?',
      [hashed, token]
    );

    if (result.affectedRows === 0)
      return res.status(400).json({ error: 'Token tidak valid atau sudah digunakan' });

    res.json({ message: 'Password berhasil direset' });
  } catch (err) {
    console.error('Reset password error:', err);
    res.status(500).json({ error: 'Gagal reset password' });
  }
});

module.exports = router;