const express = require("express");
const router = express.Router();

router.get("/edit", (req, res) => {
  res.render("reservation/edit");
});

router.get("/new", (req, res) => {
  res.render("reservation/new");
});
router.post("/new", (req, res) =>{
  res.redirect("/reservation")
})

router.get("/", (req, res) => {
  res.render("queries/reservationsReception");
});



module.exports = router;
