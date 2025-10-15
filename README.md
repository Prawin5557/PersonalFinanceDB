# 💰 Personal Finance & Expense Tracker - MySQL Project

## 📖 Overview
The **Personal Finance & Expense Tracker** is a real-life MySQL database project designed to help users manage their income, expenses, budgets, and recurring payments efficiently.  
It simulates a personal finance management system, allowing users to track spending, analyze cash flow, and optimize savings.

---

## 🧩 Features
- Manage multiple **users** with individual profiles  
- Track **income** from various sources  
- Record **expenses** categorized by type (Food, Transport, Entertainment, Health, Bills, Education, Other)  
- Set **monthly budgets** and monitor spending  
- Manage **recurring payments** like subscriptions and bills  
- Calculate insights like **monthly savings, top expense categories, and spending trends**

---

## 🗄️ Database Schema
| Table Name | Description |
|-------------|-------------|
| **Users** | Stores user information |
| **Expense_Categories** | Categories for expenses with budget limits |
| **Income** | Tracks user income with source and date |
| **Expenses** | Tracks user expenses linked to categories |
| **Recurring_Payments** | Stores recurring bills or subscriptions for users |

---

## ⚙️ Technologies Used
- **Database:** MySQL  
- **Language:** SQL  
- **Tools:** MySQL Workbench / Command Line  

---

## 📥 How to Run
1. Clone this repository  
2. Open `PersonalFinanceDB.sql` in MySQL Workbench  
3. Execute the script to create tables and insert sample data  
4. Explore sample queries:  
   ```sql
   -- Monthly Expenses per Category
   SELECT ec.category_name, SUM(e.amount) AS total_spent
   FROM Expenses e
   JOIN Expense_Categories ec ON e.category_id = ec.category_id
   WHERE MONTH(e.expense_date) = 10
   GROUP BY ec.category_name;

   -- User Savings
   SELECT u.username, SUM(i.amount) - SUM(e.amount) AS savings
   FROM Users u
   JOIN Income i ON u.user_id = i.user_id
   JOIN Expenses e ON u.user_id = e.user_id
   GROUP BY u.username;
