# 🚀 MartPulse AI | Marketing Mix Modeling & Campaign Optimization Platform
---
## 📖 Project Overview
MartPulse AI is a sportswear nationwide retailer  that operates across multiple marketing channels, including Google, Facebook, Email, TV, Radio, and Display advertising. 

We develop an end-to-end **Marketing Mix Modeling (MMM)** solution using **MySQL, Python, Statistics, Machine Learning, and Tableau** to analyze marketing performance, predict campaign revenue, and generate actionable business recommendations for strategic decision-making.

---
## 🎯 Business Problem

While  campaigns generate large volumes of customer interactions and revenue, the marketing team lacks a centralized analytical framework to measure campaign effectiveness and optimize marketing investments.

Without a data-driven approach, the company faces several business challenges:
- Identifying which marketing channels generate the highest revenue and return on investment.
- Measuring the impact of external factors such as weather, holidays, and discounts on campaign performance.
- Understanding the key drivers influencing campaign revenue.
- Predicting future campaign revenue to support budget planning.
- Providing actionable insights to improve campaign performance and maximize marketing ROI.

To address these challenges, MartPulse AI implements an end-to-end Marketing Mix Modeling (MMM) solution that integrates SQL, Python, Statistics, Machine Learning, and Tableau to transform raw marketing data into strategic business recommendations.

---
## 🎯 Project Objectives

The primary objectives of this project are to:
- Design a relational marketing database using MySQL.
- Generate and integrate a realistic multi-table marketing dataset containing 500,000 campaign interaction records.
- Validate data quality through SQL-based integrity and consistency checks.
- Analyze marketing KPIs, campaign performance, customer behavior, and revenue trends.
- Apply statistical techniques, including confidence interval estimation and hypothesis testing, to support data-driven decision-making.
- Build and compare Linear Regression and Random Forest models to predict campaign revenue.
- Identify the key factors influencing revenue using feature importance analysis.
- Develop interactive Tableau dashboards to monitor campaign performance and business KPIs.
- Provide actionable business recommendations to optimize marketing strategy and budget allocation.

---

## 🔄 Project Workflow

```
Synthetic Data Generation
        │
        ▼
MySQL Database Design
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
Python Exploratory Data Analysis (EDA)
        │
        ▼
Statistical Analysis
(Confidence Intervals & Hypothesis Testing)
        │
        ▼
Machine Learning
(Linear Regression & Random Forest)
        │
        ▼
Tableau Dashboard Development
        │
        ▼
Business Insights & Recommendations
```
---
## 🛠️ Technology Stack

| Category                | Technologies                      |
| ----------------------- | --------------------------------- |
| Programming Language    | Python                            |
| Database                | MySQL                             |
| Data Processing         | Pandas, NumPy                     |
| Statistical Analysis    | SciPy                             |
| Machine Learning        | Scikit-learn                      |
| Data Visualization      | Matplotlib, Seaborn, Tableau      |
| Development Environment | Jupyter Notebook, MySQL Workbench |
| Version Control         | Git, GitHub                       |

---
## 📊 Dataset Description

The project uses a synthetic marketing dataset designed to simulate real-world campaign performance across multiple channels and customer segments. The dataset was generated using the Faker library and organized into a relational MySQL database.

### Dataset Summary

| Attribute | Details |
|----------|---------|
| Total Records | 500,000 Campaign Interactions |
| Study Period | 2024 – 2025 |
| Database | MySQL |
| Tables | 5 |
| Primary Domain | Marketing Analytics |
| Target Variable | Revenue |

### Database Tables

| Table                 | Description                                                                                      |
| --------------------- | ------------------------------------------------------------------------------------------------ |
| Campaigns             | Campaign details, budget, duration, campaign type                                                |
| Customers             | Customer demographics and audience segments                                                      |
| Channels              | Marketing channel information                                                                    |
| External Factors      | Weather, holidays, competitor spend, discounts                                                   |
| Marketing Performance | Daily campaign performance metrics including spend, impressions, clicks, conversions and revenue |

---
## 📚 Methodology

