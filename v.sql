CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_date DATE,
    country VARCHAR(100)
);

CREATE TABLE publishers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    founded_year INT
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    author_id INT,
    publisher_id INT,
    genre VARCHAR(100),
    publish_date DATE,
    price DECIMAL(10, 2),
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(id)
);

CREATE TABLE book_reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    review_text TEXT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(id)
);


INSERT INTO authors (name, birth_date, country)
VALUES
    ('J.K. Rowling', '1965-07-31', 'United Kingdom'),
    ('George Orwell', '1903-06-25', 'India'),
    ('Mark Twain', '1835-11-30', 'United States'),
    ('Fyodor Dostoevsky', '1821-11-11', 'Russia'),
    ('Haruki Murakami', '1949-01-12', 'Japan');

INSERT INTO publishers (name, city, founded_year)
VALUES
    ('Penguin Books', 'London', 1935),
    ('HarperCollins', 'New York', 1989),
    ('Vintage Books', 'New York', 1954),
    ('Oxford University Press', 'Oxford', 1586),
    ('Shueisha', 'Tokyo', 1925);

INSERT INTO books (name, author_id, publisher_id, genre, publish_date, price)
VALUES
    ('1984', 2, 1, 'Dystopian', '1949-06-08', 9.99),
    ('Animal Farm', 2, 1, 'Political Fiction', '1945-08-17', 7.99),
    ('Harry Potter and the Philosopher\'s Stone', 1, 1, 'Fantasy', '1997-06-26', 19.99),
    ('The Adventures of Tom Sawyer', 3, 2, 'Adventure', '1876-06-01', 14.99),
    ('Crime and Punishment', 4, 3, 'Psychological Fiction', '1866-01-01', 11.99),
    ('Norwegian Wood', 5, 5, 'Romance', '1987-09-04', 15.99),
    ('Kafka on the Shore', 5, 5, 'Fantasy', '2002-09-12', 17.99),
    ('The Brothers Karamazov', 4, 3, 'Philosophical', '1880-01-01', 13.99),
    ('A Tale of Two Cities', NULL, 2, 'Historical Fiction', '1859-04-30', 10.99),
    ('Great Expectations', NULL, 2, 'Classic', '1861-08-01', 12.99);

INSERT INTO book_reviews (book_id, review_text, rating, review_date)
VALUES
    (1, 'A brilliant dystopian novel.', 5, '2024-11-01'),
    (2, 'A powerful political satire.', 4, '2024-11-02'),
    (3, 'Magical and captivating.', 5, '2024-11-03'),
    (6, 'A deep, emotional read.', 4, '2024-11-04'),
    (9, 'A timeless classic.', 5, '2024-11-05');
'
SELECT * FROM books;

SELECT name AS 'Book Name', genre AS 'Category', price AS 'Price' FROM books;

SELECT * FROM books ORDER BY price DESC;

SELECT * FROM books WHERE genre = 'Fantasy';

SELECT * FROM books LIMIT 5;

SELECT * FROM books WHERE genre IN ('Fantasy', 'Adventure');

SELECT * FROM books WHERE price BETWEEN 10 AND 15;

SELECT * FROM books WHERE name LIKE '%Harry%';

SELECT * FROM books WHERE author_id IS NULL;

SELECT genre, COUNT(*) AS 'Number of Books' FROM books GROUP BY genre;

SELECT 
    books.name AS 'Book Name',
    authors.name AS 'Author',
    publishers.name AS 'Publisher',
    books.genre,
    books.price
FROM books
LEFT JOIN authors ON books.author_id = authors.id
LEFT JOIN publishers ON books.publisher_id = publishers.id;


SELECT 
    COUNT(*) AS 'Total Books',
    AVG(price) AS 'Average Price',
    SUM(price) AS 'Total Price of Books'
FROM books;
