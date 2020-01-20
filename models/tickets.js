'use strict';
module.exports = (sequelize, DataTypes) => {
  const tickets = sequelize.define('tickets', {
    purchaseId: DataTypes.INTEGER,
    availableTicketId: DataTypes.INTEGER,
    quantity: DataTypes.INTEGER,
    price: DataTypes.INTEGER,
    totalPrice: DataTypes.INTEGER,
  }, {});
  tickets.associate = function (models) {
    // associations can be defined here vvv
    tickets.belongsTo(models.purchases, {
      foreignKey: "purchaseId",
      // as: "purchases",
      sourceKey: "id"
    });
    tickets.belongsTo(models.availableTickets, {
      foreignKey: "availableTicketId",
      // as: "users",
      sourceKey: "id"
    });

  };
  return tickets;
};