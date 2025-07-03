# Elevate-Labs-SQL-Task7

# Task 7: Creating Views

## 📌 Objective
Learned how to create and use SQL views for abstraction, data simplification, and security.

## 🛠 Tools Used
- MySQL Workbench

## 📂 What’s Included
- `views.sql`: SQL code to create and use views.
- `README.md`: Explanation of the task and interview questions.

## 📊 Views Created

### 1. `OrderDetails`
- A simple view combining customer and order information using a `JOIN`.
- Columns: CustomerID, CustomerName, City, Product, Amount

### 2. `CustomerTotalAmount`
- An aggregated view showing how much each customer has spent.
- Columns: CustomerID, Name, TotalSpent

### 3. `MumbaiCustomers`
- A filtered view showing only customers from Mumbai.
- Created with `WITH CHECK OPTION` to prevent inserting customers outside Mumbai through the view.

---

## 🧪 Example Queries

```sql
-- Show all order details
SELECT * FROM OrderDetails;

-- Show customers who have spent more than 5000
SELECT * FROM CustomerTotalAmount WHERE TotalSpent > 5000;

-- Show only Mumbai customers
SELECT * FROM MumbaiCustomers;
