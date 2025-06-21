const express = require('express');
const router = express.Router();
const db = require('../utils/db');

router.post('/', async (req, res) => {
  const { userId, question } = req.body;
  const date = new Date().toISOString().split('T')[0];

  try {
    const [results] = await db.query('SELECT answer FROM keywords WHERE ? REGEXP keyword', [question]);
    const answer = results.length > 0 ? results[0].answer : 'Maaf, saya belum mengerti pertanyaan Anda.';

    await db.query(
      'INSERT INTO chatbot_nutrisi (user_id, question, answer, date) VALUES (?, ?, ?, ?)',
      [userId, question, answer, date]
    );

    res.json({ answer });
  } catch (err) {
    console.error('Chat error:', err);
    res.status(500).json({ error: 'Gagal simpan chat' });
  }
});


router.get('/history/:userId', async (req, res) => {
  const { userId } = req.params;

  try {
    const [results] = await db.query(
      'SELECT question AS user_message, answer, date FROM chatbot_nutrisi WHERE user_id = ? ORDER BY id ASC',
      [userId]
    );
    res.json(results);
  } catch (err) {
    console.error('Riwayat error:', err);
    res.status(500).json({ error: 'Gagal ambil riwayat' });
  }
});


router.delete('/history', async (req, res) => {
  const { userId } = req.body;

  try {
    await db.query('DELETE FROM chatbot_nutrisi WHERE user_id = ?', [userId]);
    res.json({ message: 'Riwayat dihapus' });
  } catch (err) {
    console.error('Hapus riwayat error:', err);
    res.status(500).json({ error: 'Gagal hapus riwayat' });
  }
});

module.exports = router;
