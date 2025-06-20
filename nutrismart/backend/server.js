const express = require('express');
const cors = require('cors');
const session = require('express-session');
const bodyParser = require('body-parser');

const { isAuthenticated, isAdmin } = require('./middleware/auth');
const authRoutes = require('./routes/authRoutes');
const chatRoutes = require('./routes/chatRoutes');
const adminRoutes = require('./routes/adminRoutes');

const bcrypt = require('bcrypt');
const db = require('./utils/db');

const app = express();
const port = 5000;

// Middleware
app.use(cors({ origin: 'http://localhost:3000', credentials: true }));
app.use(bodyParser.json());
app.use(session({
  secret: 'nutrismart-secret',
  resave: false,
  saveUninitialized: true
}));

// Routes
app.use('/', authRoutes);
app.use('/chat', isAuthenticated, chatRoutes);
app.use('/admin', isAuthenticated, isAdmin, adminRoutes);

// Auto-create admin user if not exist
(async () => {
  try {
    const [rows] = await db.query('SELECT * FROM users WHERE email = ?', ['admin@example.com']);
    if (rows.length === 0) {
      const hashed = await bcrypt.hash('admin123', 10);
      await db.query(
        'INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)',
        ['Admin', 'admin@example.com', hashed, 'admin']
      );
      console.log('✅ Admin user created. Email: admin@example.com | Password: admin123');
    } else {
      console.log('ℹ️ Admin already exists.');
    }
  } catch (err) {
    console.error('❌ Error creating admin user:', err);
  }
})();

app.listen(port, () => {
  console.log(`✅ Server running on http://localhost:${port}`);
});