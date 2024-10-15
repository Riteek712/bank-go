package sqlc

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)

const (
	dbDriver = "postgres"
	dbSource = "postgresql://postgres:riteek@localhost:5432/simple_bank?sslmode=disable"
)

var testQueries *Queries
var testDB *sql.DB

func TestMain(m *testing.M) {
	var err error
	// Open the database connection
	testDB, err = sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("Cannot connect to db:", err)
	}

	// Initialize the Queries object with the DB connection
	testQueries = New(testDB)

	// Run tests
	os.Exit(m.Run())
}
