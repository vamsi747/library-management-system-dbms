-- ============================================
-- LIBRARY MANAGEMENT SYSTEM
-- STUDENT 2: DDL, TABLES & CONSTRAINTS
-- ORACLE SQL
-- ============================================


-- 1. PUBLISHER

CREATE TABLE Publisher (
    publisher_id NUMBER PRIMARY KEY,
    publisher_name VARCHAR2(100) NOT NULL,
    country VARCHAR2(50),
    website VARCHAR2(150),

    CONSTRAINT uq_publisher_name
        UNIQUE (publisher_name),

    CONSTRAINT uq_publisher_website
        UNIQUE (website)
);


-- 2. AUTHOR

CREATE TABLE Author (
    author_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    nationality VARCHAR2(50)
);


-- 3. BOOK

CREATE TABLE Book (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(200) NOT NULL,
    isbn VARCHAR2(20) NOT NULL,
    total_copies NUMBER DEFAULT 1,
    genre VARCHAR2(50),
    publication_year NUMBER(4),
    publisher_id NUMBER NOT NULL,

    CONSTRAINT uq_book_isbn
        UNIQUE (isbn),

    CONSTRAINT chk_total_copies
        CHECK (total_copies >= 0),

    CONSTRAINT chk_publication_year
        CHECK (publication_year >= 0),

    CONSTRAINT fk_book_publisher
        FOREIGN KEY (publisher_id)
        REFERENCES Publisher(publisher_id)
);


-- 4. BOOK_AUTHOR

CREATE TABLE Book_Author (
    book_id NUMBER NOT NULL,
    author_id NUMBER NOT NULL,

    CONSTRAINT pk_book_author
        PRIMARY KEY (book_id, author_id),

    CONSTRAINT fk_book_author_book
        FOREIGN KEY (book_id)
        REFERENCES Book(book_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_book_author_author
        FOREIGN KEY (author_id)
        REFERENCES Author(author_id)
        ON DELETE CASCADE
);


-- 5. MEMBER

CREATE TABLE Member (
    member_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100),

    membership_type VARCHAR2(30),
    membership_date DATE,
    membership_expiry DATE,

    CONSTRAINT uq_member_email
        UNIQUE (email)
);


-- 6. MEMBER_PHONE

CREATE TABLE Member_Phone (
    member_id NUMBER NOT NULL,
    phone_number VARCHAR2(15) NOT NULL,

    CONSTRAINT pk_member_phone
        PRIMARY KEY (member_id, phone_number),

    CONSTRAINT fk_member_phone_member
        FOREIGN KEY (member_id)
        REFERENCES Member(member_id)
        ON DELETE CASCADE
);


-- 7. LOAN

CREATE TABLE Loan (
    loan_id NUMBER PRIMARY KEY,
    book_id NUMBER NOT NULL,
    member_id NUMBER NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    status VARCHAR2(20) DEFAULT 'Active',

    CONSTRAINT fk_loan_book
        FOREIGN KEY (book_id)
        REFERENCES Book(book_id),

    CONSTRAINT fk_loan_member
        FOREIGN KEY (member_id)
        REFERENCES Member(member_id),

    CONSTRAINT chk_due_date
        CHECK (due_date >= loan_date),

    CONSTRAINT chk_return_date
        CHECK (
            return_date IS NULL
            OR return_date >= loan_date
        )
);


-- 8. FINE

CREATE TABLE Fine (
    fine_id NUMBER PRIMARY KEY,
    loan_id NUMBER NOT NULL,
    member_id NUMBER NOT NULL,

    fine_amount NUMBER(10,2) DEFAULT 0 NOT NULL,
    fine_date DATE,
    payment_status VARCHAR2(20) DEFAULT 'Unpaid' NOT NULL,

    CONSTRAINT uq_fine_loan
        UNIQUE (loan_id),

    CONSTRAINT fk_fine_loan
        FOREIGN KEY (loan_id)
        REFERENCES Loan(loan_id),

    CONSTRAINT fk_fine_member
        FOREIGN KEY (member_id)
        REFERENCES Member(member_id),

    CONSTRAINT chk_fine_amount
        CHECK (fine_amount >= 0),

    CONSTRAINT chk_payment_status
        CHECK (payment_status IN ('Paid', 'Unpaid'))
);
