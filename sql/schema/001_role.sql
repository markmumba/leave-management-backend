-- +goose Up
CREATE TABLE
  Roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
  );


-- +goose Down
DROP TABLE
  Roles;