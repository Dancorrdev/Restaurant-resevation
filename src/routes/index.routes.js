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

module.exports = router;
