create database sales_retail;

use sales_retail;

CREATE TABLE sales_data (
    ORDER_NUMBER INT,
    QUANTITY_ORDERED INT,
    PRICE_EACH DECIMAL(10,2),
    ORDER_LINE_NUMBER INT,
    SALES DECIMAL(10,2),
    ORDER_DATE VARCHAR(20),
    STATUS VARCHAR(20),
    QTR_ID INT,
    MONTH_ID INT,
    YEAR_ID INT,
    PRODUCT_LINE VARCHAR(50),
    MSRP DECIMAL(10,2),
    PRODUCT_CODE VARCHAR(50),
    CUSTOMER_NAME VARCHAR(100),
    PHONE VARCHAR(30),
    ADDRESSLINE1 VARCHAR(100),
    CITY VARCHAR(50),
    POSTALCODE VARCHAR(20),
    COUNTRY VARCHAR(50),
    TERRITORY VARCHAR(20),
    CONTACT_LAST_NAME VARCHAR(50),
    CONTACT_FIRST_NAME VARCHAR(50),
    DEAL_SIZE VARCHAR(20)
);

select count(*) from sales_data;


select*from sales_data limit 10;


/*What is the total revenue generated?*/
select sum(SALES) as total_revenue from sales_data; 


/*How Many order are places?*/
select count(ORDER_NUMBER) as Total_Order from sales_data;


/*How many unique customer do we have?*/
select count(distinct CUSTOMER_NAME) as Total_Customer
 from sales_data;


/*What are the total sales by year?*/
select YEAR_ID, Sum(SALES) as Total_Sales
from sales_data group by YEAR_ID
Order by YEAR_ID;


/*What is the monthly sales trend for each year?*/
select YEAR_ID, MONTH_ID, Sum(SALES) as Total_Montly_Sales
from sales_data group by YEAR_ID, MONTH_ID
order by YEAR_ID, MONTH_ID;


/*Which product line genrate the most revenue?*/
select PRODUCT_LINE, sum(SALES) as Total_Revenue_Sales
from sales_data 
group by PRODUCT_LINE
order by Total_Revenue_Sales desc;


/*Whcih country contributes the most to total sales?*/
select COUNTRY, sum(SALES) as Total_Country_Sales
from sales_data
group by COUNTRY
order by Total_Country_Sales desc;


/*Top 10 customer by total purchase value?*/
select CUSTOMER_NAME, sum(SALES) AS Total_Sales
from sales_data
group by CUSTOMER_NAME
order by Total_Sales desc
limit 10;


/*Which deal size contributes the most to sales?*/
select DEAL_SIZE, sum(SALES) as Total_sales
from sales_data
group by DEAL_SIZE
order by Total_sales desc;


/*Average order value*/
select round(sum(SALES)/COUNT(distinct ORDER_NUMBER),2) 
as Avg_Order_Value
from sales_data; 


/*Which city has the highest sales in each country*/
select COUNTRY, CITY, sum(SALES) as Total_Sales
from sales_data
group by COUNTRY, CITY
order by COUNTRY, Total_Sales desc;


/*Revenue contribution by quarter*/
select YEAR_ID,QTR_ID, sum(SALES) as Quarter_Sales
from sales_data
group by YEAR_ID, QTR_ID
order by YEAR_ID, QTR_ID ;


/*Which product line has the highest avg price?*/
select PRODUCT_LINE, Avg(PRICE_EACH) as AVG_PRICE
from sales_data
group by PRODUCT_LINE
order by AVG_PRICE desc;


/*Which customer placed the most orders?*/
select CUSTOMER_NAME, COUNT(ORDER_NUMBER) as Order_Placed
from sales_data
group by CUSTOMER_NAME 
order by Order_Placed desc
limit 10;


/*Total revenue by product line and year*/
select YEAR_ID, PRODUCT_LINE, sum(SALES) as Total_Sales
from sales_data
group by YEAR_ID, PRODUCT_LINE
order by YEAR_ID, Total_Sales desc;

