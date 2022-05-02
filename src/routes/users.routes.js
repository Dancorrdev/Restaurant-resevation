const express = require("express");
const router = express.Router();

router.get("/new", (req, res) => {
  res.render("users/create");
});

router.post("/new", (req,res) =>{
    res.redirect("/users")
})

router.get("/edit", (req, res) => {
  res.render("users/edit");
});

router.post("/edit", (req, res) =>{
    res.redirect("/users")
})

router.get("/", (req, res) => {
  res.render("users/read");
});

module.exports = router;
