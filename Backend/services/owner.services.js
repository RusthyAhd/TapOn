const OwnerModel = require('../models/Owner.model');

class OwnerServices{
 
    static async registerOwner(name, shop_name, phone, address, location, email){
        try{
                
                
                const createOwner = new OwnerModel({
                    name,
                    shop_name,
                    phone,
                    address,
                    location,
                    email,
                });
                return await createOwner.save();
        }catch(err){
            throw err;
        }
    }

}

module.exports = OwnerServices;