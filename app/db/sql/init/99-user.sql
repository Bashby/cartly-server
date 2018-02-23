-- Connect to database
\connect bodego


-- Create user
CREATE USER bodego_db_docker_user WITH PASSWORD 'bodegodb';

-- Grant user control of database, tables, indexes
GRANT ALL PRIVILEGES ON DATABASE bodego TO bodego_db_docker_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO bodego_db_docker_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO bodego_db_docker_user;