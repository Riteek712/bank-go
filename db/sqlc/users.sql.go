// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.27.0
// source: users.sql

package sqlc

import (
	"context"
	"time"
)

const createUser = `-- name: CreateUser :exec
INSERT INTO users (
  username, role, hashed_password, full_name, email, is_email_verified, password_changed_at, created_at
) VALUES (
  $1, $2, $3, $4, $5, $6, $7, $8
)
`

type CreateUserParams struct {
	Username          string
	Role              string
	HashedPassword    string
	FullName          string
	Email             string
	IsEmailVerified   bool
	PasswordChangedAt time.Time
	CreatedAt         time.Time
}

// Create a new user
func (q *Queries) CreateUser(ctx context.Context, arg CreateUserParams) error {
	_, err := q.db.ExecContext(ctx, createUser,
		arg.Username,
		arg.Role,
		arg.HashedPassword,
		arg.FullName,
		arg.Email,
		arg.IsEmailVerified,
		arg.PasswordChangedAt,
		arg.CreatedAt,
	)
	return err
}

const getUserByUsername = `-- name: GetUserByUsername :one
SELECT username, role, hashed_password, full_name, email, is_email_verified, password_changed_at, created_at FROM users
WHERE username = $1
LIMIT 1
`

// Get a user by username
func (q *Queries) GetUserByUsername(ctx context.Context, username string) (User, error) {
	row := q.db.QueryRowContext(ctx, getUserByUsername, username)
	var i User
	err := row.Scan(
		&i.Username,
		&i.Role,
		&i.HashedPassword,
		&i.FullName,
		&i.Email,
		&i.IsEmailVerified,
		&i.PasswordChangedAt,
		&i.CreatedAt,
	)
	return i, err
}

const updateEmailVerified = `-- name: UpdateEmailVerified :exec
UPDATE users
SET is_email_verified = TRUE
WHERE username = $1
`

// Update user's email verification status
func (q *Queries) UpdateEmailVerified(ctx context.Context, username string) error {
	_, err := q.db.ExecContext(ctx, updateEmailVerified, username)
	return err
}
