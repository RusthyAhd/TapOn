
const mongoose = require('mongoose');

// Define the schema for service provider registration
const ServiceProviderSchema = new mongoose.Schema({
    name: { type: String, required: true },
    service_title: { type: String, required: true },
    phone: { type: String, required: true },
    address: { type: String, required: true },
    location: { type: String, required: true },
    email: { type: String, required: true },
}, { timestamps: true });

// Check if the model is already compiled to prevent OverwriteModelError
const ServiceProviderModel = mongoose.models.ServiceProviderdetail || mongoose.model('ServiceProviderdetail', ServiceProviderSchema);

module.exports = ServiceProviderModel;
