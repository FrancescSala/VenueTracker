const venue = require('./venue.js');

class venueDBBroker {
    
    constructor(dbConnPool) {
        this.dbConnPool = dbConnPool;
    }

    insert(venue) {
        let sql = "INSERT INTO venues ( 'ven_venuecode', 'ven_venuename', 'ven_description'," +
                   "'ven_venuetype', 'ven_zonecode' ) VALUES ( " +
                   "'" + venue.getCode() + "', "
        
        console.log(sql);
    }

    update(venue) {

    }

    delete(code) {

    }

getById(code) {
    let self = this;
    return new Promise((resolve, reject) => {
        let sql = "SELECT * FROM venues WHERE ven_venuecode = ?";
        let vv = this.dbConnPool.execute(sql, [code], 
            (err,rows)=> {
                if (err) throw err;
                console.log(rows.length);
                if (rows.length === 0) throw Error(`venue with code ${code} not found in database`);
                let v = venue();
                v.setCode(rows[0]['ven_venuecode']);
                v.setName(rows[0]['ven_venuename']);
                v.setDescription((rows[0]['ven_description']));
                v.setType(rows[0]['ven_venuetype']);
                v.setZone(rows[0]['ven_zonecode']);
                return v;
        });
        if (vv) resolve(vv);
        else resolve(null);
    })};

    getList() {

    }
}

module.exports = (dbConnectionPool) => { return new venueDBBroker(dbConnectionPool);}
