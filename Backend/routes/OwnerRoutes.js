const express = require('express'); // Import express package
const OwnerController = require('../controllers/Owner.controller'); // Import the controller

const router = express.Router();

// Update POST route for shop registration
router.post('/shopregistration', OwnerController.register);

module.exports = router;
