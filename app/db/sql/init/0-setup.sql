-- Create database
CREATE DATABASE bodego;

-- Connect to database
\connect bodego

-- Load database extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp"; -- uuid generation
CREATE EXTENSION IF NOT EXISTS "pg_trgm"; -- trigram fuzzy text searching