'use strict';

//Package IMPORTS
const express = require("express") ; // import 'express' module
const mongoose = require("mongoose");

//file IMPORTS
const  authRouter = require("./routes/auth.js");

//INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://am-a-database:am-a-clone@godly-cluster.nyw5n.mongodb.net/?retryWrites=true&w=majority";

// middleware
app.use(express.json());
app.use(authRouter);
//Connections
mongoose.connect(DB).then(() => {
    console.log('Connection Successful')
}).catch((err) => {
    console.log(err)
})

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
