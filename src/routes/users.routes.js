const express = require("express");
const router = express.Router();
const pool = require("../database");

router.get("/new", (req, res) => {
  res.render("users/create");
});

router.post("/new", (req, res) => {
  res.redirect("/users");
});

router.get("/edit", (req, res) => {
  res.render("users/edit");
});

router.post("/edit", (req, res) => {
  res.redirect("/users");
});

router.get("/", async (req, res) => {
  const users = await pool.query("SELECT * FROM usuarios");
  console.log(users);
  res.render("users/read");
});

module.exports = router;
