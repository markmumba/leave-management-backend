-- name: CreateUser :one
INSERT INTO
  Users(username, password, email)
VALUES
  ($1, $2, $3) RETURNING user_id;

