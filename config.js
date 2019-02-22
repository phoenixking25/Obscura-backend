const env = process.env.NODE_ENV; // 'dev' or 'test'

const dev = {
  app: {
    PORT: 8000,
    SESSION_SECRET: 'secret',
    WEB_TOKEN_SECRET: 'secret',
    jwt_expiry_time: '12h',
    nitkkr_domain_email: false,
  },
  db: {
    url: 'mongodb://anuj:sharma1@ds117623.mlab.com:17623/obscura_prod', // Your MLAB database url
    port: 27017,
    name: 'test',
  },
  api: {
    google: 'https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=',
  },
};

const prod = {
  app: {
    port: 3000,
  },
  db: {
    host: 'localhost',
    port: 27017,
    name: 'test',
  },
};

const config = {
  dev,
  prod,
};

export default config[env];
