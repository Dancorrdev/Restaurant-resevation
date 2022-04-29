const express = require("express");
const router = express.Router();

router.get("/new", (req, res) =>{
    res.render("users/create")
})

router.get("/edit", (req, res) =>{
    res.render("users/edit")
})

router.get("/", (req, res) => {
    res.render("users/read")
});

module.exports = router;
