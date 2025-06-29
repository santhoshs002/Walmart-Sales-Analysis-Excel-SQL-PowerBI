# 🛒 Walmart Sales Analysis | Excel · MySQL · Power BI

A complete data analysis project focused on Walmart's sales performance. This project includes data cleaning, exploratory data analysis (EDA), KPI creation, and interactive dashboarding using Excel, SQL, and Power BI.

---

## 📌 Project Objective

To analyze Walmart’s weekly sales data from 2010 to 2012 to uncover patterns, trends, and performance metrics across different stores, and to present key insights visually using Power BI.

---

## 📁 Files Included

| File Name                                   | Description                                                             |
|--------------------------------------------|-------------------------------------------------------------------------|
| `Walmart Sales Data - Raw Data.csv`        | Original raw data provided                                              |
| `Walmart Sales Data - Fixed Date.csv`      | Cleaned date column using Excel for MySQL compatibility                |
| `Walmart Cleaned Data.xlsx`                | Final cleaned data for Power BI                                        |
| `Walmart Data Cleaning.sql`                | SQL script for data cleaning (duplicates, nulls, anomalies)            |
| `Walmart EDA & KPI.sql`                    | SQL script for EDA queries and key KPIs                                |
| `Walmart_Sales_Analysis.pbix`              | Power BI report/dashboard file                                         |

---

## 🛠 Tools Used

- **Excel**: For initial date format correction
- **MySQL**: For data cleaning, EDA, and KPIs
- **Power BI**: For data visualization and dashboard building

---

## 🔍 Step-by-Step Workflow

### 1. **Excel – Date Correction**
- Cleaned inconsistent date formats using `TEXT()` and `Text to Columns`
- Exported cleaned data for MySQL upload

### 2. **MySQL – Data Cleaning**
- Removed duplicates using `ROW_NUMBER()`
- Checked for null or missing values
- Validated holiday flag values (should be only 0 or 1)
- Verified no negative sales

### 3. **MySQL – EDA + KPIs**
- Identified top-performing stores by sales
- Analyzed weekly, monthly, and yearly trends
- Compared sales on holidays vs non-holidays
- Calculated total revenue, average sales per store, and more

### 4. **Power BI – Dashboard Creation**
- Created cards for KPIs like total revenue and average sales
- Used bar/column charts for store-wise comparisons
- Added tables for monthly sales and holiday analysis
- Line/area charts to visualize trends over time
- Slicers for dynamic filtering by **Store** and **Year**

---

## 📊 Dashboard (Live Link)

👉 [View Published Power BI Report](https://app.powerbi.com/groups/me/reports/cbb71839-81f3-4df9-827c-d602cf9e150e/b2596ffc445b440b7249?experience=power-bi)

---

## 📌 Key KPIs

- **Total Revenue**: Sum of all weekly sales
- **Average Weekly Sales per Store**
- **Top Performing Stores by Sales**
- **Holiday vs Non-Holiday Sales Comparison**
- **Monthly Sales Trend**
- **Running Total of Monthly Sales**

---

## 📅 Data Info

- **Period**: 2010 to 2012
- **Columns**:
  - `Store`, `Date`, `Weekly_Sales`, `Holiday_Flag`
  - `Temperature`, `Fuel_Price`, `CPI`, `Unemployment`

---

## 💡 Learnings

✔️ Working with inconsistent date formats  
✔️ Writing and validating SQL cleaning & EDA queries  
✔️ Creating KPIs using SQL and Power BI  
✔️ Using slicers and visuals effectively in Power BI  
✔️ End-to-end data analytics project workflow

---

## 📧 Contact

Feel free to reach out via GitHub Issues or LinkedIn if you have questions or suggestions!

---

## 🏷 Tags

`#SQL` `#PowerBI` `#DataAnalysis` `#Walmart` `#EDA` `#Dashboard` `#Excel` `#KPIs`
