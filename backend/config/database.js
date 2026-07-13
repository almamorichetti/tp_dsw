const { Sequelize } = require("sequelize");

const sequelize = new Sequelize(
    "take_away",   // nombre de la base
    "root",     // usuario de MySQL
    "alma2005",  // contraseña
    {
        host: "localhost",
        dialect: "mysql"
    }
);

module.exports = sequelize;