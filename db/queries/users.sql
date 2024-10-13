-- Get a user by username
-- name: GetUserByUsername :one
SELECT * FROM users
WHERE username = $1
LIMIT 1;

-- Create a new user
-- name: CreateUser :exec
INSERT INTO users (
  username, role, hashed_password, full_name, email, is_email_verified, password_changed_at, created_at
) VALUES (
  $1, $2, $3, $4, $5, $6, $7, $8
);

-- Update user's email verification status
-- name: UpdateEmailVerified :exec
UPDATE users
SET is_email_verified = TRUE
WHERE username = $1;
