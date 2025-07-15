
 -- 1) BOOK MANAGMENT 
 
-- List Available Books: Find books with status = 'yes' that are not currently issued 
select * from books b where status='yes'; 
--  select the Books by Category or Author: Allow users to find books by category or author (partial match).
select isbn, book_title, category, author, publisher 
from books where category like '%Classic%'
 or author like '%0rwell%';
 -- Update Book Status: Mark a book as unavailable (status = 'no') when issued
UPDATE books b
SET status = 'no'
WHERE isbn IN (SELECT issued_book_isbn FROM issued_status WHERE issued_id NOT IN (SELECT issued_id FROM return_status));


-- 2)  adding a new memeber
insert into members(member_id, member_name, member_address, reg_date)
values
('C120', 'Seet', '220-c uk', '2020-09-04');
-- member id C120 issue a book,  book isbn 978-0-553-29698-2
insert into issued_status(issued_id, issued_member_id, issued_book_name, issued_date,expected_return_date,  issued_book_isbn) 
value
('IS141','C120','The Catcher in the Rye' ,'2020-09-04',DATE_ADD('2020-09-04', INTERVAL 1 MONTH),'978-0-553-29698-2');
 -- memeber return the book isbn , issued_id
INSERT INTO return_status(return_id, issued_id, return_book_isbn, actual_return_date) values
('r1', 'IS141','978-0-553-29698-2', '2020-10-10');

 -- 3) charges table calculation 

-- inserting the entry of return status into the charges table  having extra charges as fine ( return a book after the expecting date 
INSERT INTO charges (c_id, total_amount, return_id, isbn)
SELECT 
    CONCAT('C_', r.return_id) AS c_id,
    COALESCE(
        (b.rental_price * DATEDIFF(i.expected_return_date, i.issued_date)) +
        COALESCE(
            (b.fine_price * (
                CASE 
                    WHEN DATEDIFF(r.actual_return_date, i.expected_return_date) > 0 
                    THEN DATEDIFF(r.actual_return_date, i.expected_return_date) 
                    ELSE 0 
                END
            )),
            0
        ),
        0
    ) AS total_amount,
    r.return_id,
    b.isbn
FROM 
    issued_status i 
    INNER JOIN books b ON i.issued_book_isbn = b.isbn
    INNER JOIN return_status r ON i.issued_book_isbn = r.return_book_isbn
ON DUPLICATE KEY UPDATE
    total_amount = VALUES(total_amount),
    return_id = VALUES(return_id),
    isbn = VALUES(isbn);

select * from charges;
-- checking the case when the person return a book before the expected date 
insert into return_status(return_id, issued_id , return_book_isbn,actual_return_date)
values
('r2','IS106','978-0-330-25864-8','2024-03-20');
-- updating  the charges table 
INSERT INTO charges (c_id, total_amount, return_id, isbn)
SELECT 
    CONCAT('C_', r.return_id) AS c_id,
    COALESCE(
        (b.rental_price * DATEDIFF(i.expected_return_date, i.issued_date)) +
        COALESCE(
            (b.fine_price * (
                CASE 
                    WHEN DATEDIFF(r.actual_return_date, i.expected_return_date) > 0 
                    THEN DATEDIFF(r.actual_return_date, i.expected_return_date) 
                    ELSE 0 
                END
            )),
            0
        ),
        0
    ) AS total_amount,
    r.return_id,
    b.isbn
FROM 
    issued_status i 
    INNER JOIN books b ON i.issued_book_isbn = b.isbn
    INNER JOIN return_status r ON i.issued_book_isbn = r.return_book_isbn
ON DUPLICATE KEY UPDATE
    total_amount = VALUES(total_amount),
    return_id = VALUES(return_id),
    isbn = VALUES(isbn);
select * from charges;

-- 4) REPORTING AND ANALYTICS 

-- Books Issued in a Date Range: Find books issued between specific dates
SELECT i.issued_id, i.issued_book_isbn, b.book_title, i.issued_date, i.expected_return_date
FROM issued_status i
INNER JOIN books b ON i.issued_book_isbn = b.isbn
WHERE i.issued_date BETWEEN '2025-06-01' AND '2025-06-30';

-- Most Popular Categories: Count issues by book category
SELECT b.category, COUNT(i.issued_id) AS issue_count
FROM issued_status i
INNER JOIN books b ON i.issued_book_isbn = b.isbn
GROUP BY b.category
ORDER BY issue_count DESC;

-- Average Rental Duration: Calculate the average number of days books are borrowed.
SELECT b.isbn, b.book_title, 
       AVG(DATEDIFF(r.actual_return_date, i.issued_date)) AS avg_borrow_days
FROM issued_status i
INNER JOIN return_status r ON i.issued_id = r.issued_id
INNER JOIN books b ON i.issued_book_isbn = b.isbn
GROUP BY b.isbn, b.book_title;

-- showing the persons who issued a book but have  not returned  till now in ascending order of issued date 
select * from (select  i.issued_id, i.issued_member_id , i.issued_date from issued_status i left join return_status r on i.issued_id=r.issued_id) 
 as t where issued_id not in(select  k.issued_id from return_status k) order by t.issued_date;

-- 5)  DATA MAINTAINENECE
-- Fix Duplicate Books: Remove duplicate entries for "1984" and "The Road" (keeping the latest ISBN or one with more complete data). 

-- Delete duplicate for "1984" (keep ISBN: 978-0-679-64115-3)
DELETE FROM books 
WHERE isbn = '978-0-553-57340-1' 
  AND book_title = '1984';

-- Delete duplicate for "The Road" (keep ISBN: 978-0-670-81302-4)
DELETE FROM books 
WHERE isbn = '978-0-375-50167-0' 
  AND book_title = 'The Road';


--  Clean Orphaned Records: Remove return_status records with invalid issued_id values.
DELETE FROM return_status 
WHERE issued_id NOT IN (SELECT issued_id FROM issued_status);


-- Update Book Status Based on Issues: Ensure all books’ status reflects their issue/return state.
UPDATE books b
SET status = CASE 
    WHEN EXISTS (
        SELECT 1 FROM issued_status i 
        LEFT JOIN return_status r ON i.issued_id = r.issued_id 
        WHERE i.issued_book_isbn = b.isbn AND r.return_id IS NULL
    ) THEN 'no'
    ELSE 'yes'
END;

