const router = require('express').Router();

const OwnerController = require('../controllers/Owner.Controller');

router.post('/registration',OwnerController.register);

module.exports = router;
