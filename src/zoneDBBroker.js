const zone = require('./zone.js');

class zoneDBBroker {
    
    constructor(dbConnPool) {
        this.dbConnPool = dbConnPool;
    }

    insert(zone) {
    }

    update(venue) {

    }

    delete(code) {

    }

    async getById(code) {
        let sql = 'SELECT * FROM zones WHERE zon_zonecode = ?';
        let [rows] = await this.dbConnPool.execute(sql, [code]);
        if (rows.length === 0)  return null;
        let z = zone();
        z.setCode(rows[0]['zon_zonecode']);
        z.setName(rows[0]['zon_zonename']);
        z.setDescription((rows[0]['zone_description']));
        return z;
    };

    getList() {

    }
}

module.exports = (dbConnectionPool) => { return new zoneDBBroker(dbConnectionPool);}
