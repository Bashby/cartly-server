/*
    Update an existing retailer
*/
UPDATE
    retailer
SET
    name = ${retailerName}
WHERE
    id = ${retailerId}
RETURNING
    *