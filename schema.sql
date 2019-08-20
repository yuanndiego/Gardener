-- Type 'psql' & enter to access the postgresql terminal --

-- Copy & Paste this content --

CREATE DATABASE gardener_db;

\c gardener_db;

CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(300),
    email VARCHAR(300),
    password_digest VARCHAR(300)
);

CREATE TABLE Plants (
    id SERIAL PRIMARY KEY,
    common_name VARCHAR(300),
    scientific_name VARCHAR(300),
    image_url VARCHAR(400)
);

CREATE TABLE Tasks (
    id SERIAL PRIMARY KEY,
    plant_id INTEGER,
    name VARCHAR(300),
    description VARCHAR(400),
    due_date TIMESTAMP
);

CREATE TABLE Todos (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    plant_id INTEGER,
    task_id INTEGER,
    complete BOOLEAN
);