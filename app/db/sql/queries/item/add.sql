/*
    Add a new item
*/
INSERT INTO item(name, description)
VALUES(
    ${itemName},
    ${itemDescription}
)
RETURNING *