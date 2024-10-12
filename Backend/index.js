const express = require('express');
const mongoose = require('mongoose');
const body_parser = require('body-parser');

// Import routes
const OwnerRouter = require('./routes/OwnerRoutes'); // Shop Owner routes
const ServiceProviderRouter = require('./routes/serviceProviderroutes'); // Service Provider routes
const profileRoutes = require('./routes/Profile.routes');
// Initialize the express app
const app = express();

// Enable Mongoose debug mode to log all queries
mongoose.set('debug', true);

// Connect to MongoDB
mongoose.connect('mongodb+srv://rusthy2001:rusthy.01122001@tapon-atlas.9qjax.mongodb.net/Tapon-DB?retryWrites=true&w=majority&appName=TapOn-Atlas', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})
.then(() => console.log('MongoDB Successfully Connected with TapOn-DB'))
.catch(error => {
    console.error('MongoDB Connection Error:', error.message);
});

    app.get('/serviceregistration', async (req, res) => {
        try {
            const test = await mongoose.connection.db.admin().ping(); // Check MongoDB connectivity
            
            // Log the test result in terminal
            console.log('MongoDB Ping Result:', test);
    
            res.status(200).send('MongoDB connection is working: ' + JSON.stringify(test));
        } catch (error) {
            console.error('MongoDB Ping Failed:', error.message); // Log the error to the terminal
            res.status(500).send('MongoDB connection failed: ' + error.message);
        }
    });


// Use middleware for parsing JSON
app.use(body_parser.json());

// Define the routes for shop owner and service provider registration
app.use('/', OwnerRouter);  // Shop owner routes are under /shopowner
app.use('/', ServiceProviderRouter); // Service provider routes are under /serviceprovider
app.use('/', profileRoutes);



// Define a simple route for the home page
app.get('/', (req, res) => {
    res.send("Hello TapOn Guys");
});

// Start the server and listen on port 3000
const port = 3000;
app.listen(port, () => {
    console.log(`Server is listening on http://localhost:${port}`);
});
