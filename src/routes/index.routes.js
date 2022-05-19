const express = require("express");
const router = express.Router();

router.get("/password/reset", (req, res) => {
  res.render("queries/recoverPasswords");
});

router.get("/password/new", (req, res) => {
  res.render("queries/newPassword");
});

router.get("/", (req, res) => {
  res.render("login");
});

router.get("/users/create", (req, res) => {
  res.render("users/create");
});

module.exports = router;
