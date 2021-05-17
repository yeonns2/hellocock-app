const http = require('http');
const express = require('express');


const app = express();
const server = http.createServer(app);
const port = 3000;

var kakaocertRouter = require('./routes/kakaocert');

app.set('view engine', 'ejs');
app.set('views', './views');
app.use('/kakaocert', kakaocertRouter);

server.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`);
  });

