
## Overview

The SQL module forms the foundation of the MartPulse AI project. It is responsible for creating the relational database, validating imported data, calculating marketing KPIs, and performing business analysis to investigate the decline in marketing-driven revenue.

The primary business problem addressed in this project is:

 **Despite maintaining a relatively stable marketing budget, the company observed a significant decline in marketing-driven revenue between February 2025 and April 2025.**

The SQL analysis establishes the analytical foundation before moving into Python for Exploratory Data Analysis (EDA), Statistical Analysis, and Marketing Mix Modeling (MMM).

---

# SQL Workflow

```
Raw CSV Files
      │
      ▼
Database Creation
      │
      ▼
Data Validation
      │
      ▼
KPI Analysis
      │
      ▼
Business Analysis
      │
      ▼
Python Analytics & Machine Learning
```

---

# Project Structure

```
sql/
│
├── 01_database_creation.sql
├── 02_data_validation.sql
├── 03_kpi_analysis.sql
├── 04_business_analysis.sql
└── README.md
```

---

# SQL Files

## 01_database_creation.sql

Responsible for preparing the relational database.

Key Tasks

- Created the `martpulse_ai` database
    
- Imported raw CSV files using MySQL Workbench Table Data Import Wizard
    
- Converted imported data types
    
- Added Primary Keys
    
- Added Foreign Keys
    
- Established relationships between tables

---

## 02_data_validation.sql

Validated data quality before analysis.

Validation Checks

- Record count verification
    
- Duplicate record detection
    
- Missing value validation
    
- Primary Key validation
    
- Foreign Key validation
    
- Date validation
    
- Business rule validation
    
- Domain validation

---

## 03_kpi_analysis.sql

Calculated core marketing KPIs used to evaluate campaign performance.

KPIs

- Revenue
    
- Marketing Spend
    
- Impressions
    
- Clicks
    
- Conversions
    
- Click Through Rate (CTR)
    
- Conversion Rate (CVR)
    
- Cost Per Click (CPC)
    
- Cost Per Acquisition (CPA)
    
- Return on Advertising Spend (ROAS)

The analysis also includes:

- Monthly performance
    
- Channel performance
    
- Campaign performance
    
- Customer performance
    
- Marketing trends

---

## 04_business_analysis.sql

Performed diagnostic analysis to identify the causes of the revenue decline.

Business Analysis Included

- Monthly revenue vs marketing spend
    
- Marketing efficiency analysis
    
- Channel performance analysis
    
- Campaign effectiveness
    
- Customer segment analysis
    
- External factor analysis
    
- Root Cause Analysis (RCA)

---

# Business Objective

The SQL analysis is designed to answer the following business questions:

- Is the decline in revenue real?
    
- Did marketing spend change significantly?
    
- Which marketing channels performed best?
    
- Which campaign types generated the highest returns?
    
- Which customer segments contributed the most revenue?
    
- How did marketing performance change over time?
    
- Which external factors may have influenced campaign performance?

