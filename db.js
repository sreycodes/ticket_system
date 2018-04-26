var mysql = require('mysql')

// var PRODUCTION_DB = 'app_prod_database'
//   , TEST_DB = 'app_test_database'

// exports.MODE_TEST = 'mode_test'
// exports.MODE_PRODUCTION = 'mode_production'

var pool = null
var lid = 0;

exports.connect = async function(done) {
  pool = await createPool();
  updateLID(done);
}

function createPool() {
  return new Promise(resolve => {
    resolve(mysql.createPool({
      host: 'localhost',
      user: 'root',
      password: 'password',
      database: 'tickets'
    }));
  });
}

function updateLID(done) {
  pool.query('SELECT * FROM ticket ORDER BY ID DESC LIMIT 1', function(err, res) {
    if (err) return done(new Error('Could not retrieve last row'))
    else
      if(res[0] != undefined) lid = res[0].id;
      done();
  });
}

exports.get = function() {
  return pool;
}

exports.getById = function(id, done) {
  if (!pool) return done(new Error('Missing database connection.'))
  else {
    pool.query('SELECT * FROM ticket WHERE id = ?', id, function(err, res) {
      if(err) return done(new Error('Query failed'))
      else {
        return done(null, res)
      }
    });
  }
}

exports.insert = function(row, done) {
  if (!pool) return done(new Error('Missing database connection.'))
  else {
    pool.query('INSERT INTO ticket SET ?', row, function(err, res) {
        if(err) return done(new Error('Query failed'))
        else {
          row.id = ++lid;
          return done(null, row)
        }
      });
  }
}

exports.update = function(row, done) {
  if (!pool) return done(new Error('Missing database connection.'))
  else {
    pool.query('UPDATE ticket SET subject = ?, description = ?, email = ? WHERE id = ?', 
      [row.subject, row.description, row.email, row.id], function(err, res) {
        if(err) return done(new Error('Query failed'))
        else {
          console.log(res);
          return done(null, row)
        }
      });
  }
}

exports.delete = function(id, done) {
  if (!pool) return done(new Error('Missing database connection.'))
  else {
    pool.query('DELETE FROM ticket WHERE id = ?', id, function(err, res) {
        if(err) return done(new Error('Query failed'))
        else {
          if(lid == id) {
            return updateLID(done);
          }
          return done(null);
        }
      });
  }
}