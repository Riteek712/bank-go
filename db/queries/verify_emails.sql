-- Create a new verification email
-- name: CreateVerifyEmail :exec
INSERT INTO verify_emails (
  username, email, secret_code, is_used, created_at, expired_at
) VALUES (
  $1, $2, $3, $4, $5, $6
);

-- Get verification email by username
-- name: GetVerifyEmailByUsername :one
SELECT * FROM verify_emails
WHERE username = $1
LIMIT 1;

-- Mark verification email as used
-- name: UpdateVerifyEmailUsed :exec
UPDATE verify_emails
SET is_used = TRUE
WHERE id = $1;
