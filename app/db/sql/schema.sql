-- Create database
CREATE DATABASE IF NOT EXISTS cartly;

-- Connect to database
\connect cartly

-- Load database extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-----------------------
-- referenced tables --
-----------------------
-- address
CREATE TABLE address (
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
    line1 TEXT NOT NULL,
    line2 TEXT,
    city VARCHAR(25) NOT NULL,
    state VARCHAR(2) NOT NULL,
    postcode VARCHAR(20) NOT NULL,
    postcode_plus_four VARCHAR(4),
    country VARCHAR(2) NOT NULL, -- ISO 3166-1 alpha-2 code
    geolocation POINT NOT NULL, -- lat long GPS position
    timezone text NOT NULL -- e.g. America/New_York
);

-----------------
-- core tables --
-----------------
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
CREATE INDEX ON category (name);

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
CREATE INDEX ON retailer (name);

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
    address integer REFERENCES address(id)
);
CREATE INDEX ON store (name);

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
    name TEXT NOT NULL
);
CREATE INDEX ON item (name);

-- order
-- NOTE: order is a reserved word, you must wrap it in "" (double quotes) to refer to it
CREATE TABLE "order" (
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
CREATE INDEX ON "order" (name);

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
CREATE INDEX ON customer (name);

-----------------
-- join tables --
-----------------
-- item_category
CREATE TABLE item_category (
    -- base columns
    uuid UUID NOT NULL DEFAULT uuid_generate_v4(),
    created timestamptz NOT NULL DEFAULT now(),
    created_by text,
    last_modified timestamptz,
    last_modified_by text,
    deleted timestamptz,
    deleted_by text,

    -- table columns
   item INTEGER REFERENCES item(id),
   category INTEGER REFERENCES category(id),
   PRIMARY KEY(item, category)
);
