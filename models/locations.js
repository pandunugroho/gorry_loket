'use strict';
module.exports = (sequelize, DataTypes) => {
  const locations = sequelize.define('locations', {
    location: DataTypes.STRING,
    imgLocation: DataTypes.STRING
  }, {});
  locations.associate = function(models) {
    // associations can be defined here
    locations.hasMany(models.events, {
      foreignKey: "locationId",
      sourceKey: "id"
    });
  };
  return locations;
};