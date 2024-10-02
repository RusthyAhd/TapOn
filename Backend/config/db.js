const mongoose = require('mongoose'); //import mongoose library

const connection =mongoose.createConnection('mongodb://127.0.0.1:27017/Tapon-DB').on('open',()=>{ //create "TapOnDB" database into localhost
    console.log("Mongodb Successfully Connected with TapOn-Backend"); //print this when not have any error
}).on('error',()=>{
    console.log("Connection Error"); //monavahari prasnayaknam
});//create mongodb database

module.exports = connection;