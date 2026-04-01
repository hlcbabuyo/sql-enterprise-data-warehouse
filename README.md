# 💻 Enterprise ERP & CRM Data Warehouse

A data engineering project focused on building a data warehouse using SQL Server. This project demonstrates the practical implementation of the Medallion Architecture to extract, clean, and model raw data into a structured format ready for analytics.

---
## 📖 Project Overview

This project involves:

1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights.

---
## 🚀 Project Requirements

### Building the Data Warehouse

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---
## 🏗️ Data Architecture

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers:

![Data Architecture](docs/data_architecture.drawio.svg)

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

---
## 🛠️ Tech Stack & Skills Highlighted

* **Database:** MS SQL Server
* **Skills:** T-SQL, ETL / ELT Development, Data Cleansing, Stored Procedures
* **Data Modeling:** Star Schema, Dimensional Modeling
* **Architecture:** Medallion Architecture (Bronze, Silver, Gold)

---
## 📂 Repository Structure
```
erp-crm-data-warehouse/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture.drawio.svg    # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project
```

---
## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

---
## 🌟 About Me

Hi there! I am **Harvie Lorenz C. Babuyo**, a **3rd-year B.S. in Computer Science student** at the **University of Science and Technology of Southern Philippines - Cagayan de Oro**. 

**Let's connect:**

[![LinkedIn](https://custom-icon-badges.demolab.com/badge/LinkedIn-0077B5?style=plastic&logo=linkedin-white&logoColor=fff)](https://www.linkedin.com/in/harvie-lorenz-c-babuyo-16303a3a9/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=plastic&logo=github&logoColor=white)](https://github.com/hlcbabuyo)
[![Gmail](https://img.shields.io/badge/Gmail-D14836?style=plastic&logo=gmail&logoColor=white)](mailto:hlcbabuyo@gmail.com)
[![Instagram](https://img.shields.io/badge/Instagram-E4405F?style=plastic&logo=instagram&logoColor=white)](https://www.instagram.com/hawirrr/)
[![Discord](https://img.shields.io/badge/Discord-5865F2?style=plastic&logo=discord&logoColor=white)](https://discordapp.com/users/hlcbabuyo)

