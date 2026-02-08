                 Customers and Banking Transactions Database



1)Database Creation:
CREATE DATABASE BankDB;
USE BankDB;

2)Table Creation:

CUSTOMER TABLE

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    account_type VARCHAR(20)
);

TRANSACTION TABLE

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    transaction_type VARCHAR(20),
    transaction_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

3)Insert Sample Data:

INSERT INTO Customers VALUES
(1, 'Ravi', 25, 'Chennai', 'Savings'),
(2, 'Priya', 30, 'Coimbatore', 'Current'),
(3, 'Arun', 22, 'Madurai', 'Savings'),
(4, 'Divya', 28, 'Salem', 'Savings'),
(5, 'Karthik', 35, 'Trichy', 'Current');

INSERT INTO Transactions VALUES
(101, 1, 5000, 'Deposit', '2025-01-10'),
(102, 2, 2000, 'Withdrawal', '2025-01-12'),
(103, 1, 1500, 'Withdrawal', '2025-01-15'),
(104, 3, 7000, 'Deposit', '2025-01-18'),
(105, 4, 3000, 'Deposit', '2025-01-20'),
(106, 5, 4000, 'Withdrawal', '2025-01-22'),
(107, 2, 6000, 'Deposit', '2025-01-25'),
(108, 3, 2000, 'Withdrawal', '2025-01-28');


4)QUERIES:

1. View all customers
SELECT * FROM Customers;

2. View all transactions
SELECT * FROM Transactions;

3. Customers from Chennai
SELECT name FROM Customers WHERE city = 'Chennai';

4. Total deposited amount
SELECT SUM(amount) FROM Transactions WHERE transaction_type = 'Deposit';

5. Total withdrawn amount
SELECT SUM(amount) FROM Transactions WHERE transaction_type = 'Withdrawal';

6. Transactions of Ravi
SELECT * FROM Transactions 
WHERE customer_id = (SELECT customer_id FROM Customers WHERE name='Ravi');

7. Number of customers
SELECT COUNT(*) FROM Customers;

8. Highest transaction
SELECT MAX(amount) FROM Transactions;

9. Savings account customers
SELECT name FROM Customers WHERE account_type='Savings';

10. Join customers and transactions
SELECT c.name, t.amount, t.transaction_type
FROM Customers c
JOIN Transactions t ON c.customer_id = t.customer_id;

