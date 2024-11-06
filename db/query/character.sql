-- name: CreateCharacter :one
INSERT INTO characters (
    name
) 
VALUES (
    $1
) RETURNING *;
