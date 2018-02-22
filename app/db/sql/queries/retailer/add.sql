/*
    Add a new retailer
*/
INSERT INTO retailer(name)
VALUES(
    ${retailerName}
)
RETURNING *