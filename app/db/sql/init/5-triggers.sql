-- Connect to database
\connect bodego


-- item
CREATE FUNCTION tsv_item_trigger() RETURNS trigger AS $$
begin
  new.search_vector_item :=
     setweight(to_tsvector('pg_catalog.english', coalesce(new.name,'')), 'A') ||
    --  setweight(to_tsvector('pg_catalog.english', coalesce(new.tag,'')), 'A') ||
    --  setweight(to_tsvector('pg_catalog.english', coalesce(new.category,'')), 'A') ||
     setweight(to_tsvector('pg_catalog.english', coalesce(new.description,'')), 'D');
  return new;
end
$$ LANGUAGE plpgsql;

CREATE TRIGGER tsv_item_update BEFORE INSERT OR UPDATE
ON item FOR EACH ROW EXECUTE PROCEDURE tsv_item_trigger();