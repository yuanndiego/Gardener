-- Type 'psql' & enter to access the postgresql terminal --

-- Copy & Paste this content --

-- Copy Step 1 --
CREATE DATABASE gardener_db;

-- Copy Step 2 --
\c gardener_db;

-- Confirm connection & copy Step 3 --
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
    due_date DATE
);

CREATE TABLE Todos (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    plant_id INTEGER,
    task_id INTEGER,
    complete BOOLEAN
);