# Employee_and_Department_Database_Management
It demonstrates SQL concepts using an employees and department database
---

## 🗂 Database Schema

### 1️⃣ Employees Table
| Column     | Data Type       | Description |
|------------|----------------|-------------|
| emp_ID     | INT (PK)        | Employee ID |
| Name       | VARCHAR(50)    | Employee Name |
| Position   | VARCHAR(30)    | Job Role |
| Salary     | DECIMAL(12,2)  | Employee Salary |
| Hire_date  | DATE           | Date of Joining |
| email      | VARCHAR(50)    | Email Address |
| dept_ID    | INT (FK)       | Department ID |

### 2️⃣ Depart Table
| Column     | Data Type       | Description |
|------------|----------------|-------------|
| dept_ID    | INT (PK)        | Department ID |
| dept_name  | VARCHAR(50)    | Department Name |
| location   | VARCHAR(50)    | Department Location |

---

## 🚀 Features & Concepts Covered

### 📍 Database & Table Management
- Create schema & tables  
- Alter, delete, and drop tables  
- Add and modify columns

### 📍 CRUD Operations
- `INSERT`, `SELECT`, `UPDATE`, `DELETE`

### 📍 Filtering & Sorting
- Comparison operators (`=`, `<`, `>`, `BETWEEN`, `IN`, `LIKE`, `IS NULL`)  
- Logical operators (`AND`, `OR`, `NOT`)  
- `ORDER BY`, `LIMIT`

### 📍 Aggregate Functions
- `COUNT()`, `AVG()`, `MAX()`, `MIN()`, `SUM()`

### 📍 Grouping
- `GROUP BY` and `HAVING`

### 📍 Joins
- **INNER JOIN**, **LEFT JOIN**, **RIGHT JOIN**, **FULL OUTER JOIN**

### 📍 Subqueries
- Simple subqueries  
- Correlated subqueries

### 📍 Views
- Creating and dropping views

### 📍 Stored Procedures
- Creating and calling stored procedures

### 📍 Functions
- Custom SQL functions

### 📍 Triggers
- BEFORE INSERT triggers

### 📍 Transactions
- `START TRANSACTION`, `COMMIT`, `ROLLBACK`

### 📍 Indexes
- Creating indexes for faster search

### 📍 Window Functions
- `RANK()`, running totals, partitioning with `PARTITION BY`

### 📍 Common Table Expressions (CTE)
- Using `WITH` clause

### 📍 Temporary Tables
- Creating temporary tables for session-specific data

### 📍 Case Statements
- Categorizing salary ranges

---
