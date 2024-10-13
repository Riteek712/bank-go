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

-- Get transfer by ID
-- name: GetTransferByID :one
SELECT * FROM transfers
WHERE id = $1
LIMIT 1;
