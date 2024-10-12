const mongoose = require('mongoose'); 

const profileSchema = new mongoose.Schema({
    fullName: {
        type: String,
        required: true,
    },
    phoneNumber: {
        type: String,
        required: true,
    },
    email: {
        type: String,
        required: true,
    },
    birthday: {
        type: Date,
        required: true,
    },
    gender: {
        type: String,
        enum: ['Male', 'Female', 'Other'],
    },
    address: {
        type: String,
        required: true,
    },
    location: {
        type: String,
        required: true,
    },
    profilePhoto: {
        type: String, // You can change this to type Object if you are storing image files
    },
});

const Profile = mongoose.model('Profile', profileSchema);

module.exports = Profile;
