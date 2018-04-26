var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
	var token = req.headers['x-access-token'];
  	if (!token || token != process.env.token) {
  		return res.status(401).send('Wrong token provided.');
  	}
	if(req.param('id')) {
		res.redirect('/tickets/' + req.param('id'));
	} else {
  	res.render('index', { title: 'My ticket system' });
  }
});


module.exports = router;
