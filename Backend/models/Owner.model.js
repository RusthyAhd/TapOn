const mongoose = require('mongoose');

const db = require('../config/db');

const OwnerSchema = new mongoose.Schema({

   
    name: {
        type: String,
        required: true,
    },
    shop_name: {
        type: String,
        required: true,
    },
    phone: {
        type: String,
        required: true,
    },
    address: {
        type: String,
        required: true,
    },
    location: {
        type: String,
        required: true,
    },
    email: {
        type: String,
        required: true,
    },

 
});

    
    
    const OwnerModel = db.model('Shopowner_details',OwnerSchema); //create "Shopowner_details" collection
    module.exports = OwnerModel;

