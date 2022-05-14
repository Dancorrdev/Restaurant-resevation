const express = require("express");
const router = express.Router();
const pool = require("../database");

router.get("/new", (req, res) => {
  res.render("restaurant/create");
});

router.post("/new", async (req, res) => {
  const { nombreRestaurante, telefono, direccion } = req.body;
  const newRestaurant = { nombreRestaurante, telefono, direccion, estado: 1 };
  await pool.query("INSERT INTO restaurantes SET ?", [newRestaurant]);
  res.redirect("/restaurants");
});

router.get("/edit/:id", async (req, res) => {
  const { id } = req.params;
  const restaurant = await pool.query(
    "SELECT * FROM restaurantes WHERE idRestaurante = ?",
    [id]
  );
  res.render("restaurant/edit", { restaurant: restaurant[0] });
});

router.post("/edit/:id", async (req, res) => {
  const { id } = req.params;
  const { nombreRestaurante, telefono, direccion } = req.body;
  const restaurant = { nombreRestaurante, telefono, direccion, estado: 1 };
  await pool.query("UPDATE restaurantes SET ? WHERE idRestaurante = ?", [
    restaurant,
    id,
  ]);
  res.redirect("/restaurants");
});

router.get("/delete/:id", async (req, res) => {
  const { id } = req.params;
  await pool.query("DELETE FROM restaurantes WHERE idRestaurante = ? ;", [id]);
  res.redirect("/restaurants");
});

router.get("/", async (req, res) => {
  const restaurants = await pool.query("SELECT * FROM restaurantes;");
  res.render("restaurant/read", { restaurant: restaurants });
});

module.exports = router;
