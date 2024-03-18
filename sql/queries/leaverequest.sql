-- name: LeaveRequest :exec 
INSERT INTO
  LeaveRequests(
    user_id,
    leave_type_id,
    start_date,
    end_date,
    status,
    reason,
    manager_id
  )
VALUES
  ($1, $2, $3, $4, $5, $6, $7);


-- name: GetAllLeaveRequests :many
SELECT
  *
FROM
  LeaveRequests;


-- name: UpdateLeaveRequest :exec
UPDATE
  LeaveRequests
SET
  leave_type_id = $1,
  start_date = $2,
  end_date = $3,
  reason = $4
WHERE
  request_id = $5;


-- name: LeaveStatusUpdate :exec
UPDATE
  LeaveRequests
SET
  status = $1
WHERE
  request_id = $2;


-- name: DeleteLeaveRequest :exec
DELETE FROM
  LeaveRequests
WHERE
  request_id = $1;