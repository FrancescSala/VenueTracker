const venue = require('./venue.js');

class venueDBBroker2 {
    
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

    async getById(code) {
        let sql = "SELECT * FROM venues WHERE ven_venuecode = ?";
        let [rows] = await this.dbConnPool.execute(sql, [code]);
        if (rows.length === 0)  return null;
        let v = venue();
        v.setCode(rows[0]['ven_venuecode']);
        v.setName(rows[0]['ven_venuename']);
        v.setDescription((rows[0]['ven_description']));
        v.setType(rows[0]['ven_venuetype']);
        v.setZone(rows[0]['ven_zonecode']);
        return v;
    };

    getList() {

    }
}

module.exports = (dbConnectionPool) => { return new venueDBBroker2(dbConnectionPool);}
/*
CREATE TABLE venues (
    ven_venuecode varchar(3) NOT NULL,
    ven_venuename varchar(35) NOT NULL,
    ven_description varchar(50),
    ven_venuetype varchar(20) NOT NULL,
    ven_zonecode varchar(3) NOT NULL
    */