-- name: CreateLeaveType :exec 
INSERT INTO
  LeaveTypes (leave_type_name, default_entitlement)
VALUES
  ($1, $2);


-- name: UpdateLeaveType :exec
UPDATE
  LeaveTypes
SET
  leave_type_id = $1,
  default_entitlement = $2
WHERE
  leave_type_id = $3;


-- name: DeleteLeaveType :exec
DELETE FROM
  LeaveTypes
WHERE
  leave_type_id = $1;