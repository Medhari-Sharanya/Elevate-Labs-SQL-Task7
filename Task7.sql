


mysql> create database Task7;
Query OK, 1 row affected (0.06 sec)

mysql> use Task7;
Database changed
mysql> CREATE TABLE Customers (
    ->     CustomerID INT PRIMARY KEY,
    ->     Name VARCHAR(100),
    ->     City VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql> CREATE TABLE Orders (
    ->     OrderID INT PRIMARY KEY,
    ->     CustomerID INT,
    ->     Product VARCHAR(100),
    ->     Amount DECIMAL(10, 2),
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> -- Sample data
mysql> INSERT INTO Customers VALUES (1, 'Alice', 'Mumbai'), (2, 'Bob', 'Delhi');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Orders VALUES (101, 1, 'Laptop', 45000.00), (102, 1, 'Mouse', 500.00), (103, 2, 'Keyboard', 1000.00);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> CREATE VIEW OrderDetails AS
    -> SELECT c.Name, c.City, o.Product, o.Amount
    -> FROM Customers c
    -> JOIN Orders o ON c.CustomerID = o.CustomerID;
Query OK, 0 rows affected (0.01 sec)

mysql> -- Select all from the view
mysql> SELECT * FROM OrderDetails;
+-------+--------+----------+----------+
| Name  | City   | Product  | Amount   |
+-------+--------+----------+----------+
| Alice | Mumbai | Laptop   | 45000.00 |
| Alice | Mumbai | Mouse    |   500.00 |
| Bob   | Delhi  | Keyboard |  1000.00 |
+-------+--------+----------+----------+
3 rows in set (0.01 sec)

mysql>
mysql> -- Filtered results
mysql> SELECT * FROM OrderDetails WHERE City = 'Mumbai';
+-------+--------+---------+----------+
| Name  | City   | Product | Amount   |
+-------+--------+---------+----------+
| Alice | Mumbai | Laptop  | 45000.00 |
| Alice | Mumbai | Mouse   |   500.00 |
+-------+--------+---------+----------+
2 rows in set (0.00 sec)

mysql> CREATE VIEW CustomerTotalAmount AS
    -> SELECT c.Name, SUM(o.Amount) AS TotalAmount
    -> FROM Customers c
    -> JOIN Orders o ON c.CustomerID = o.CustomerID
    -> GROUP BY c.Name;
Query OK, 0 rows affected (0.01 sec)

mysql> DROP VIEW IF EXISTS OrderDetails;
Query OK, 0 rows affected (0.01 sec)

mysql>