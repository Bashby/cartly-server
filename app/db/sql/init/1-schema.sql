-- Create database
CREATE DATABASE bodego;

-- Connect to database
\connect bodego

-- Load database extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

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
    timezone text NOT NULL, -- e.g. America/New_York
    classification TEXT NOT NULL -- Physical, Billing, Shipping, CurbSidePickup
);

-- phone_number
CREATE TABLE phone_number (
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
    phone_number TEXT NOT NULL,
    classification TEXT NOT NULL -- Home, Work, Mobile, Emergency, Fax, Pager
);
CREATE INDEX ON phone_number (phone_number);

-- contact
CREATE TABLE contact (
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
    -- phone_number TEXT,
    -- fax_number TEXT,
    email_address TEXT,
    url TEXT
    -- physical_address INTEGER REFERENCES address (id)
    -- shipping_address INTEGER REFERENCES address (id)
    -- pickup_address INTEGER REFERENCES address (id)
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
    contact INTEGER REFERENCES contact(id),
    retailer INTEGER REFERENCES retailer(id),
    hours TEXT,
    rating TEXT
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
    name TEXT NOT NULL,
    description TEXT,
    retailer INTEGER REFERENCES retailer(id)
);
CREATE INDEX ON item (name);

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
CREATE INDEX ON requisition (name);

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
-- contact_address
CREATE TABLE contact_address (
    -- base columns
    uuid UUID NOT NULL DEFAULT uuid_generate_v4(),
    created timestamptz NOT NULL DEFAULT now(),
    created_by text,
    last_modified timestamptz,
    last_modified_by text,
    deleted timestamptz,
    deleted_by text,

    -- mapping columns
    contact INTEGER REFERENCES contact(id),
    address INTEGER REFERENCES address(id),
    CONSTRAINT contact_address_pkey PRIMARY KEY(contact, address)
);

-- contact_phone_number
CREATE TABLE contact_phone_number (
    -- base columns
    uuid UUID NOT NULL DEFAULT uuid_generate_v4(),
    created timestamptz NOT NULL DEFAULT now(),
    created_by text,
    last_modified timestamptz,
    last_modified_by text,
    deleted timestamptz,
    deleted_by text,

    -- mapping columns
    contact INTEGER REFERENCES contact(id),
    phone_number INTEGER REFERENCES phone_number(id),
    CONSTRAINT contact_phone_number_pkey PRIMARY KEY(contact, phone_number)
);

-- retailer_store
CREATE TABLE retailer_store (
    -- base columns
    uuid UUID NOT NULL DEFAULT uuid_generate_v4(),
    created timestamptz NOT NULL DEFAULT now(),
    created_by text,
    last_modified timestamptz,
    last_modified_by text,
    deleted timestamptz,
    deleted_by text,

    -- mapping columns
    retailer INTEGER REFERENCES retailer(id),
    store INTEGER REFERENCES store(id),
    CONSTRAINT retailer_store_pkey PRIMARY KEY(retailer, store)
);

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

    -- mapping columns
    item INTEGER REFERENCES item(id),
    category INTEGER REFERENCES category(id),
    CONSTRAINT item_category_pkey PRIMARY KEY(item, category)
);

-- item_store
CREATE TABLE item_store (
    -- base columns
    uuid UUID NOT NULL DEFAULT uuid_generate_v4(),
    created timestamptz NOT NULL DEFAULT now(),
    created_by text,
    last_modified timestamptz,
    last_modified_by text,
    deleted timestamptz,
    deleted_by text,

    -- mapping columns
    item INTEGER REFERENCES item(id),
    store INTEGER REFERENCES store(id),
    CONSTRAINT item_store_pkey PRIMARY KEY(item, store),

    -- meta columns
    stock INTEGER,
    order_limit INTEGER,
    price INTEGER,
    currency TEXT
);

-- customer_requisition
CREATE TABLE customer_requisition (
    -- base columns
    uuid UUID NOT NULL DEFAULT uuid_generate_v4(),
    created timestamptz NOT NULL DEFAULT now(),
    created_by text,
    last_modified timestamptz,
    last_modified_by text,
    deleted timestamptz,
    deleted_by text,

    -- mapping columns
    customer INTEGER REFERENCES customer(id),
    requisition INTEGER REFERENCES requisition(id),
    CONSTRAINT customer_requisition_pkey PRIMARY KEY(customer, requisition)
);
