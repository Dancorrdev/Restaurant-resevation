const express = require("express");
const morgan = require("morgan");

//Inicializaciones de dependencias
const app = express();

//Settings
app.set("puerto", process.env.PORT || 4000);
//app.set("views", path.join(__dirname, "views"));

//Middelwares
app.use(morgan("dev"));

//Rutas
app.use(require("../src/routes/index.routes"));

//Iniciando Server
app.listen(app.get("puerto"), () => {
  console.log("Server on port: ", app.get("puerto"));
});
