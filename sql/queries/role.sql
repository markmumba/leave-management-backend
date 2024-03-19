-- name: FindRole :one
SELECT
  *
FROM
  Roles
WHERE
  role_name = $1;


-- name: UpdateRole :exec
UPDATE
  Roles
SET
  role_name = $1
WHERE
  role_id = $1;


-- name: DeleteRole :exec
DELETE FROM
  Roles
WHERE
  role_id = $1;