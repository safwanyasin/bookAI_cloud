CREATE TABLE Users(
    user_id VARCHAR(50) PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE ReadingList(
    book_id VARCHAR(50) PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    author_name VARCHAR(255) NOT NULL,
    book_name VARCHAR(500) NOT NULL,
    category VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    image_url VARCHAR(1000) NOT NULL,
    language VARCHAR(10) NOT NULL,
    page_count INT NOT NULL,
    publish_date VARCHAR(10) NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE
);

CREATE TABLE WishList(
    book_id VARCHAR(50) PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    author_name VARCHAR(255) NOT NULL,
    book_name VARCHAR(500) NOT NULL,
    category VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    image_url VARCHAR(1000) NOT NULL,
    language VARCHAR(10) NOT NULL,
    page_count INT NOT NULL,
    publish_date VARCHAR(10) NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE
);

CREATE TABLE GeneratedStories(
    story_id VARCHAR(50) PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE
);
