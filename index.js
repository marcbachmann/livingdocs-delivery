require('coffee-script/register');
require('./server').listen(process.env.PORT || '8080', function(){
  console.log('Server started on http://localhost:8080');
});
