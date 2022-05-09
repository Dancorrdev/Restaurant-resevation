const express = require("express");
const router = express.Router();
const pool = require("../database");

router.get("/new", (req, res) => {
  res.render("users/create");
});

router.post("/new", (req, res) => {
  res.redirect("/users");
});

router.get("/edit/:id", async (req, res) => {
  const { id } = req.params;
  const user = await pool.query("SELECT * FROM usuarios WHERE idUsuario = ?", [
    id,
  ]);
  const roles = await pool.query(
    "SELECT roll FROM roles INNER JOIN usuarios ON roles.idRoll = usuarios.idRoll WHERE idUsuario = ?;",
    [id]
  );
  const tipDoc = await pool.query(
    "SELECT tipoDocumento FROM tipodocumento INNER JOIN usuarios ON tipodocumento.idTipoDocumento = usuarios.idTipoDocumento WHERE idUsuario = ?;",
    [id]
  );
  res.render("users/edit", { user: user[0], rol:roles[0], tipDoc: tipDoc[0] });
});

router.post("/edit/:id", async (req, res) => {
  const { id } = req.params;
  const { } = req.body;
  res.redirect("/users");
});

router.get("/", async (req, res) => {
  const users = await pool.query("SELECT * FROM usuarios");
  const roles = await pool.query(
    "SELECT roll FROM roles INNER JOIN usuarios ON roles.idRoll = usuarios.idRoll;"
  );
  const tipDoc = await pool.query(
    "SELECT tipoDocumento FROM tipodocumento INNER JOIN usuarios ON tipodocumento.idTipoDocumento = usuarios.idTipoDocumento;"
  );
  res.render("users/read", { users, roles, tipDoc });
});

module.exports = router;
