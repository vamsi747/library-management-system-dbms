-- Q1: Display all books
SELECT book_id, title, isbn, publisher_id
FROM Book
ORDER BY book_id;

-- Q2: Books having more than 5 copies
SELECT book_id, title, total_copies
FROM Book
WHERE total_copies > 5
ORDER BY title;

-- Q3: Display currently active loans
SELECT loan_id, book_id, member_id, loan_date, due_date
FROM Loan
WHERE return_date IS NULL
ORDER BY loan_id;
-- Q4: Natural Join
SELECT book_id, title, publisher_name
FROM Book
NATURAL JOIN Publisher;

-- Q5: Equi Join
SELECT b.book_id, b.title, p.publisher_name
FROM Book b, Publisher p
WHERE b.publisher_id = p.publisher_id;

-- Q6: Inner Join
SELECT b.book_id, b.title, p.publisher_name
FROM Book b
INNER JOIN Publisher p
ON b.publisher_id = p.publisher_id;

-- Q7: Left Outer Join
SELECT b.book_id, b.title, p.publisher_name
FROM Book b
LEFT JOIN Publisher p
ON b.publisher_id = p.publisher_id;

-- Q8: Right Outer Join
SELECT b.book_id, b.title, p.publisher_name
FROM Book b
RIGHT JOIN Publisher p
ON b.publisher_id = p.publisher_id;

-- Q9: Full Outer Join
SELECT b.book_id, b.title, p.publisher_name
FROM Book b
FULL OUTER JOIN Publisher p
ON b.publisher_id = p.publisher_id;

-- Q10: Count total books
SELECT COUNT(*) AS total_books
FROM Book;

-- Q11: Total copies
SELECT SUM(total_copies) AS total_copies
FROM Book;


-- Q12: Average number of copies
SELECT AVG(total_copies) AS average_copies
FROM Book;

-- Q13: Maximum copies
SELECT MAX(total_copies) AS maximum_copies
FROM Book;

-- Q14: Minimum copies
SELECT MIN(total_copies) AS minimum_copies
FROM Book;

-- Q15: Number of books by publisher
SELECT publisher_id, COUNT(*) AS book_count
FROM Book
GROUP BY publisher_id
ORDER BY publisher_id;

-- Q16: Total copies by publisher
SELECT publisher_id, SUM(total_copies) AS total_copies
FROM Book
GROUP BY publisher_id
ORDER BY publisher_id;

-- Q17: Publishers having more than one book
SELECT publisher_id, COUNT(*) AS book_count
FROM Book
GROUP BY publisher_id
HAVING COUNT(*) > 1
ORDER BY publisher_id;

-- Q18: Books having copies above the average
SELECT book_id, title, total_copies
FROM Book
WHERE total_copies > (
    SELECT AVG(total_copies)
    FROM Book
)
ORDER BY book_id;

-- Q19: Members who have borrowed at least one book
SELECT m.member_id, m.first_name, m.last_name
FROM Member m
WHERE EXISTS (
    SELECT 1
    FROM Loan l
    WHERE l.member_id = m.member_id
)
ORDER BY m.member_id;

-- View 1: Book and Publisher Details
CREATE VIEW v_book_publisher AS
SELECT b.book_id,
       b.title,
       b.isbn,
       p.publisher_name,
       b.genre
FROM Book b
JOIN Publisher p
ON b.publisher_id = p.publisher_id;

-- View 2: Book Summary by Genre
CREATE VIEW v_book_summary AS
SELECT genre,
       COUNT(book_id) AS total_books
FROM Book
GROUP BY genre;
-- Q20: Display book-publisher report
SELECT book_id, title, publisher_name, genre
FROM v_book_publisher
ORDER BY book_id;

-- Q21: Display genre-wise book summary
SELECT genre, total_books
FROM v_book_summary
ORDER BY total_books DESC;
-- Q22: UNION
SELECT genre
FROM Book
WHERE genre = 'Programming'

UNION

SELECT genre
FROM Book
WHERE genre = 'Database'
ORDER BY genre;

-- Q23: INTERSECT
SELECT genre
FROM Book
WHERE total_copies >= 5

INTERSECT

SELECT genre
FROM Book
WHERE publication_year >= 2020
ORDER BY genre;

-- Q24: EXCEPT
SELECT genre
FROM Book
WHERE total_copies >= 5

EXCEPT

SELECT genre
FROM Book
WHERE publication_year >= 2020
ORDER BY genre;

-- INSERT
INSERT INTO Book
VALUES
(7, 'SQL Fundamentals', 'ISBN007', 4,
 'Database', 2024, 1);

-- UPDATE
UPDATE Book
SET total_copies = 5
WHERE book_id = 7;

-- DELETE
DELETE FROM Book
WHERE book_id = 7;
-- Create user
CREATE USER exam_cell
WITH PASSWORD 'exam@123';

-- Grant permission
GRANT SELECT ON Book TO exam_cell;

-- Grant permission on Loan
GRANT SELECT ON Loan TO exam_cell;

-- Revoke permission
REVOKE SELECT ON Book FROM exam_cell;

BEGIN;

UPDATE Fine
SET fine_amount = 50
WHERE fine_id = 1;

SAVEPOINT after_first_update;

UPDATE Fine
SET fine_amount = 100
WHERE fine_id = 2;

ROLLBACK TO SAVEPOINT after_first_update;

COMMIT;

SELECT fine_id, fine_amount
FROM Fine
WHERE fine_id IN (1, 2)
ORDER BY fine_id;


