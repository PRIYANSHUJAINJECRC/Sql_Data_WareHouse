# Data Warehouse Project

## 📌 Overview
This project implements a **Data Warehouse** using SQL and follows a layered architecture approach (Bronze, Silver, and Golden layers). The design ensures scalability, performance, and data quality while supporting business analysis, ad-hoc queries, and machine learning workloads.

---

## 🏗️ Architecture
The Data Warehouse is organized into three layers:

1. **Bronze Layer (Raw Data)**  
   - Stores raw data ingested from source systems (ERP, CRM, CSV files).  
   - No transformations are applied.  
   - Data is stored *as-is*.  

2. **Silver Layer (Cleaned & Standardized Data)**  
   - Contains standardized, cleansed, and enriched data.  
   - Includes derived columns, normalization, and data quality checks.  
   - Prepares data for analytics and integration.  

3. **Golden Layer (Business-Ready Data)**  
   - Aggregated, business-ready data.  
   - Supports **star schema models, flat tables, and aggregated tables**.  
   - Used for reporting, business intelligence, and machine learning.  


🖼️ Data Warehouse Architecture Diagram
### <img width="921" height="546" alt="ArchitectureDataWareHouse drawio" src="https://github.com/user-attachments/assets/1557f9cf-ba6b-4644-80b3-3cfc6bf2422d" />

---

## 📑 Project Planning
For detailed documentation, objectives, and project planning, check the following link:  
👉 [Data Warehouse Project Planning (Notion)](https://periodic-tadpole-9f6.notion.site/DATA-WareHouse-Project-25de783a366f80b5a75cfa910bfe6470)

---

## ⚙️ Tech Stack
- **Database:** MySQL Server  
- **ETL:** SQL scripts (batch processing, full load, truncate & insert)  
- **Data Modeling:** Star Schema, Flat Tables  
- **Consumers:**  
  - Business Analysis  
  - SQL Ad-Hoc Queries  
  - Machine Learning Models  

---

## 🚀 Features
- Layered data storage (Bronze, Silver, Golden)  
- Supports batch and full load ingestion  
- Data transformation and enrichment in Silver layer  
- Aggregated, business-ready data in Golden layer  
- Enables analytics and machine learning  

---

## 🛠️ Setup Instructions
1. Clone the repository:  
   ```bash
   git clone https://github.com/your-username/data-warehouse-project.git
