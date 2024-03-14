-- +goose Up 
CREATE TABLE
  LeaveTypes (
    leave_type_id SERIAL PRIMARY KEY,
    leave_type_name VARCHAR(50) NOT NULL,
    default_entitlement INT NOT NULL
  );


-- +goose Down 
DROP TABLE
  LeaveTypes;