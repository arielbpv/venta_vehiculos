const bodyParser = require ('body-parser');
const express = require ('express');
const app = express();
const path = require ('path');

//middleware
app.use(express.json());

//rutas
app.use(require('./routes/consultas'));

//Servidor
app.listen(app.get('port'),()=>{
    console.log('Servidor conectado en el puerto',app.get('port'))
});