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
    timezone_offset TEXT NOT NULL, -- e.g. -6:00
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
    created_by TEXT,
    last_modified timestamptz,
    last_modified_by TEXT,
    deleted timestamptz,
    deleted_by TEXT,

    -- table columns
    email_address TEXT,
    home_page_url TEXT
    -- phone_number INTEGER REFERENCES phone_number (id),
    -- fax_number INTEGER REFERENCES phone_number (id),
    -- physical_address INTEGER REFERENCES address (id),
    -- shipping_address INTEGER REFERENCES address (id),
    -- curbside_pickup_address INTEGER REFERENCES address (id)
);