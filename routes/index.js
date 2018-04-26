var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
	if(req.param('id')) {
		res.redirect('/tickets/' + req.param('id'));
	} else {
  	res.render('index', { title: 'My ticket system' });
  }
});


module.exports = router;
