/**
 * 
 *          APIController
 * 
 * This class expose the endpoints that the client applications will use to interact with the Node server
 * 
 */
 

class APIController {

    //The constructor receives the instance of the express.js app 
    constructor(app,dbConnectionPool) {
        console.log('In the constructor of the API Controler');
        this.app = app;
        this.dbConnectionPool = dbConnectionPool;
        // All the endpoints methods need to be called in the constructor to initialize the route.
        this.hello();
        this.getVenueById();
    }

    // Enpoint to get a venue by id (GET Endpoint)
    async getVenueById() {
        let self = this;
        this.app.get("/venue/:venueid", async (req, res) => {
            let venueBrk = require('./venueDBBroker2.js')(this.dbConnectionPool);
            let venue = await venueBrk.getById(req.params.venueid);
            return (venue) ? res.status(200).json(venue) : res.status(404).send(`Venue with code ${req.params.venueid} could not be found.`);
        });
        this.app.get("/venue/", async (req, res) => {
            return res.status(404).send("Venue could not be found. Please review the parameters."); 
        });
        this.app.get("/venue", async (req, res) => {
            return res.status(404).send("Venue could not be found. Please review the parameters."); 
        });
    }

    hello() {
        this.app.get("/hello/", async (req, res) => {
            return res.status(200).json("Hello Client!");
        });
    }

}

module.exports = (app,dbConnPool) => { return new APIController(app, dbConnPool);}