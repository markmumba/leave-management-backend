-- +goose Up
CREATE TABLE
  LeaveRequests (
    request_id SERIAL PRIMARY KEY,
    user_id INT,
    leave_type_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    reason TEXT,
    manager_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (leave_type_id) REFERENCES LeaveTypes(leave_type_id),
    FOREIGN KEY (manager_id) REFERENCES Users(user_id)
  );


-- +goose Down
DROP TABLE
  LeaveRequests;