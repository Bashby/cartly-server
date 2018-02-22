/*
    Update an existing store
*/
UPDATE
    store
SET
    name = ${storeName}
WHERE
    id = ${storeId}
RETURNING
    *