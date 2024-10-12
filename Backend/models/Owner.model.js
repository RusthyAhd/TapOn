
const mongoose = require('mongoose');

// Define the Owner schema
const OwnerSchema = new mongoose.Schema({
    name: { type: String, required: true },
    shop_name: { type: String, required: true },
    phone: { type: String, required: true },
    address: { type: String, required: true },
    location: { type: String, required: true },
    email: { type: String, required: true },
    category: { type: String, required: true },// Make it required if needed
}, { timestamps: true });

// Check if the model is already compiled to prevent OverwriteModelError
const OwnerModel = mongoose.model('Shopowner_register', OwnerSchema);

module.exports = OwnerModel;