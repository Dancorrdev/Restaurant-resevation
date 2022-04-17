const express = require("express");
const morgan = require("morgan")

//Inicializaciones de dependencias
const app = express();

//Settings
app.set("puerto", process.env.PORT || 4000);
app.set("views", path.join(__dirname, "views"));


//Mi