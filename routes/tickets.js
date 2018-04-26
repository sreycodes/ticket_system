var express = require('express');
var router = express.Router();
var db = require('../db')

/* GET users listing. */
router.get('/:id', function(req, res, next) {
  var id = req.params.id;
	db.getById(id, function(err, result) {
  	if(err) 
  		throw err;
  	else 
  		res.render('result', { result: result[0], GET: true});
  	});
});

router.post('/', function(req, res, next) {
	var subject = req.body.subject;
	var description = req.body.description;
	var email = req.body.email;
	var row = {subject: subject, description: description, email: email};
	db.insert(row, function(err, result) {
			if(err) 
	  		throw err;
	  	else 
	  		res.render('result', { result: result, POST: true});
		});
});

router.put('/:id', function(req, res, next) {
	var id = req.params.id;
	var subject = req.body.subject;
	var description = req.body.description;
	var email = req.body.email;
	var row = {id: id, subject: subject, description: description, email: email};
	console.log(row);
	db.update(row, function(err, result) {
			if(err) 
	  		throw err;
	  	else 
	  		res.redirect('/tickets/'+id);
		});
});

router.delete('/:id', function(req, res, next) {
	var id = req.params.id;
	db.delete(id, function(err) {
			if(err) 
	  		throw err;
	  	res.redirect('/');
		});
});

module.exports = router;
