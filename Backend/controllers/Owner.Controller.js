const OwnerModel = require('../models/Owner.model'); // Import the Owner model
const bcrypt = require('bcrypt'); // Import bcrypt for password hashing

// Controller method to handle the registration
exports.register = async (req, res) => {
    try {
        // Destructure fields from request body
        const { name, shop_name, phone, address, location, email, category, password, confirmPassword } = req.body;
        
        // Validate input
        if (!name || !shop_name || !phone || !address || !location || !email || !category || !password || !confirmPassword) {
            return res.status(400).json({ status: false, error: 'All fields are required' });
        }

        // Check if passwords match
        if (password !== confirmPassword) {
            return res.status(400).json({ status: false, error: 'Passwords do not match' });
        }

        // Hash the password before saving
        const hashedPassword = await bcrypt.hash(password, 10);

        // Create new owner directly inside the controller
        const newOwner = new OwnerModel({
            name,
            shop_name,
            phone,
            address,
            location,
            email,
            category,
            password: hashedPassword, // Store the hashed password
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
