/*
    Add a new store
*/
INSERT INTO store(name)
VALUES(
    ${storeName}
)
RETURNING *