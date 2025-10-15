CREATE DATABASE PersonalFinanceDB;
USE PersonalFinanceDB;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Expense_Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    monthly_budget DECIMAL(10,2)
);

CREATE TABLE Income (
    income_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    source VARCHAR(100),
    amount DECIMAL(10,2),
    income_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    category_id INT,
    description VARCHAR(100),
    amount DECIMAL(10,2),
    expense_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Expense_Categories(category_id)
);

CREATE TABLE Recurring_Payments (
    recurring_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    payment_name VARCHAR(100),
    amount DECIMAL(10,2),
    frequency ENUM('Daily','Weekly','Monthly','Yearly') DEFAULT 'Monthly',
    next_due DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Users (username, email) VALUES
('Prawin', 'info.prawink@gmail.com'),
('Priya', 'priya@example.com'),
('Karthik', 'karthik@example.com'),
('Anjali', 'anjali@example.com');

INSERT INTO Expense_Categories (category_name, monthly_budget) VALUES
('Food', 5000),
('Transport', 2000),
('Entertainment', 3000),
('Health', 2500),
('Bills', 4000),
('Education', 3500),
('Other',2000);

INSERT INTO Income (user_id, source, amount, income_date) VALUES
(1,'Salary', 20000,'2025-10-01'),
(2,'Freelance', 20000,'2025-10-05'),
(3,'Salary', 40000,'2025-10-03'),
(4,'Business', 60000,'2025-10-02');

INSERT INTO Expenses (user_id, category_id, description, amount, expense_date) VALUES
(1,1,'Groceries', 2500,'2025-10-03'),
(1,2,'Bus Ticket', 1000,'2025-10-04'),
(1,5,'Electricity Bill', 1500,'2025-10-05'),
(2,1,'Rent', 1200,'2025-10-06'),
(2,3,'Movie', 800,'2025-10-07'),
(3,4,'Doctor Visit', 1200,'2025-10-05'),
(3,6,'Developer_course', 10000,'2025-10-08'),
(4,1,'petrol', 1000,'2025-10-02'),
(4,5,'Water Bill', 500,'2025-10-03');

INSERT INTO Recurring_Payments (user_id, payment_name, amount, frequency, next_due) VALUES
(1,'Netflix', 499,'Monthly','2025-11-01'),
(2,'Gym Membership', 1000,'Monthly','2025-11-05'),
(3,'Spotify', 299,'Monthly','2025-11-03'),
(4,'Amazon Prime', 499,'Monthly','2025-11-02');
