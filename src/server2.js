/**
 *                 ApplicationServer
 * Required Modules
 * - 'express' Express.js is a Web Framework
 * - 'mysql2'  to connect to the MySQL database 
 * - `morgan` Isn't required but help with debugging and logging
 * - `body-parser` This module allows to parse the body of the post request into a JSON
 * 
*/
 const express = require('express');
 const mysql = require('mysql2/promise');
 //const morgan = require('morgan');
 const bodyParser = require('body-parser');

 class ApplicationServer {
 
     constructor() {
        //Express application object
        this.app = express();
  	    //connect to database
        this.dbConnectionPool = null;
        this.connectToDB();
        //initialize the express framework
        this.initExpress();
        //initialize middleware modules
        this.initExpressMiddleWare();
        // initialize the endpoints of the application
        this.initControllers(this.app);
        //run the express application
        this.start();
     }
 
     async connectToDB() {
         let self = this;
         // create the connection pool. Pool specific settings are the default
         try {
            self.dbConnectionPool = mysql.createPool({
                host     : 'localhost',
                database : 'venue_implementation_tracker',
                user     : 'root',
                password : 'rootAdmin2022',
                connectionLimit: 10,
                waitForConnections: true,
                queueLimit: 0 
            });
            // now that supposedly we are connected, let's test it
            let rows = await self.dbConnectionPool.execute('SELECT 1 FROM DUAL');
         } catch (err) {
            console.log(`SEVERE ERROR. Could not connect to database: ${err}`);
         }
     };
    
     initExpress() {
         this.app.set("port", 3000);
     }

     initExpressMiddleWare() {
	//	this.app.use(morgan('dev'));
		this.app.use(bodyParser.urlencoded({extended:true}));
		this.app.use(bodyParser.json());
	}

    initControllers() {
        require('./APIController2.js')(this.app, this.dbConnectionPool);
	}

 
     start() {
         let self = this;
         this.app.listen(this.app.get('port'), () => {
             console.log(`Server Listening for port: ${self.app.get('port')}`);
         });
     }
 
 }
 
 new ApplicationServer();