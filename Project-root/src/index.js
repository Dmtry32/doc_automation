const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const apiRoutes = require('./routes/api');
const { connectDB } = require('./config/db');

// Middleware to parse JSON requests
app.use(express.json());

// Connect to the database
connectDB();

// Use API routes defined in `routes/api.js`
app.use('/api', apiRoutes);

// Start the server
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
