require('express-group-routes');

// instantiate express module
const express = require('express');
const cors = require("cors");
//init body-parser
const bodyParser = require('body-parser')
//use express in app variable
const app = express();
//define the server port
const port = process.env.PORT || 8787;
app.use(cors());
//connect to routers.js after routers.js exported
// const routers = require('./routers');

// allow this app to recieve incoming json request
app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies

app.use(express.json())

const locationsController = require("./controllers/locations")
const eventsController = require('./controllers/events')
const purchasesController = require("./controllers/purchases")


app.get('/', (req, res) => {
    res.send("Welcome to My Server. My name is Pandu Nugroho")
});


app.group('', (router) => {
    //   // Categories
    router.get('/test', (req, res) => {
        res.send("Welcome to My Server. This is a TEST")
    })

    //GET
    router.get('/locations', locationsController.allLocations)
    router.get('/location/:id', locationsController.oneLocation)
    router.get('/event/get_info', eventsController.getInfo)
    router.get('/transaction/get_info', purchasesController.getInfo)
    
    //POST

    router.post('/event/create', eventsController.createEvent)
    router.post('/location/create', locationsController.createLocation)
    router.post('/event/ticket/create', eventsController.createAvailableTicket)
    router.post('/transaction/purchase', purchasesController.createPurchase)
    
    router.get('/event/get_available_tickets_info', eventsController.getAvailableTicketsInfo)
    router.get('/transaction/all_purchases', purchasesController.allPurchases)
    
    router.post('/transaction/buy_ticket', purchasesController.buyTicket)
});


//When this nodejs app executed, it will listen to defined port
app.listen(port, () => console.log(`Listening on port ${port}`))
