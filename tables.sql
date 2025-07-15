create database library_managment;
use library_managment;
-- Create the books table 
CREATE TABLE books (
    isbn VARCHAR(20) PRIMARY KEY,
    book_title VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    rental_price DECIMAL(5,2),
    fine_price DECIMAL(5,2),
    status VARCHAR(10),
    author VARCHAR(100),
    publisher VARCHAR(100)
);
-- Insert data into the books table
INSERT INTO books (isbn, book_title, category, rental_price,fine_price, status, author, publisher) VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 2.00,'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50,2.00, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50,2.00, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00,2.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00,2.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50,2.00, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00,2.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00,2.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50,2.00, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 2.00,'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00,2.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00,2.00, 'no', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50,2.00, 'no', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50,2.00, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 2.00,'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50,2.00, 'no', 'Charles C. Mann', 'Vintage Books'),
('978-0-679-64115-3', '1984', 'Dystopian', 6.50,2.00, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-143951-8', 'Pride and Prejudice', 'Classic', 5.00, 2.00,'yes', 'Jane Austen', 'Penguin Classics'),
('978-0-452-28240-7', 'Brave New World', 'Dystopian', 6.50, 2.00, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-670-81302-4', 'The Road', 'Dystopian', 7.00, 2.00,'yes', 'Cormac McCarthy', 'Knopf'),
('978-0-385-33312-0', 'The Shining', 'Horror', 6.00, 2.00,'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52993-5', 'Fahrenheit 451', 'Dystopian', 5.50, 2.00,'yes', 'Ray Bradbury', 'Ballantine Books'),
('978-0-345-39180-3', 'Dune', 'Science Fiction', 8.50, 2.00,'yes', 'Frank Herbert', 'Ace'),
('978-0-375-50167-0', 'The Road', 'Dystopian', 7.00,2.00, 'yes', 'Cormac McCarthy', 'Vintage'),
('978-0-06-025492-6', 'Where the Wild Things Are', 'Children', 3.50, 2.00,'yes', 'Maurice Sendak', 'HarperCollins'),
('978-0-06-112241-5', 'The Kite Runner', 'Fiction', 5.50,2.00, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('978-0-06-440055-8', 'Charlotte''s Web', 'Children', 4.00, 2.00,'yes', 'E.B. White', 'Harper & Row'),
('978-0-679-77644-3', 'Beloved', 'Fiction', 6.50, 2.00,'yes', 'Toni Morrison', 'Knopf'),
('978-0-14-027526-3', 'A Tale of Two Cities', 'Classic', 4.50, 2.00,'yes', 'Charles Dickens', 'Penguin Books'),
('978-0-7434-7679-3', 'The Stand', 'Horror', 7.00, 2.00,'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52994-2', 'Moby Dick', 'Classic', 6.50,2.00, 'yes', 'Herman Melville', 'Penguin Books'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 5.00, 2.00,'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-553-57340-1', '1984', 'Dystopian', 6.50, 2.00,'yes', 'George Orwell', 'Penguin Books'),
('978-0-7432-4722-5', 'Angels & Demons', 'Mystery', 7.50,2.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7356-4', 'The Hobbit', 'Fantasy', 7.00,2.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt');
 
 -- CREATE TABLE members
 CREATE TABLE members (
    member_id VARCHAR(10) PRIMARY KEY,
    member_name VARCHAR(50) NOT NULL,
    member_address VARCHAR(100),
    reg_date DATE
);
-- Insert Data into members
INSERT INTO members (member_id, member_name, member_address, reg_date) VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25'),
('C118', 'Sam', '133 Pine St', '2024-06-01'),
('C119', 'John', '143 Main St', '2024-05-01');

-- CREATE TABLE issued_status
CREATE TABLE issued_status (
    issued_id VARCHAR(10) PRIMARY KEY,
    issued_member_id VARCHAR(10),
    issued_book_name VARCHAR(100),
    issued_date DATE,
    expected_return_date DATE,
    issued_book_isbn VARCHAR(20),
    FOREIGN KEY (issued_member_id) REFERENCES members(member_id)
);
-- Insert Data into issued_status
INSERT INTO issued_status (issued_id, issued_member_id, issued_book_name, issued_date, expected_return_date, issued_book_isbn) VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', DATE_ADD('2024-03-10', INTERVAL 1 MONTH), '978-0-330-25864-8'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', DATE_ADD('2024-03-11', INTERVAL 1 MONTH), '978-0-14-118776-1'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', DATE_ADD('2024-03-12', INTERVAL 1 MONTH), '978-0-525-47535-5'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', DATE_ADD('2024-03-13', INTERVAL 1 MONTH), '978-0-141-44171-6'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', DATE_ADD('2024-03-14', INTERVAL 1 MONTH), '978-0-307-37840-1'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', DATE_ADD('2024-03-15', INTERVAL 1 MONTH), '978-0-679-76489-8'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', DATE_ADD('2024-03-16', INTERVAL 1 MONTH), '978-0-09-957807-9'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', DATE_ADD('2024-03-17', INTERVAL 1 MONTH), '978-0-393-05081-8'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', DATE_ADD('2024-03-18', INTERVAL 1 MONTH), '978-0-19-280551-1'),
('IS115', 'C109', 'The Histories', '2024-03-19', DATE_ADD('2024-03-19', INTERVAL 1 MONTH), '978-0-14-044930-3'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', DATE_ADD('2024-03-20', INTERVAL 1 MONTH), '978-0-393-91257-8'),
('IS117', 'C110', '1984', '2024-03-21', DATE_ADD('2024-03-21', INTERVAL 1 MONTH), '978-0-679-64115-3'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', DATE_ADD('2024-03-22', INTERVAL 1 MONTH), '978-0-14-143951-8'),
('IS119', 'C110', 'Brave New World', '2024-03-23', DATE_ADD('2024-03-23', INTERVAL 1 MONTH), '978-0-452-28240-7'),
('IS120', 'C110', 'The Road', '2024-03-24', DATE_ADD('2024-03-24', INTERVAL 1 MONTH), '978-0-670-81302-4'),
('IS121', 'C102', 'The Shining', '2024-03-25', DATE_ADD('2024-03-25', INTERVAL 1 MONTH), '978-0-385-33312-0'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', DATE_ADD('2024-03-26', INTERVAL 1 MONTH), '978-0-451-52993-5');




CREATE TABLE return_status (
    return_id VARCHAR(10) PRIMARY KEY,
    issued_id VARCHAR(10),
    return_book_isbn VARCHAR(20),
    actual_return_date DATE,
    FOREIGN KEY (issued_id) REFERENCES issued_status(issued_id),
    FOREIGN KEY (return_book_isbn) REFERENCES books(isbn)
);
CREATE TABLE charges(
c_id varchar(20) primary key,
total_amount DECIMAL(5,2),
return_id VARCHAR(10),
isbn VARCHAR(20),
foreign key (isbn) REFERENCES books(isbn),
foreign key (return_id) REFERENCES return_status(return_id)
);
