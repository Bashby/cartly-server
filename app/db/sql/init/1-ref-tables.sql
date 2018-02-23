-- Connect to database
\connect bodego


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
    timezone TEXT NOT NULL, -- e.g. America/New_York
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