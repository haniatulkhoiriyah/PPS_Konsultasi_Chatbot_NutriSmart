const express = require('express');
const router = express.Router();
const db = require('../utils/db');

// GET semua keyword
router.get('/keywords', async (req, res) => {
  try {
    const [results] = await db.query('SELECT * FROM keywords');
    res.json(results);
  } catch (err) {
    console.error('Keyword error:', err);
    res.status(500).json({ error: 'Gagal ambil data keyword' });
  }
});

// POST tambah keyword baru
router.post('/keywords', async (req, res) => {
  const { keyword, answer } = req.body;
  if (!keyword || !answer) {
    return res.status(400).json({ error: 'Keyword dan jawaban wajib diisi' });
  }

  try {
    await db.query('INSERT INTO keywords (keyword, answer) VALUES (?, ?)', [keyword, answer]);
    res.json({ message: 'Keyword berhasil ditambahkan' });
  } catch (err) {
    console.error('Tambah keyword error:', err);
    res.status(500).json({ error: 'Gagal tambah keyword' });
  }
});

// PUT update keyword berdasarkan ID
router.put('/keywords/:id', async (req, res) => {
  const { id } = req.params;
  const { keyword, answer } = req.body;

  if (!keyword || !answer) {
    return res.status(400).json({ error: 'Keyword dan jawaban wajib diisi' });
  }

  try {
    const [result] = await db.query(
      'UPDATE keywords SET keyword = ?, answer = ? WHERE id = ?',
      [keyword, answer, id]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Keyword tidak ditemukan' });
    }

    res.json({ message: 'Keyword berhasil diupdate' });
  } catch (err) {
    console.error('Update keyword error:', err);
    res.status(500).json({ error: 'Gagal update keyword' });
  }
});

// DELETE keyword berdasarkan ID
router.delete('/keywords/:id', async (req, res) => {
  const { id } = req.params;

  try {
    const [result] = await db.query('DELETE FROM keywords WHERE id = ?', [id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Keyword tidak ditemukan' });
    }

    res.json({ message: 'Keyword berhasil dihapus' });
  } catch (err) {
    console.error('Hapus keyword error:', err);
    res.status(500).json({ error: 'Gagal hapus keyword' });
  }
});

module.exports = router;
