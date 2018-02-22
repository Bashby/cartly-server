/*
    Update an existing customer
*/
UPDATE
    customer
SET
    name = ${customerName}
WHERE
    id = ${customerId}
RETURNING
    *