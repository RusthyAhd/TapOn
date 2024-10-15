const mongoose = require('mongoose');

const BookingSchema = new mongoose.Schema({
    userId: { type:mongoose.Types.ObjectId, required: true },
    provideId: { type: mongoose.Types.ObjectId, required: true },
    user: { 
        type: mongoose.Schema.Types.ObjectId, 
        ref: 'Profile',
        required: false 
    }
}, { timestamps: true });

const BookingModel = mongoose.model('Booking', BookingSchema);

module.exports = BookingModel;