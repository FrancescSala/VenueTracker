const mysql = require('mysql2/promise');

async function main() {
const connection = await mysql.createConnection({
        host: 'localhost',
        database : 'venue_implementation_tracker',
        user     : 'root',
        password : 'rootAdmin2022', 
    });
const [res1] = await connection.query("SELECT 1 FROM DUAL", []);
console.log(res1);
const [res2] = await connection.query("SELECT * FROM venues WHERE ven_venuecode = 'BOS'", []);
console.log(res2);
const [res3] = await connection.query("SELECT * FROM venues WHERE ven_venuecode = 'COS'", []);
console.log(res3);
const [res4] = await connection.execute("SELECT * FROM venues WHERE ven_venuecode = ?", ['CSC']);
console.log(res4);
}

main();
