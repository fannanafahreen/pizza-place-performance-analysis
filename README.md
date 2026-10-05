# 🍕 Slice House Analytics — Pizza Sales Performance Dashboard

## Executive Summary
Full-funnel analysis of a pizza restaurant's 2015 sales data (48,620 line items) to identify revenue drivers, menu performance, and demand patterns — built end-to-end with SQL, DAX, Power BI, and Python.

**Annual Snapshot:** £817.86K Revenue • 21K Orders • £38.31 AOV

---

## Business Questions Answered
- Is the business actually growing, or does it just *feel* busy?
- Which pizzas are pulling their weight — and which aren't?
- What does a typical order look like?
- Are we staffed correctly for when customers actually show up?
- Do pizza categories sell differently by time of day?
- Is the menu unnecessarily complex from a prep standpoint?

---

## Key Findings
- **64.6% of orders fall under £40** — core price point is £20–£40 (38.2% of orders)
- **High-value orders (£60+) are only 15.9%** of volume — a real catering/party upsell gap
- **Revenue peaks:** July, May, March, November — **Lowest:** Sept, Oct, Dec, Feb
- **December AOV and revenue both dip** right after a strong November rebound (-8.1% MoM)
- **AOV drops in summer (~£37)** even as order volume peaks — bigger traffic, smaller baskets
- **AOV peaks in autumn (~£39)**, partially offsetting lower order counts

---

## Tools Used
`MySQL Workbench` · `Power BI` · `DAX` · `Power Query (M)` · `Python (statsmodels)` · `Jupyter Notebook`

---

## Methodology
1. Built a star schema in MySQL — `dim_pizza`, `dim_date`, `fact_sales`
2. Connected via ODBC to Power BI (native MySQL connector had driver issues — documented fix in `/sql`)
3. Built DAX measures for Revenue, AOV, Orders, and category-level Pareto analysis
4. Exploded ingredient data via Power Query for menu complexity analysis
5. Tested price elasticity via OLS regression in Python (see `/notebooks`)

---

## Business Recommendations
1. **Lift AOV past £40** via combo bundles (2 pizzas + side + drink) and checkout add-on prompts
2. **Fix the December dip** with holiday party packages and gift card pushes starting mid-November
3. **Target catering/family orders** — currently only 15.9% of volume, clear growth lane
4. **Simplify the menu** — ingredient-frequency analysis flags low-usage "orphan" ingredients as cut candidates

---

## Dashboard Screenshots
*(add 2–3 screenshots here: Executive Overview, Menu Performance, Demand Heatmap)*
