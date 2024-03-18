-- +goose Up 
ALTER TABLE
  LeaveRequests
ALTER COLUMN
  status
SET
  DEFAULT 'pending';