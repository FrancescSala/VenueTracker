let express = require('express');
let app = express();
console.log('Hello World');
console.log("dirname is: ",__dirname);
const serveForm = (req,res) => {
    res.sendFile(__dirname + "/views/index.html");
};

app.get('/',serveForm);
