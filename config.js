// WARNING: Intentionally vulnerable file for training purposes
// NEVER commit real secrets to repositories

const config = {
  aws: {
    accessKeyId: 'AKIAIOSFODNN7EXAMPLE',
    secretAccessKey: 'wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY'
  },
  database: {
    connectionString: 'postgresql://admin:SuperSecret123!@db.example.com:5432/prod'
  },
  stripe: {
    secretKey: 'sk_live_51234567890abcdefghijklmnop'
  },
  jwt: {
    secret: 'my-super-secret-jwt-key-do-not-share'
  }
};

module.exports = config;