### 1️⃣ Synthetic Data Generation

A realistic marketing ecosystem was created using Python and the Faker library to simulate campaign performance across multiple marketing channels. The generated data included campaign information, customer demographics, marketing performance metrics, and external business factors, resulting in a dataset of over **500,000 campaign interaction records**.

---
### 2️⃣ Database Design & SQL Validation

The generated datasets were imported into MySQL and organized into a normalized relational database. SQL validation was performed to verify data quality by checking for missing values, duplicate records, referential integrity, invalid dates, and KPI consistency before analysis.

---
### 3️⃣ KPI & Business Analysis

SQL was used to analyze key marketing metrics including Revenue, Spend, Profit, ROAS, CTR, CVR, CPC, and CPA. Additional business analysis identified top-performing marketing channels, customer segments, campaign types, cities, brands, seasonal trends, and revenue drivers.

---
### 4️⃣ Exploratory Data Analysis (EDA)

Python libraries such as Pandas, Matplotlib, and Seaborn were used to explore data distributions, identify patterns, detect outliers, examine feature relationships, and visualize campaign performance across multiple business dimensions.

---
### 5️⃣ Statistical Analysis

Statistical inference techniques were applied to support business decision-making. Confidence intervals estimated the population mean revenue, while hypothesis testing (ANOVA and Independent t-tests) evaluated the impact of marketing channels, discounts, weather, holidays, and weekends on campaign revenue.

---
### 6️⃣ Machine Learning

Revenue prediction models were developed using Multiple Linear Regression and Random Forest Regression. Model performance was evaluated using R², MAE, and RMSE, while feature importance analysis identified the variables with the greatest influence on campaign revenue.

---
### 7️⃣ Tableau Dashboard

Interactive dashboards were created in Tableau to monitor campaign performance, marketing KPIs, channel effectiveness, revenue trends, customer segmentation, and executive-level business metrics, enabling quick and data-driven decision-making.

---
## 📈 Key Results

### SQL & Business Analysis
- Identified the highest-performing marketing channels based on Revenue, ROAS, and Profit.
- Analyzed campaign performance across cities, customer segments, brands, and campaign types.
- Measured the impact of discounts, competitor spending, and seasonal factors on marketing performance.
- Generated business KPIs to support marketing budget optimization.

---
### Statistical Analysis
- Estimated the population mean revenue using a **95% Confidence Interval**.
- ANOVA tests showed that **Marketing Channel, Discount Percentage, and Weather** significantly influence revenue.
- Independent t-tests confirmed that **Holiday** and **Weekend** campaigns produce statistically different revenue compared to normal days.

---
### Machine Learning

| Model | Test R² | MAE | RMSE |
|--------|---------|------|------|
| Linear Regression | **87.32%** | **39.3K** | **58.2K** |
| Random Forest | **91.67%** | **39.3K** | **47.1K** |

- Random Forest achieved the highest prediction accuracy.
- Marketing Channel, Conversions, Spend, and Reach were identified as the strongest revenue drivers.

---
### Tableau Dashboard
- Developed interactive dashboards for campaign performance, KPI monitoring, revenue trends, marketing channels, customer insights, and executive reporting.
- Enabled business users to monitor marketing performance through dynamic visualizations and filters.

---
## 💡 Business Recommendations

Based on the analysis, the following recommendations are proposed:
- Increase investment in high-performing marketing channels such as **Google, Facebook, and TV**, which consistently generated the highest revenue contribution.
- Prioritize strategies that improve **conversion rates**, as conversions had a significantly greater impact on revenue than clicks alone.
- Optimize **Display** and **Radio** campaigns by reviewing targeting, creatives, and audience segmentation before increasing budget allocation.
- Adjust campaign planning during **holidays** and favorable weather conditions to maximize marketing effectiveness.
- Continuously monitor campaign performance through the Tableau dashboard to support faster, data-driven marketing decisions.
- Deploy the **Random Forest** model for revenue forecasting due to its superior predictive performance while using **Linear Regression** for business interpretation and explainability.