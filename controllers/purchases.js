const models = require("../models");
const Purchases = models.purchases;
const Events = models.events;
const Tickets = models.tickets;
const AvailableTickets = models.availableTickets;


exports.createPurchase = (req, res) => {
  const {
    eventId,
    buyerName,
    hasBeenPaid
  } = req.body
  Purchases.create(
    {
      eventId,
      buyerName,
      hasBeenPaid
    }
  ).then(data =>
    res.send({
      message: "Yeay~! Success to create new Purchase",
      data
    })
  )
};

exports.getInfo = (req, res) => {
  Events.findAll({
    attributes: {
      exclude: ["createdAt", "updatedAt"]
    },
    include: [
      {
        model: Purchases,
        as: "purchases",
        attributes: {
          exclude: ["createdAt", "updatedAt"],
        },
        include: [
          {
            model: Tickets,
            as: "tickets",
            attributes: {
              exclude: ["createdAt", "updatedAt"]
            }
          }
        ]
      }
    ]
  })
    .then(data => {
      res.send(data)
    })
};

exports.buyTicket = (req, res) => {
  const {
    eventId,
    purchaseId,
    availableTicketId,
    quantity
  } = req.body
  AvailableTickets.findOne({
    where: {
      eventId: eventId
    }
  })
    .then(data => {
      if (data === null) {
        res.status(500).json({
          message: "ticket not found",
          status: "failed"
        });
      } else {
        if (quantity < 1) {
          res.send({
            message: "quantity can't be less than 1"
          })
        }
        else if (data.stock < quantity) {
          res.send({
            message: "ticket purchase exceeds the ticket's limit"
          })
        }
        else {
          const ticketStock = data.stock - quantity
          const ticketPrice = data.price
          AvailableTickets.update({
            stock: ticketStock
          },
          {
            where: {
              id:availableTicketId
            }
          })
          Tickets.create({
            eventId,
            purchaseId,
            availableTicketId,
            quantity,
            price: data.price,
            totalPrice: ticketPrice * quantity
          })
            .then(ticket => {
              res.send({
                message: "Yeay~! Success to puchase Ticket(s)",
                ticket
              })
            })
        }
      }
    })
}



// exports.createTicket2 = (req, res) => {
//   const {
//     eventId,
//     purchaseId,
//     availableTicketId,
//     quantity
//   } = req.body


//   Events.findOne(
//     {
//       where: {
//         id: eventId
//       }
//     }
//   )
//     .then(event => {
//       console.log(event.id)
//       Purchases.findOne({
//         where: {
//           id: purchaseId
//         }
//       })
//         .then(purchase => {

//           AvailableTickets.findOne({
//             where: {
//               id: req.body.availableTicketId
//             }
//           })
//         })
//         .then(availableTicket => {
//           console.log(availableTicket + " uhuy");
//           Tickets.create(
//             {
//               purchaseId,
//               availableTicketId,
//               quantity,
//               price: req.body.availableTicket.price,
//               totalPrice: quantity * price
//             }
//           ).then(data =>
//             res.send({
//               message: "Yeay~! Success to puchase Ticket(s)",
//               data
//             })
//           )
//           // .then(data => {
//           //   if (data === 0) {
//           //     res.status(500).json({
//           //       message: "add payment failed",
//           //       success: false
//           //     });
//           //   } else {
//           //     res.status(200).send({
//           //       message: "add payment succeed"
//           //     })
//           //   }
//           // })
//         })
//     })
//   // Tickets.create({
//   //   purchaseId,
//   //   ticketType,
//   //   quantity,
//   //   price,
//   //   totalPrice: quantity * price
//   // }).then(data =>
//   //   res.send({
//   //     message: "Yeay~! Success to puchase Ticket(s)",
//   //     data
//   //   })
//   // )
// };

//-- Test ------------------------------
exports.allPurchases = (req, res) => {
  Purchases.findAll({
    attributes: {
      exclude: ["createdAt", "updatedAt"],
    },
    include: [
      {
        model: Tickets,
        as: "tickets"
      }
    ]
  })
    .then(data => {
      res.send(data)
    })
};