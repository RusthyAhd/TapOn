const app = require('./app'); //app.js file imported into this file

const db = require('./config/db') //db.js file imported into this file

const OwnerModel = require('./models/Owner.model') 

const port = 3000;

app.get('/',(req,res)=>{

    res.send("Hello TapOn Guys") //when run anywhere "http://localhost:${port}" this will show

});

app.listen(port,()=>{
    console.log(`Server is Listen on Port http://localhost:${port}`);

});