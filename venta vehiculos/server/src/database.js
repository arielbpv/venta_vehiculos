const mysql = require('mysql');

const conn =  mysql.createConnection({
    host:'localhost',
    user: 'root',
    password: '',
    database:'venta_vehiculo'
});

conn.connect(function(err){
    if(err){
        console.log(err);
        return;
    }else{
        console.log('bd conectada')
    }
});

module.exports = conn;