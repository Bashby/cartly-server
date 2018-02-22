/*
    Update an existing item
*/
UPDATE
    item
SET
    name = ${itemName}
    description = ${itemDescription}
WHERE
    id = ${itemId}
RETURNING
    *