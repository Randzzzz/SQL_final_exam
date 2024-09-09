-- Select all students between year_level 3 and 4.
SELECT * 
FROM Students
WHERE students.year_level BETWEEN 3 AND 4;

-- Show the student_id,first_name, last_name, and year level of a student who buys the book with a book_id = 3.
SELECT 
	Students.student_id,
	Students.first_name,
  Students.last_name,
  Students.year_level
FROM Students
JOIN Sales ON
	Students.student_id = Sales.student_id
WHERE Sales.book_id = 3;

--Show the sum of the books stock level from the inventory.
SELECT
	Books.book_id,
  Books.title,
  SUM(Inventory.stock_level) AS book_stock_level
FROM Inventory
INNER JOIN Books ON
	Inventory.book_id = Books.book_id
GROUP BY Books.book_id;

--Show the count of sales for each book purchased by students.
SELECT
	Books.book_id,
  Books.title,
  COUNT(Sales.book_id) AS sales_count
FROM Sales
INNER JOIN Books ON
  Sales.book_id = Books.book_id
GROUP BY Books.book_id;