/*
    Add a new requisition
*/
INSERT INTO requisition(name)
VALUES(
    ${requisitionName}
)
RETURNING *