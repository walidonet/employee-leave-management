create table if not exists oauth_access_token (
  token_id VARCHAR(255),
  token LONG bytea,
  authentication_id VARCHAR(255) PRIMARY KEY,
  user_name VARCHAR(255),
  client_id VARCHAR(255),
  authentication LONG bytea,
  refresh_token VARCHAR(255)
);

create table if not exists oauth_refresh_token (
  token_id VARCHAR(255),
  token LONG bytea,
  authentication LONG bytea
);
