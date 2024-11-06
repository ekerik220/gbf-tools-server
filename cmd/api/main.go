package main

import (
	"context"
	"database/sql"
	"fmt"
	"log"

	_ "github.com/jackc/pgx/v5/stdlib"

	db "github.com/ekerik220/gbf-tools-server/db/sqlc"
)

const (
	dbDriver = "pgx"
	dbSource = "postgresql://root:secret@localhost:5432/gbf-tools?sslmode=disable"
)

func main() {
	conn, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}
	defer conn.Close()

	queries := db.New(conn)

	character, err := queries.CreateCharacter(context.Background(), "test")
	if err != nil {
		log.Fatal("cannot create character:", err)
	}

	fmt.Println(character)
}
