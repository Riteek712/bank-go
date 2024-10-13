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
