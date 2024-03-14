-- +goose Up
CREATE TABLE
  LeaveBalances (
    balance_id SERIAL PRIMARY KEY,
    user_id INT,
    leave_type_id INT,
    balance INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (leave_type_id) REFERENCES LeaveTypes(leave_type_id)
  );


-- +goose Down 
DROP TABLE
  LeaveBalances;