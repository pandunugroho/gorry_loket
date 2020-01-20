const jwt = require("express-jwt");

exports.auth = jwt({
  secret: "thisismysecretkey"
});

exports.authorized = (req, res, next) => {
  if (req.user.id != req.params.account_id) {
    return res.status(401).json({ message: "You are not authenticated." });
  }
  next();
};