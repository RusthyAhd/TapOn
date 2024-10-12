const Profile = require('../models/Profile.model');

// Controller method to handle creating or updating a user profile
exports.createOrUpdateProfile = async (req, res) => {
    try {
        // Destructure fields from request body
        const { fullName, phoneNumber, email, birthday, gender,address,location } = req.body;

        // Validate input
        if (!fullName || !phoneNumber || !email || !birthday || !gender || !address ||!location ) {
            return res.status(400).json({ status: false, error: 'All fields are required' });
        }

        // Create or update user profile directly inside the controller
        const profile = await Profile.findOneAndUpdate(
            { email: email }, // Use email to find and update profile
            { fullName, phoneNumber, birthday, gender,address,location },
            { new: true, upsert: true } // Create if not found
        );

        // Respond with success message
        res.status(200).json({ status: true, success: 'Profile updated successfully', data: profile });
    } catch (error) {
        console.error(error);
        res.status(500).json({ status: false, error: 'Operation failed. Try again later.' });
    }
};
