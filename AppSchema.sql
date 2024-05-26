DROP DATABASE IF EXISTS AppSchema;
CREATE DATABASE IF NOT EXISTS AppSchema;

USE AppSchema;

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users
(
  user_id INT PRIMARY KEY,
  created_at DATETIME,
  home_country VARCHAR(255),
  gender VARCHAR(255)
);

DROP TABLE IF EXISTS user_emails;
CREATE TABLE IF NOT EXISTS user_emails
(
  user_id INT,
  email VARCHAR(255) UNIQUE NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (user_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);
