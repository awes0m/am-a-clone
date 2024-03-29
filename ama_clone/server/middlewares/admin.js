const jwt = require("jsonwebtoken");
const User = require('../models/user');
const adminRouter = require("../routes/admin");

const admin = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token)
      return res.status(401).json({ msg: "No Auth Token, Access Denied!" });

    const verified = jwt.verify(token, "passwordKey");
    if (!verified)
      return res
        .status(401)
        .json({ msg: "Token Verificaton Failed, Auth Denied" });

    const user = await User.findById(verified.id);
    if (user.type == 'user' || user.type == 'seller'){
return res.status(401).json({msg:'You are not an Admin!'})
    }
    req.user = verified.id;
    req.token = token;
    next();
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};



module.exports = admin;