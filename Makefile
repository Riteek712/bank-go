postgres:
	docker run --name simpleBankGo -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=riteek -d postgres:12-alpine

createdb:
	docker exec -it simpleBankGo createdb --username=postgres --owner=postgres simple_bank
dropdb:
	docker exec -it simpleBankGo dropdb --username=postgres --owner=postgres simple_bank
migrateup:
	migrate -path db/migration -database "postgresql://postgres:riteek@localhost:5432/simple_bank?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://postgres:riteek@localhost:5432/simple_bank?sslmode=disable" -verbose down
sqlc:
	sqlc generate
PHONY: postgres createdb dropdb migrateup migratedown