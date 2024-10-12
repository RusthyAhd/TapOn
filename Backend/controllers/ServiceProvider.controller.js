
const ServiceProviderModel = require('../models/serviceProvider.model'); // Import the model

// Register Service Provider
exports.serviceregister = async (req, res, next) => {
    try {
        const { name, service_title, phone, address, location, email,category } = req.body;

        // Validate required fields
        if (!name || !service_title || !phone || !address || !location || !email || !category) {
            return res.status(400).json({ status: false, error: 'All fields are required' });
        }
                // Check for existing phone or email
                const existingProvider = await ServiceProviderModel.findOne({ $or: [{ phone }] });
                if (existingProvider) {
                    return res.status(400).json({ status: false, error: 'Phone already exists' });
                }

        // Create a new service provider entry
        const newServiceProvider = new ServiceProviderModel({
            name,
            service_title,
            phone,
            address,
            location,
            email,
            category,
        });

          // Save to the database
          const savedServiceProvider = await newServiceProvider.save();

          // Send response back
          res.status(200).json({ status: true, success: 'Service provider registered successfully', data: savedServiceProvider });
      } catch (error) {
          console.error(error);
          res.status(500).json({ status: false, error: 'Registration failed. Try again later.' });
      }
  };


// Add this to your serviceProvider.controller.js
exports.getServiceProviders = async (req, res, next) => {
    try {
        const providers = await ServiceProviderModel.find(); // Fetch all service providers
        res.status(200).json({ status: true, data: providers });
    } catch (error) {
        console.error(error);
        res.status(500).json({ status: false, error: 'Failed to fetch service providers' });
    }
};
