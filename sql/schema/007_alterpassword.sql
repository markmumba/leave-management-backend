-- +goose Up 

-- Step 1: Add a new column with the desired data type
ALTER TABLE Users ADD COLUMN password_new CHAR(60);

-- Step 2: Update the new column with the existing data from the old column
UPDATE Users SET password_new = password;

-- Step 3: Drop the old column
ALTER TABLE Users DROP COLUMN password;

-- Step 4: Rename the new column to match the original column name
ALTER TABLE Users RENAME COLUMN password_new TO password;
