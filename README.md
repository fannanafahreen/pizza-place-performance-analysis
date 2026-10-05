# 🍕 Slice House Analytics — Pizza Sales Performance Dashboard

## Executive Summary
Full funnel analysis of a pizza restaurant's 2015 sales data (48,620 line items) to identify revenue drivers, menu performance, and demand patterns. Built end-to-end with SQL, DAX and Power BI.

**Annual Snapshot:** £817.86K Revenue • 21K Orders • £38.31 AOV

---

## Business Questions Answered
- Is the business actually growing, or does it just *feel* busy?
- Which pizzas are pulling their weight and which aren't?
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
`MySQL Workbench` · `Power BI` · `DAX` · `Power Query (M)` 

---

## Methodology
1. Built a star schema in MySQL — `dim_pizza`, `dim_date`, `fact_sales`
2. Connected via ODBC to Power BI (native MySQL connector had driver issues documented fix in `/sql`)
3. Built DAX measures for Revenue, AOV, Orders, and category-level Pareto analysis
4. Exploded ingredient data via Power Query for menu complexity analysis

---

## Business Recommendations
1. **Lift AOV past £40** via combo bundles (2 pizzas + side + drink) and checkout add-on prompts
2. **Fix the December dip** with holiday party packages and gift card pushes starting mid-November
3. **Target catering/family orders** — currently only 15.9% of volume, clear growth lane
4. **Simplify the menu** — ingredient-frequency analysis flags low-usage "orphan" ingredients as cut candidates

---

## Dashboard Screenshots
<img width="1310" height="743" alt="1 Executive Overview" src="https://github.com/user-attachments/assets/c079b801-d594-48bd-9815-8ed0b78486d8" />
<img width="1311" height="742" alt="2 Menu_performance" src="https://github.com/user-attachments/assets/7ed42ba2-1267-45cb-885e-567aa39d77c8" />
<img width="1322" height="745" alt="3 Demand   operation" src="https://github.com/user-attachments/assets/7be67546-b549-4136-9d78-3e13e20587f0" />
<img width="1318" height="747" alt="4 Busket   menu engineering " src="https://github.com/user-attachments/assets/d1328976-c083-45de-9a0b-6594d4fb8073" />


## Limitations

This dataset supports menu-mix and demand analysis well, but has real boundaries being upfront about them was a deliberate part of the project, not an afterthought:

- **Pricing impact** — A regression testing price against quantity sold found no statistically significant relationship (p = 0.32). Prices were fixed for the full year, which limits what can be tested; a live pricing experiment would be needed to measure this directly.

- **Menu-cut revenue impact** — There is no customer ID in this dataset, so it's impossible to tell whether removing a low-selling pizza actually loses revenue, or whether customers simply buy a similar item instead. The Pareto and trend analysis (see Menu Performance) reliably flags which items are declining, but confirming the *financial impact of removing them* would need customer-level tracking to rule out normal demand noise from real substitution behavior.

- **Staffing cost / labor efficiency** — No worker, shift, or labor-cost data is available, so demand patterns (e.g. the hour × weekday heatmap) can inform scheduling decisions, but not a labor-cost optimization.

- **True ingredient cost / margin** — Ingredients are listed per pizza but not costed. A "low-usage ingredient" is a candidate for menu simplification, not a confirmed cost saving — some may be cheap fillers, others costly specialty items.

- **Second-location feasibility** — No location, demographic, or competitor data exists, so this dataset can support a demand forecast for the *current* store, but not a feasibility assessment for a new one.


## Contact

Fannana Fahreen Aanan — [GitHub](https://github.com/fannanafahreen) . [Linkdin](https://www.linkedin.com/in/fannana-fahreen/) · [Gmail](fannanafahreen@gmail.com)
