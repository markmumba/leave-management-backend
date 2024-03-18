-- name: CreateRole :exec
INSERT INTO
  Roles(role_name)
VALUES
  ($1);


-- name: UpdateRole :exec
UPDATE
  Roles
SET
  role_name = $1
WHERE
  role_id = $1;