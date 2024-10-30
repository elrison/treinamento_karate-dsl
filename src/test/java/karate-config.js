function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
    config.url = 'http://localhost:3000';
  } else if (env == 'qa') {
    config.url = 'http://localhost:3099';
  }
  return config;
}