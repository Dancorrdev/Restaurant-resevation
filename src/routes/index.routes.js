const express = require("express");
const router = express.Router();

router.get("/password/reset", (req, res) => {
  res.render("queries/recoverPasswords");
});

router.get("/", (req, res) => {
  res.render("login");
});

module.exports = router;
