import express from "express";
import { MikroORM } from "@mikro-orm/mysql";
import mikroOrmConfig from "./config/mikro-orm.js";
const app = express();  //función

app.use(express.json());

app.get("/", (req, res) => {
    res.send("Backend funcionando");
});

async function startServer() {
    try {
        const orm = await MikroORM.init(mikroOrmConfig);

        console.log("Conexión a la base de datos exitosa");

        app.listen(3000, () => {
            console.log("Servidor levantado en puerto 3000");
        });

    } catch (error: unknown) {
        console.error("Error al conectar con la base de datos:", error);
    }
}

startServer();
