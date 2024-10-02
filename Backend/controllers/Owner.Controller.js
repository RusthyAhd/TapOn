const OwnerServices = require('../services/owner.services');

exports.register = async (req, res, next) => {
    try {
       
        const { name, shop_name, phone, address, location, email } = req.body;
        
        const successRes = await OwnerServices.registerOwner(name,shop_name,phone,address,location,email);

        res.json({ status: true, success: 'Shop ownwers registered successfully' });


    } catch (err) {
        throw error
        
    }
}