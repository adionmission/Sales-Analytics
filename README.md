# Sales Analytics

Analysis of ALTIQ company sales dataset.

## Tech Stack
![Made With R](https://img.shields.io/badge/-r-165CAA?style=for-the-badge&labelColor=grey&logo=r&logoColor=white)
![Made With SQL](https://img.shields.io/badge/-mysql-00758F?style=for-the-badge&labelColor=grey&logo=mysql&logoColor=white)
![Made With Tableau](https://img.shields.io/badge/-tableau-orange?style=for-the-badge&labelColor=grey&logo=tableau&logoColor=white)

![GitHub License](https://img.shields.io/github/license/adionmission/Sales-Analytics)
![GitHub Release Date](https://img.shields.io/github/release-date/adionmission/Sales-Analytics)
![GitHub repo size](https://img.shields.io/github/repo-size/adionmission/Sales-Analytics)


## Download

```bash
  git clone https://github.com/adionmission/Sales-Analytics.git
```

## About

The original procedure applied on sales dataset was data insights using SQL and then using PowerBI for data cleaning and analysis.

Using SQL is good for insights but when it comes to data cleaning, the SQL code becomes very complex or when using codes on PowerBI. 

Too much of manual work. Writing so much code you know.

Now here comes the role on R where you just need to define a function in a pipline.

## Data Pipline in R

Defining data pipeline in R for data cleaning.

```r
  data_clean = df %>%
    na_if(-1) %>%
    na_if(0) %>%
    na_if("") %>%
    drop_na()
```

## Dataset

The datset is about the sales record of company named ALTIQ. The dataset is in SQL format and contains 5 tables named as:
- Customers
- Data
- Markets
- Products
- Transactions

The dataset is in STAR SCHEMA format where transactions is the FACT tbale and others are dimension tables.

## Original Methodology
- Data insights using SQL.
- Data cleaning using PowerBI.
- Data visualization using PowerBI.

## My Methodology
- Data insights using SQL.
- Data cleaning using R programming.
- Data visualization using Tableau.

I used Tableau as it is used to process big dataset.

During the datainsghts, I joined all the dimension tables with the fact tables just to keep things simple and now we need to work with just single file.

I used INNER JOIN to combine all table but some redundant columns also came in. So removed those column during the pipline stage.  

## Cleaning Redundant Columns

Redundant columns came into due to INNER JOIN.

```r
  data_clean = df %>%
    subset(select=-c(date, product_code_1, customer_code_1, markets_code))
```

## SQL Query

SQL query to join all tables into one.

```sql
  SELECT *
  FROM sales.transactions
  INNER JOIN sales.customer ON sales.transactions.customer_code = sales.customer.customer_code
  INNER JOIN sales.products ON sales.transactions.product_code = sales.products.product_code
  INNER JOIN sales.markets ON sales.transactions.market_code = sales.transaction.markets_code
  INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
```

## Redundancy in Currency

There were some redundancy in curreny column in transactions table like 
- USD & USD\r
- INR & INR\r

Further conversion from USD to INR where also performed.

```r
  data_clean$currency[data_clean$currency == "INR\r"] = "INR"
  data_clean$currency[data_clean$currency == "USD\r"] = "INR"
```

## Visualizations

The visualization were made using Tableau.

![Sales Dashboard](sales_dashboard.png)

![Enhanced Sales Dashboard](enhance_sales_dashboard.png)


## Acknowledgements

 - [Dataset](https://github.com/codebasics/DataAnalysisProjects/tree/master/1_SalesInsights)

