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
        this.app = app;
        this.dbConnectionPool = dbConnectionPool;
        // All the endpoints methods need to be called in the constructor to initialize the route.
        this.hello();
        this.getVenueById();
        this.getZoneById();
        this.getDisciplineByVenue();
        this.getDisciplineById();
    }

    hello() {
        this.app.get('/hello/', async (req, res) => {
            return res.status(200).json('Hello Client!');
        });
    }

    // Enpoint to get a venue by id (GET Endpoint)
    async getVenueById() {
        let self = this;
        this.app.get('/venue/:venueid', async (req, res) => {
            let venueBrk = require('./venueDBBroker.js')(this.dbConnectionPool);
            let venue = await venueBrk.getById(req.params.venueid);
            return (venue) ? res.status(200).json(venue) : res.status(404).send(`Venue with code ${req.params.venueid} could not be found.`);
        });
        this.app.get('/venue/', async (req, res) => {
            return res.status(404).send('Venue could not be found. Please review the parameters.'); 
        });
    }

    // Enpoint to get a venue zone by id (GET Endpoint)
    async getZoneById() {
        this.app.get('/zone/:zoneid', async (req, res) => {
            let zoneBrk = require('./zoneDBBroker.js')(this.dbConnectionPool);
            let zone = await zoneBrk.getById(req.params.zoneid);
            return (zone) ? res.status(200).json(zone) : res.status(404).send(`Zone with code ${req.params.zoneid} could not be found.`);
        });
        this.app.get('/zone/', async (req, res) => {
            return res.status(404).send('Zone could not be found. Please review the parameters.'); 
        });
    }

    async getDisciplineById() {
        this.app.get('/discipline/:disciplineid', async (req, res) => {
            let disciplineBrk = require('./disciplineDBBroker.js')(this.dbConnectionPool);
            let discipline = await disciplineBrk.getById(req.params.disciplineid);
            return (discipline) ? res.status(200).json(discipline) : res.status(404).send(`Discipline with code ${req.params.disciplineid} could not be found.`);
        });
        this.app.get('/discipline/', async (req, res) => {
            return res.status(404).send('Discipline could not be found. Please review the parameters.'); 
        });
    }

    async getDisciplineByVenue() {
        this.app.get('/discipline/venue/:venueid', async (req, res) => {
            let disciplineBrk = require('./disciplineDBBroker.js')(this.dbConnectionPool);
            let disciplineList = await disciplineBrk.getListByVenue(req.params.venueid);
            return (disciplineList.length !== 0) ? res.status(200).json(disciplineList) : res.status(404).send(`Disciplines not found for venue with code ${req.params.venueid}. Either the venue does not exist or it is a non competition venue.`);
        });
        this.app.get('/discipline/venue/', async (req, res) => {
            return res.status(404).send('Disciplines could not be found. Please review the parameters.'); 
        });
    }

}

module.exports = (app,dbConnPool) => { return new APIController(app, dbConnPool);}