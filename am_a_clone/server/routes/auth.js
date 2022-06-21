'use strict';
const express = require("express"); // import 'express' module
const User = require("../models/user"); // import the User model
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");

// Signup
authRouter.post("/api/signup", async (req, res) => {
  try {
    const { email, password, name } = req.body;

    const existingUser = await User.findOne({ email: email })
    if (existingUser) {
      return res.status(406).json({ msg: "Email already registered" });
    }

    const hashedPassword=await bcryptjs.hash(password, 8);


    var user = new User({
      email,
      password: hashedPassword,
      name,
    })
    user = await user.save();// Post the user to the database
    res.json(user);
    // Return the user data to the client
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Singin
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email: email });
    if (!user) {
      return res.status(400).json({ msg: "User with this email Dosen't exist,Please sign Up first!" });
    }
    const isMatch= await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect password" });
    }
    const token = jwt.sign({ id: user._id },"passwordKey")
    res.json({token, ...user._doc})
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = authRouter;
