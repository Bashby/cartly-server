-- Connect to database
\connect bodego


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
