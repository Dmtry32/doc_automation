const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

// Get all users
router.get('/users', userController.getUsers);

// Create a new user
router.post('/users', userController.createUser);

module.exports = router;
