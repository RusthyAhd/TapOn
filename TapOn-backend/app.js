const express = require('express'); //import express package

const body_parsar = require('body-parser');

const OwnerRouter = require('./routes/OwnerRoutes');

const app=express();

app.use(body_parsar.json());

app.use('/',OwnerRouter);

module.exports =app;