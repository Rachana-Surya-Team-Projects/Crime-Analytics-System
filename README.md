# 🚓 Crime Analytics System
### A Scalable Data Analytics Platform for Law Enforcement Intelligence

---

## 📌 Overview
The **Crime Analytics System** is an end-to-end data analytics platform designed to help law enforcement agencies **store, analyze, and visualize large-scale crime data**.

The system integrates a **fully normalized PostgreSQL relational database**, **advanced SQL logic** (stored procedures, triggers, indexing), and an **interactive Tableau dashboard** to support **data-driven policing decisions**.

This project demonstrates **database engineering, performance optimization, transactional integrity, and analytics visualization** on a realistic, high-volume dataset.

---

## 🎯 Key Objectives
- Design a secure, normalized relational database for crime-related records   
- Enable fast analytical queries over large datasets  
- Ensure transactional safety and data integrity  
- Provide visual insights for crime trends, officer workload, and hotspot analysis  
- Deliver a production-ready analytics workflow suitable for real-world use  

---

## 🏗️ System Architecture
**Data Flow:**  
`Synthetic Data → PostgreSQL → SQL Analytics → Tableau Dashboard`

### Core Components
- Relational Database (PostgreSQL)
- ETL & Data Validation Scripts
- Stored Procedures & Triggers
- Indexed Analytical Queries
- Tableau Dashboard (Visualization Layer)

---

## 🗄️ Database Design
- **100% normalized schema (3NF)**
- **11 interrelated tables**, including:
  - CrimeReports
  - Cases
  - Suspects
  - Arrests
  - Officers
  - Locations
  - Victims
  - Witnesses
  - Evidence
  - CourtCases
  - OfficerBadge

### Key Features
- Primary & Foreign Key enforcement
- CHECK constraints for data validation
- Cascading delete/update rules
- One-to-one and one-to-many relationships

📌 **Schema:** `SQL Create Table.sql`  
📌 **ER Diagram:** `Entity Relationship Diagram.png`

---

## ⚙️ Data Engineering & ETL
- Inserted **50,000+ synthetic records** across all entities
- Maintained referential integrity across tables
- Eliminated redundancy through normalization
- Ensured scalable inserts for analytical workloads

📌 **Data Load Script:** `SQL Insert Table.sql`

---

## 🧠 Advanced SQL & Backend Logic

### Stored Procedures & Functions
- Insert, update, and delete operations with validation
- Parameterized analytical functions (e.g., crimes by city)
- Error handling using `FOUND` and exception blocks

### Triggers & Transaction Handling
- Automatic logging of failed transactions
- Enforced business rules (e.g., unique badge assignment)
- Demonstrated rollback and atomicity guarantees

📌 **Files:**
- `SQL Queries Implementation.sql`
- `Transaction Handling Using Triggers.sql`

---

## 🚀 Performance Optimization
- Designed targeted indexes on high-frequency query columns
- Benchmarked performance using `EXPLAIN ANALYZE`
- Achieved:
  - **~60% reduction in data duplication**
  - **~40% improvement in query execution time**

📌 **Indexing Script:** `SQL Indexing.sql`

---

## 📊 Analytics & Visualization (Tableau)
Developed an **interactive Tableau dashboard** enabling:
- Crime distribution by type and city
- Time-based crime trend analysis
- Officer workload insights
- Case status monitoring
- Visual support for hotspot identification

📌 **Dashboard:** `Crime Analytics System Dashboard Tableau.twbx`

---

## 🎥 Project Demonstration
A full walkthrough video showcasing:
- Database schema & ER design
- SQL execution & transaction safety
- Trigger-based rollback demonstration
- Tableau dashboard exploration

📌 **Demo Video:** `Project Demo Video.mp4`

---

## 🛠️ Technologies Used
- **Database:** PostgreSQL
- **Query Language:** SQL, PL/pgSQL
- **Visualization:** Tableau
- **Design:** ER Modeling
- **Optimization:** Indexing, Query Planning
- **Version Control:** Git & GitHub

---

## 👥 Team Contributions
This project was **equally designed, implemented, and tested** by both:

- **@VenkataSriSaiSuryaMandava**  
  👉 https://github.com/VenkataSriSaiSuryaMandava

- **@DharmavaramRachana**  
  👉 https://github.com/DharmavaramRachana

**Equal responsibilities included:**
- Database schema design & normalization
- SQL development (DDL, DML, procedures, triggers)
- Performance optimization & indexing
- ETL and data generation
- Tableau dashboard design
- Documentation & demo preparation

---

## 📂 Repository Structure
```
├── SQL Create Table.sql
├── SQL Insert Table.sql
├── SQL Data Queries.sql
├── SQL Queries Implementation.sql
├── SQL Indexing.sql
├── Transaction Handling Using Triggers.sql
├── Entity Relationship Diagram.png
├── Crime Analytics System Dashboard Tableau.twbx
├── Crime Analytics System Report.pdf
├── Project Demo Video.mp4
└── README.md
```

---

## 📌 How to Run
1. Execute `SQL Create Table.sql`
2. Load data using `SQL Insert Table.sql`
3. Run analytical queries and procedures
4. Open the Tableau dashboard (`.twbx`)
5. Explore insights interactively

---

## ⭐ Why This Project Matters
This project demonstrates **real-world database engineering skills**, combining **data modeling, performance tuning, transactional safety, and analytics visualization**—the exact skill set expected of **Software Engineers, Data Engineers, and Backend Engineers** working with large-scale systems.
