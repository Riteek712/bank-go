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

-- Get account by ID
-- name: GetAccountByID :one
SELECT * FROM accounts
WHERE id = $1
LIMIT 1;
