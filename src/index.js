const express = require("express");
const morgan = require("morgan");
const path = require("path");

//Inicializaciones de dependencias
const app = express();

//Settings
app.set("puerto", process.env.PORT || 4000);
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

//Middelwares
app.use(morgan("dev"));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

//Rutas
app.use(require("../src/routes/index.routes"));
app.use("/reservation", require("../src/routes/reservation.routes"));
app.use("/users", require("../src/routes/users.routes"));


//Public
app.use(express.static(path.join(__dirname, 'css')))
app.use(express.static(path.join(__dirname, 'js')))

//Iniciando Server
app.listen(app.get("puerto"), () => {
  console.log("Server on port: ", app.get("puerto"));
});
