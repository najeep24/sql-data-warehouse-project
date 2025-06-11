# Modern Data Warehouse Project with Medallion Architecture

Welcome to this end-to-end data warehouse project built with a layered Medallion approach—Bronze, Silver, and Gold. This repository captures the full pipeline from raw data ingestion to analytical data modeling, enabling deep insights for business decision-making.

---

## 🧱 Architecture Overview

This project adopts the **Medallion Architecture** paradigm to ensure modularity, data quality, and reusability across ETL stages.

![Data Architecture](docs/data_architecture.png)

- **Bronze Layer**: Raw ingestion from ERP and CRM datasets (CSV).
- **Silver Layer**: Cleansing, validation, and harmonization across sources.
- **Gold Layer**: Dimensional modeling (Star Schema) optimized for analytics.

---

## 🔍 Project Objectives

1. **Establish a scalable data pipeline** using SQL Server and ETL logic for ingestion and transformation.
2. **Apply Medallion principles** for clear data separation and processing logic.
3. **Develop a dimensional model** to support flexible analytics on customer and sales performance.
4. **Deliver actionable insights** with SQL-based reporting and potential dashboard integration.

---

## 🧰 Tech Stack & Tools

| Layer     | Tools / Platforms            |
|-----------|------------------------------|
| Database  | SQL Server Express            |
| ETL       | T-SQL, Stored Procedures      |
| Modeling  | Star Schema                   |
| Diagram   | Draw.io                       |
| Planning  | Notion                        |
| Versioning| GitHub                        |

---

## ⚙️ Folder Structure
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture               # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming_rules.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
└── README.md                           # Project overview and instructions


## 🙏 Acknowledgments

This project was inspired by the original by **Data With Baraa**. I acknowledge their work for the initial idea and structure.
