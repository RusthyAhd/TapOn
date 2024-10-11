
const ServiceProviderModel = require('../models/serviceProvider.model'); // Import the model

// Register Service Provider
exports.serviceregister = async (req, res, next) => {
    try {
        const { name, service_title, phone, address, location, email } = req.body;

        // Validate required fields
        if (!name || !service_title || !phone || !address || !location || !email) {
            return res.status(400).json({ status: false, error: 'All fields are required' });
        }

        // Create a new service provider entry
        const newServiceProvider = new ServiceProviderModel({
            name,
            service_title,
            phone,
            address,
            location,
            email,
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
