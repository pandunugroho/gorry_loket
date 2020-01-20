'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('tickets', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      purchaseId: {
        type: Sequelize.INTEGER,
        references: {
          model: "purchases",
          key: "id"
        },
        onDelete: "cascade",
        onUpdate: "cascade"
      },
      availableTicketId: {
        type: Sequelize.INTEGER,
        references: {
          model: "availableTickets",
          key: "id"
        },
        onDelete: "cascade",
        onUpdate: "cascade"
      },
      quantity: {
        type: Sequelize.INTEGER,
      },
      price: {
        type: Sequelize.INTEGER,
      },
      totalPrice: {
        type: Sequelize.INTEGER,
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('favorites');
  }
};