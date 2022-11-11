const express = require("express");
const router = express.Router();
const passport = require("passport");
const pool = require("../database");
const auth = require("./../lib/auth");

router.get("/password/reset", (req, res) => {
  res.render("queries/recoverPasswords");
});

router.get(
  "/password/new",
  auth.isNotLoggedIn,
  passport.authenticate("local.registro", {
    successRedirect: "/users",
    failureRedirect: "/registro",
    failureFlash: true,
  }),
);

router.get("/", auth.isNotLoggedIn, async(req, res) => {
  const tiposDocumento = await pool.query("SELECT * FROM tipodocumento");
  console.log(tiposDocumento)
  res.render("login",[tiposDocumento]);
});

router.post("/login", auth.isNotLoggedIn, (req, res, next) => {
  passport.authenticate('local.login', {
    successRedirect: '/users',
    failureRedirect: '/',
    failureFlash: true
  })(req, res, next);
});

router.get("/users/create", (req, res) => {
  res.render("users/create");
});

module.exports = router;
