const { Sequelize } = require('sequelize');

// Create Sequelize instance with database credentials
const sequelize = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, {
    host: process.env.DB_HOST,
    dialect: 'mysql',
});

// Function to test database connection
async function connectDB() {
    try {
        await sequelize.authenticate();
        console.log('Database connection established successfully');
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
}

module.exports = { sequelize, connectDB };
