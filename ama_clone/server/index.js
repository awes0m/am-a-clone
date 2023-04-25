//IMPORTS
const express = require("express");
const mongoose = require("mongoose");
const dotenv = require("dotenv");

// IMPORT FROM OTHER FILES
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");

// INIT
dotenv.config();
const PORT =process.env.PORT || 3000;
const app = express();


//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);


//crud
// app.get('/hello-world',(req,res)=>{});


//Connections
mongoose
  .connect(process.env.URL)
  .then(() => {
    console.log("Connection Successful to DB");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});