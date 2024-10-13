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

-- Update session blocking status
-- name: UpdateSessionBlocked :exec
UPDATE sessions
SET is_blocked = $1
WHERE id = $2;
