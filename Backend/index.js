const express = require("express");
const mongoose = require("mongoose");

// Import routes
const OwnerRouter = require("./routes/OwnerRoutes"); // Shop Owner routes
const ServiceProviderRouter = require("./routes/serviceProviderroutes"); // Service Provider routes
const profileRoutes = require("./routes/Profile.routes");
// Initialize the express app
const app = express();

// Enable Mongoose debug mode to log all queries
mongoose.set("debug", true);

// Connect to MongoDB
mongoose
  .connect(
    "mongodb+srv://rusthy2001:rusthy.01122001@tapon-atlas.9qjax.mongodb.net/Tapon-DB?retryWrites=true&w=majority&appName=TapOn-Atlas"
  )
  .then(() => console.log("MongoDB Successfully Connected with TapOn-DB"))
  .catch((error) => {
    console.error("MongoDB Connection Error:", error.message);
  });

// Use middleware for parsing JSON (built-in Express middleware)
app.use(express.json());

// Define the routes for shop owner and service provider registration
app.use("/", OwnerRouter); // Shop owner routes are under /shopowner
app.use("/", ServiceProviderRouter); // Service provider routes are under /serviceprovider
app.use("/", profileRoutes);

// Define a simple route for the home page
app.get("/", (req, res) => {
  res.send("Hello TapOn Guys");
});

// Start the server and listen on port 3000
const port = 3000;
app.listen(port, () => {
  console.log(`Server is listening on http://localhost:${port}`);
});
