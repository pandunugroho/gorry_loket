const models = require("../models");
const Locations = models.locations;

//to show all registered locations
exports.allLocations = (req, res) => {
  Locations.findAll({
    attributes: {
      exclude: ["createdAt", "updatedAt"]
    },
  })
    .then(data => {
      res.send(data)
    })
};

//to 
exports.oneLocation = (req, res) => {
  Locations.findOne({
    where: { id: req.params.id }
  })
    .then(data => {
      res.send(data)
    })
};

exports.createLocation = (req, res) => {
  const {location, imgLocation} = req.body
  Locations.create({
    location,
    imgLocation
  }).then(data =>
    res.send({
      message: "Yeay~! Success to create new Location",
      data
    })
  )
};
