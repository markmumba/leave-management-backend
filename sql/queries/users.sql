-- name: CreateUser :one
INSERT INTO
  Users(username, password, email, role_id)
VALUES
  ($1, $2, $3) RETURNING user_id;


-- name: FindUserById :one
SELECT
  *
FROM
  Users
WHERE
  user_id = $1;


-- name: FindUsersByRole :many
SELECT
  *
FROM
  Users
WHERE
  role_id = $1;


-- name: AuthenticateUser :exec
SELECT
  *
FROM
  Users
WHERE
  email = $1
  AND password = $2;


-- name: DeleteUser :exec
DELETE FROM
  Users
WHERE
  user_id = $1;