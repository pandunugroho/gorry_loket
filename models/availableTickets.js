'use strict';
module.exports = (sequelize, DataTypes) => {
  const availableTickets = sequelize.define('availableTickets', {
    eventId: DataTypes.INTEGER,
    ticketType: DataTypes.STRING,
    quantity: DataTypes.INTEGER,
    stock: DataTypes.INTEGER,
    price: DataTypes.INTEGER,
    totalPrice: DataTypes.INTEGER,
  }, {});
  availableTickets.associate = function (models) {
    // associations can be defined here vvv
    availableTickets.belongsTo(models.events, {
      foreignKey: "eventId",
      // as: "event",
      sourceKey: "id"
    });

    availableTickets.hasOne(models.tickets, {
      foreignKey: "availableTicketId",
      // as: "event",
      sourceKey: "id"
    });
  };
  return availableTickets;
};