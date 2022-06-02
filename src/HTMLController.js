/**
 * 
 *          HTMLController
 * 
 * This class expose the endpoints that the client applications will use to interact with the Node server
 * 
 */

class HTMLController {

    //The constructor receives the instance of the express.js app 
    constructor(app,dbConnectionPool) {
        this.app = app;
        this.dbConnectionPool = dbConnectionPool;
        // All the endpoints methods need to be called in the constructor to initialize the route.
        this.hello();
    }

    hello() {
        this.app.get('/',async(req,res) => res.sendFile(__dirname +'/views/index.html'));
    }


}

module.exports = (app,dbConnPool) => { return new HTMLController(app, dbConnPool);}