const discipline = require('./discipline.js');

class disciplineDBBroker {
    
    constructor(dbConnPool) {
        this.dbConnPool = dbConnPool;
    }

    insert(discipline) {
    }

    update(discipline) {

    }

    delete(discipline) {

    }

    async getById(code) {
        let sql = "SELECT * FROM disciplines WHERE dis_disciplinecode = ?";
        let [rows] = await this.dbConnPool.execute(sql, [code]);
        if (rows.length === 0)  return null;
        let d = discipline();
        d.setCode(rows[0]['dis_disciplinecode']);
        d.setName(rows[0]['dis_disciplinename']);
        return d;
    };

    async getListByVenue(venueCode) {
        let sql = "SELECT disciplines.* FROM disciplines, venuedisciplines WHERE vdi_venuecode = ? AND vdi_disciplinecode = dis_disciplinecode";
        let [rows] = await this.dbConnPool.execute(sql, [venueCode]);
        let disciplines = [];
        for (let disc of rows) {
            let d = discipline();
            d.setCode(disc['dis_disciplinecode']);
            d.setName(disc['dis_disciplinename']);
            disciplines.push(d);
        };
        return disciplines;
    }
}

module.exports = (dbConnectionPool) => { return new disciplineDBBroker(dbConnectionPool);}
