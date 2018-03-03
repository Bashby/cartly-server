-- Connect to database
\connect bodego


-- retailer
CREATE TABLE retailer (
    -- base columns
    id SERIAL PRIMARY KEY,
    uuid UUID NOT NULL DEFAULT uuid_generate_v4(),
    created timestamptz NOT NULL DEFAULT now(),
    created_by text,
    last_modified timestamptz,
    last_modified_by text,
    deleted timestamptz,
    deleted_by text,

    -- table columns
    name TEXT NOT NULL,
    logo TEXT,
    primary_color TEXT,
    secondary_color TEXT
);

-- store
CREATE TABLE store (
    -- base columns
    id SERIAL PRIMARY KEY,
    uuid UUID NOT NULL DEFAULT uuid_generate_v4(),
    created timestamptz NOT NULL DEFAULT now(),
    created_by text,
    last_modified timestamptz,
    last_modified_by text,
    deleted timestamptz,
    deleted_by text,

    -- table columns
    name TEXT NOT NULL,
    address INTEGER REFERENCES address(id),
    contact INTEGER REFERENCES contact(id),
    retailer INTEGER REFERENCES retailer(id),
    hours TEXT[7][2], -- 2d array, 7 days with 2 times, opening and closing
    tax_rate INTEGER
);

-- item
CREATE TABLE item (
    -- base columns
    id SERIAL PRIMARY KEY,
    uuid UUID NOT NULL DEFAULT uuid_generate_v4(),
    created timestamptz NOT NULL DEFAULT now(),
    created_by text,
    last_modified timestamptz,
    last_modified_by text,
    deleted timestamptz,
    deleted_by text,

    -- table columns
    name TEXT NOT NULL,
    description TEXT,
    retailer INTEGER REFERENCES retailer(id),

    -- search columns
    search_vector_item TSVECTOR
);

-- category
CREATE TABLE category (
    -- base columns
    id SERIAL PRIMARY KEY,
    uuid UUID NOT NULL DEFAULT uuid_generate_v4(),
    created timestamptz NOT NULL DEFAULT now(),
    created_by text,
    last_modified timestamptz,
    last_modified_by text,
    deleted timestamptz,
    deleted_by text,

    -- table columns
    name TEXT NOT NULL
);

-- requisition
CREATE TABLE requisition (
    -- base columns
    id SERIAL PRIMARY KEY,
    uuid UUID NOT NULL DEFAULT uuid_generate_v4(),
    created timestamptz NOT NULL DEFAULT now(),
    created_by text,
    last_modified timestamptz,
    last_modified_by text,
    deleted timestamptz,
    deleted_by text,

    -- table columns
    name TEXT NOT NULL
);

-- customer
CREATE TABLE customer (
    -- base columns
    id SERIAL PRIMARY KEY,
    uuid UUID NOT NULL DEFAULT uuid_generate_v4(),
    created timestamptz NOT NULL DEFAULT now(),
    created_by text,
    last_modified timestamptz,
    last_modified_by text,
    deleted timestamptz,
    deleted_by text,

    -- table columns
    name TEXT NOT NULL
);