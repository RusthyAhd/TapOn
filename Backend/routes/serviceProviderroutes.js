const express = require('express'); // Import express
const ServiceProviderController = require('../controllers/ServiceProvider.controller'); // Import the controller

const router = express.Router(); // Create a new router

// Define the route for service provider registration
router.post('/serviceregistration', ServiceProviderController.serviceregister);

module.exports = router;
