-- Connect to database
\connect bodego


-- address

-- phone_number
CREATE INDEX ON phone_number (phone_number);

-- contact

-- category
CREATE INDEX ON category (name);

-- retailer
CREATE INDEX ON retailer (name);

-- store
CREATE INDEX ON store (name);

-- item
CREATE INDEX ON item (name);
CREATE INDEX tsv_item_idx ON item USING GIN (search_vector_item);

-- requisition
CREATE INDEX ON requisition (name);

-- customer
CREATE INDEX ON customer (name);
