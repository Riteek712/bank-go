-- users.sql

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

-- verify_emails.sql

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

-- accounts.sql

-- Create a new account
-- name: CreateAccount :exec
INSERT INTO accounts (
  owner, balance, currency, created_at
) VALUES (
  $1, $2, $3, $4
);

-- Get account by owner
-- name: GetAccountByOwner :one
SELECT * FROM accounts
WHERE owner = $1
LIMIT 1;

-- Update account balance
-- name: UpdateAccountBalance :exec
UPDATE accounts
SET balance = $1
WHERE id = $2;

-- entries.sql

-- Create a new entry
-- name: CreateEntry :exec
INSERT INTO entries (
  account_id, amount, created_at
) VALUES (
  $1, $2, $3
);

-- Get entries by account ID
-- name: GetEntriesByAccountID :many
SELECT * FROM entries
WHERE account_id = $1;

-- transfers.sql

-- Create a new transfer
-- name: CreateTransfer :exec
INSERT INTO transfers (
  from_account_id, to_account_id, amount, created_at
) VALUES (
  $1, $2, $3, $4
);

-- Get transfers by from_account_id and to_account_id
-- name: GetTransfers :many
SELECT * FROM transfers
WHERE from_account_id = $1 OR to_account_id = $2;

-- sessions.sql

-- Create a new session
-- name: CreateSession :exec
INSERT INTO sessions (
  id, username, refresh_token, user_agent, client_ip, is_blocked, expires_at, created_at
) VALUES (
  $1, $2, $3, $4, $5, $6, $7, $8
);

-- Get session by ID
-- name: GetSessionByID :one
SELECT * FROM sessions
WHERE id = $1
LIMIT 1;
