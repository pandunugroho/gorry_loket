'use strict';
module.exports = (sequelize, DataTypes) => {
  const events = sequelize.define('events', {
    title: DataTypes.STRING,
    startTime: DataTypes.DATE,
    endTime: DataTypes.DATE,
    description: DataTypes.TEXT,
    locationId: DataTypes.INTEGER,
    address: DataTypes.TEXT,
    img: DataTypes.STRING,
  }, {});
  events.associate = function(models) {
    // associations can be defined here
    events.belongsTo(models.locations, {
      foreignKey: "locationId",
      // as: "location",
      sourceKey: "id"
    });
    events.hasMany(models.availableTickets, {
      foreignKey: "eventId",
      sourceKey: "id"
    });
    events.hasMany(models.purchases, {
      foreignKey: "eventId",
      sourceKey: "id"
    });
  };
  return events;
};