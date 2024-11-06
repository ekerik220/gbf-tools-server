postgres:
	docker run --name postgres17 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -p 5432:5432 -d postgres:17-alpine

createdb:
	docker exec -it postgres17 createdb --username=root --owner=root gbf-tools

dropdb:
	docker exec -it postgres17 dropdb gbf-tools

migrateup:
	migrate -database "postgresql://root:secret@localhost:5432/gbf-tools?sslmode=disable" -path db/migration up

migratedown:
	migrate -database "postgresql://root:secret@localhost:5432/gbf-tools?sslmode=disable" -path db/migration down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc