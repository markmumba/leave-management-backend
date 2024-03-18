-- +goose Up
CREATE TABLE
  Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
  );


CREATE INDEX idx_email_on_users ON Users(email);


-- +goose Down 
DROP TABLE
  Users;