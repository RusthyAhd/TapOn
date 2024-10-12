const express = require('express');
const router = express.Router();
const {createOrUpdateProfile }= require('../controllers/Profile.controller');

router.post('/profile', createOrUpdateProfile);

module.exports = router;
