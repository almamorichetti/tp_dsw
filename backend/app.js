const express = require("express");
const sequelize = require("./config/database");
const app = express();

app.use(express.json());

app.get("/", (req, res) => {
    res.send("Backend funcionando");
});

sequelize.authenticate()
    .then(() => {
        console.log("Conexión a la base de datos exitosa");
    })
    .catch((error) => {
        console.error("Error al conectar con la base de datos:", error);
    });

app.listen(3000, () => {
    console.log("Servidor levantado en puerto 3000");
});