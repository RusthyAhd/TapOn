
const OwnerModel = require('../models/Owner.model'); // Import the Owner model

// Controller method to handle the registration
exports.register = async (req, res ) => {
    try {
        // Destructure fields from request body
        const { name, shop_name, phone, address, location, email } = req.body;
        
        // Validate input
        if (!name || !shop_name || !phone || !address || !location || !email) {
            return res.status(400).json({ status: false, error: 'All fields are required' });
        }

        // Create new owner directly inside the controller
        const newOwner = new OwnerModel({
            name,
            shop_name,
            phone,
            address,
            location,
            email
        });

        // Save to the database
        const savedOwner = await newOwner.save();
        
        // Respond with success message
        res.status(200).json({ status: true, success: 'Shop owner registered successfully', data: savedOwner });
    } catch (error) {
        console.error(error);
        res.status(500).json({ status: false, error: 'Registration failed. Try again later.' });
    }
};
