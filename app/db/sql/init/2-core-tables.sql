-- Connect to database
\connect bodego


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
    name TEXT NOT NULL
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
    contact INTEGER REFERENCES contact(id),
    retailer INTEGER REFERENCES retailer(id),
    hours TEXT,
    rating TEXT
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