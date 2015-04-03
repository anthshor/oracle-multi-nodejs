var oracledb = require('oracledb');
var http = require('http');

oracledb.getConnection(
  {
    user          : "hr",
    password      : "welcome",
    connectString : "//192.168.33.11:1521/fred"
  },
  function(err, connection)
  {
    if (err) { console.error(err); return; }
    connection.execute(
      "SELECT department_id, department_name "
    + "FROM departments "
    + "WHERE department_id = 180 "
    + "ORDER BY department_id",
      function(err, result)
      {
        if (err) { console.error(err); return; }
         http.createServer(function (request, response) {
           response.writeHead(200, {'Content-Type': 'text/html'});
           response.end("Results = " + result.rows);
           }).listen(7000);
        console.log('Server started');
      });
  });
