const mongoose = require('mongoose'); //import mongoose library

const connection =mongoose.createConnection('mongodb+srv://rusthy2001:rusthy.01122001@tapon-atlas.9qjax.mongodb.net/Tapon-DB').on('open',()=>{ //create "TapOnDB" database into localhost
    console.log("Mongodb Successfully Connected with TapOn-Backend"); //print this when not have any error
}).on('error',()=>{
    console.log("Connection Error"); //monavahari prasnayaknam
});//create mongodb database

module.exports = connection;

