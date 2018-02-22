/*
    Update an existing requisition
*/
UPDATE
    requisition
SET
    name = ${requisitionName}
WHERE
    id = ${requisitionId}
RETURNING
    *