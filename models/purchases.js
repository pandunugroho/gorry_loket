'use strict';
module.exports = (sequelize, DataTypes) => {
  const purchases = sequelize.define('purchases', {
    eventId: DataTypes.INTEGER,
    buyerName: DataTypes.STRING,
    hasBeenPaid: DataTypes.TINYINT,
  }, {});
  purchases.associate = function (models) {
    // associations can be defined here vvv
    purchases.belongsTo(models.events, {
      foreignKey: "eventId",
      // as: "events",
      sourceKey: "id"
    });
    purchases.hasMany(models.tickets, {
      foreignKey: "purchaseId",
      // as: "tickets",
      sourceKey: "id"
    });

  };
  return purchases;
};