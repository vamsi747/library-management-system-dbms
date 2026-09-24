INSERT INTO Publisher
(publisher_id, publisher_name, country, website)
VALUES
(1, 'Penguin Books', 'India', 'https://www.penguin.co.in'),
(2, 'Oxford University Press', 'UK', 'https://global.oup.com'),
(3, 'McGraw Hill', 'USA', 'https://www.mheducation.com'),
(4, 'Pearson Education', 'UK', 'https://www.pearson.com');
INSERT INTO Author
(author_id, first_name, last_name, nationality)
VALUES
(1, 'Ravi', 'Kumar', 'Indian'),
(2, 'Anita', 'Sharma', 'Indian'),
(3, 'John', 'Smith', 'American'),
(4, 'Robert', 'Martin', 'American'),
(5, 'Priya', 'Reddy', 'Indian');
INSERT INTO Member
(member_id, first_name, last_name, email, membership_type,
membership_date, membership_expiry)
VALUES
(101, 'Rahul', 'Reddy', 'rahul.reddy@gmail.com',
'Regular', '2026-01-10', '2027-01-10'),
(102, 'Priya', 'Sharma', 'priya.sharma@gmail.com',
'Premium', '2026-02-15', '2027-02-15'),
(103, 'Arjun', 'Kumar', 'arjun.kumar@gmail.com','Regular', '2026-03-01', '2027-03-01'),
(104, 'Sneha', 'Patel', 'sneha.patel@gmail.com'
'Student', '2026-04-05', '2027-04-05'),(105, 'Karthik', 'Varma', 'karthik.varma@gmail.com',
'Premium', '2026-05-12', '2027-05-12');
INSERT INTO Book
(book_id, title, isbn, total_copies, genre,publication_year, publisher_id)
VALUES
(1001, 'Database Management Systems', 'ISBN1001',5, 'Database', 2024, 1),
(1002, 'Data Structures and Algorithms', 'ISBN1002',4, 'Computer Science', 2023, 2),
(1003, 'Computer Networks', 'ISBN1003',3, 'Networking', 2022, 3),
(1004, 'Operating Systems', 'ISBN1004',6, 'Computer Science', 2024, 1),
(1005, 'Machine Learning', 'ISBN1005',4, 'Artificial Intelligence', 2025, 4),
(1006, 'Web Technologies', 'ISBN1006',5, 'Web Development', 2023, 3),
(1007, 'Clean Code', 'ISBN1007',3, 'Programming', 2021, 2);
INSERT INTO Book_Author
(book_id, author_id)
VALUES
(1001, 1),
(1001, 2),
(1002, 3),
(1003, 4),
(1004, 1),
(1005, 5),
(1006, 2),
(1007, 4);
INSERT INTO Member_Phone (member_id, phone_number)
VALUES
(101, '9876543210'),
(101, '9440011223'),
(102, '9848012345'),
(103, '9701122334'),
(104, '9885566778'),
(105, '9963321456');
INSERT INTO Loan
(loan_id, book_id, member_id, loan_date, due_date, return_date)
VALUES
(5001, 1001, 101, '2026-08-01', '2026-08-15', '2026-08-14'),
(5002, 1002, 102, '2026-08-05', '2026-08-19', NULL),
(5003, 1003, 103, '2026-08-10', '2026-08-24', '2026-08-23'),
(5004, 1004, 104, '2026-08-15', '2026-08-29', NULL),
(5005, 1005, 105, '2026-09-01', '2026-09-15', '2026-09-14'),
(5006, 1006, 101, '2026-09-05', '2026-09-19', NULL);
INSERT INTO Fine
(fine_id, loan_id, member_id, fine_amount, fine_date, payment_status)
VALUES
(9001, 5002, 102, 50.00, '2026-08-20', 'Unpaid'),
(9002, 5004, 104, 75.00, '2026-08-30', 'Paid'),
(9003, 5006, 101, 30.00, '2026-09-20', 'Unpaid');


