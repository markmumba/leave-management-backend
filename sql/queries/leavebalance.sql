-- name: CreateBalance :exec
INSERT INTO
  LeaveBalances(user_id, leave_type_id, balance)
VALUES
($1, $2, $3);


-- name: UpdateLeaveBalance :exec
UPDATE
  LeaveBalances
SET
  balance = $1
WHERE
  balance_id = $2;