DROP DATABASE IF EXISTS AppSchema;
CREATE DATABASE IF NOT EXISTS AppSchema;

USE AppSchema;

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users
(
  id INT PRIMARY KEY,
  created_at DATETIME,
  home_country_id INT, 
  gender VARCHAR(255),
  email VARCHAR(255),
  travelling_country_id INT
);

DROP TABLE IF EXISTS user_interests;
CREATE TABLE IF NOT EXISTS user_interests
(
  interests_id INT PRIMARY KEY,
  user_id INT,
  country_id INT,
  FOREIGN KEY (user_id) REFERENCES users (id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  FOREIGN KEY (country_id) REFERENCES country (id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

DROP TABLE IF EXISTS country;
CREATE TABLE IF NOT EXISTS country
(
  id INT PRIMARY KEY,
  country_name VARCHAR(255),
  region VARCHAR(255)
);

DROP TABLE IF EXISTS article;
CREATE TABLE IF NOT EXISTS article
(
  id INT PRIMARY KEY,
  content VARCHAR(15000),
  country_id INT,
  sentiment_score FLOAT,
  title VARCHAR(255),
  publication_date DATETIME,
  FOREIGN KEY (country_id) REFERENCES country (id)
);
