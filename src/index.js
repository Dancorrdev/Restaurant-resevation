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
app.use(session({
  secret: 'myslq-node',
  resave: false,
  saveUninitialized: false,
  store: new MySQLStore(database)
}));
app.use(morgan("dev"));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(passport.initialize());
app.use(passport.session());

//Rutas
app.use(require("../src/routes/index.routes"));
app.use("/reservation", require("../src/routes/reservation.routes"));
app.use("/users", require("../src/routes/users.routes"));
app.use("/restaurants", require("../src/routes/restaurants.routes"));



//Public
app.use(express.static(path.join(__dirname, 'css')))
app.use(express.static(path.join(__dirname, 'js')))
app.use(express.static(path.join(__dirname, 'img')))

//Iniciando Server
app.listen(app.get("puerto"), () => {
  console.log("Server on port: ", app.get("puerto"));
});
