-- +goose Up
CREATE TYPE Roletype AS ENUM ('admin', 'staff', 'hr', 'manager');


CREATE TABLE
  Roles (
    role_id SERIAL PRIMARY KEY,
    role_name Roletype NOT NULL
  );


-- +goose Down
DROP TABLE
  Roles;