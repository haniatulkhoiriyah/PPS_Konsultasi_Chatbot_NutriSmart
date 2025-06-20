module.exports = {
  validateRegister: (req, res, next) => {
    const { name, email, password } = req.body;
    if (!name || !email || !password) return res.status(400).json({ error: 'Field cannot be empty' });
    next();
  }
};
