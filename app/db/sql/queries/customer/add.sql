/*
    Add a new customer
*/
INSERT INTO customer(name)
VALUES(
    ${customerName}
)
RETURNING *