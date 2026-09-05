# Hotel Bookings Analysis

## Project Overview

This project focuses on the analysis of hotel booking data to identify patterns in volume, cancellations, and guest behaviour.

It has 2 parts:

* SQL Analysis: Digging into the data and running queries using PostgreSQL.

* Power BI Report: Building an interactive dashboard on Power BI Desktop.

The goal is to answer a specific list of business questions, extract key insights, and provide valuable business recommendations.


## Business Questions:

1. How are bookings distributed across hotel types, cities, market segments, and distribution channels?

2. How does the cancellation rate vary across customer types, market segments, distribution channels, hotel types, and room types?
   
3. Is there a relationship between lead time (time between the reservation and stay date) and cancellation rate?
   
4. How do repeated and non-repeated guests differ in their booking behaviour?
   
5. How does ADR (average daily rate) vary across hotel types, room types, cities, market segments, deposit types, and distribution channels?
   
6. How does ADR evolve over time, and are there meaningful differences between weekday and weekend rates?
   
7. Are there observable relationships between ADR and cancellation behaviour?

8. How do booking changes vary across customer types?


## Key Insights:

### Booking Overview

* **City Hotels represent the majority of bookings**, with approximately 78.3K bookings compared to 40.1K for Resort Hotels.
  
* **Online Travel Agencies (Online TA)** are the largest market segment, with roughly 54.5K bookings.
  
* **Travel Agencies/Travel Operators (TA/TO) is the dominant distribution channel**, having close to 97.9K bookings.
  
* Booking volume remained **remarkably stable throughout 2024**, ranging from 9.6K bookings in February to 10.3K in October, with no strong seasonal pattern.
  
* Booking volumes are also **relatively evenly distributed across cities**, with Bhopal having the highest volume at around 8.1K bookings and Indore the lowest at approximately 7.8K.

### Cancellation Analysis

* The overall **cancellation rate is 37.04%**.
  
* **Transient bookings have the highest cancellation rate among customer types**, at 40.75%.
  
* **Groups have the highest cancellation rate among market segments**, at 61.06%.
  
* **TA/TO has the highest cancellation rate among distribution channels**, at 41.03%.
  
* A **positive relationship is visible between lead time and cancellation rate**: bookings made further in advance tend to have higher cancellation rates.
  
* **City Hotels have a higher cancellation rate at 41.73% than Resort Hotels at 27.76%**.
  
* Room Type "P" has a 100% cancellation rate, but seams to be an **outlier with a very small number of bookings**.

### Guest & Booking Behaviour

* Only **3.19% of bookings are from repeated guests**, meaning the dataset is strongly dominated by non-repeated bookings.
  
* **Transient customers account for the majority of bookings**, with approximately 89.6K bookings.
  
* Repeated and non-repeated guests show notable behavioural differences:

  * Average lead time: **30.79 days for repeated guests vs 106.43 days for non-repeated guests**.
    
  * Cancellation rate: **14.49% for repeated vs 37.79% for non-repeated**.
    
  * Average stay length: **1.93 for repeated vs 3.48 nights for non-repeated**.
    
  * Average special requests: **0.63 per booking for repeated vs 0.57 for non-repeated**.
    
  * Average Daily Rate: **$64.54 for repeated vs $103.06 for non-repeated**.
    
* **BB (Bed & Breakfast)** is the most common meal type, with around 92.3K bookings.
  
* Transient-Party customers show the highest average number of booking changes with **0.35 per booking**.

### Pricing & ADR (Average Daily Rate)

* The overall **Average Daily Rate is $103.49**.
  
* **City Hotels have a slightly higher ADR than Resort Hotels**, at $106.87.
  
* **Room Type H has the highest average ADR**, at $190.12.
  
* **GDS has the highest ADR among distribution channels**, at $123.11.
  
* ADR remains **highly stable throughout 2024**, with monthly values ranging only from roughly $102.91 to $104.29.
  
* Weekday and weekend ADR also remain highly stable, with only minor differences.
  
* ADR varies more across booking characteristics than across time or cities. For example, ADR ranges from **$76.21 to $105.50 across deposit types** and from **$87.67 to $108.71 across customer types**.

* **Higher ADR is generally associated with higher cancellation rates, but this does not mean that higher ADR causes more cancellations.**

## Data Preparation

The dataset was imported into Power BI and reviewed in Power Query to verify data types and identify fields requiring transformation.

Key preparation steps included:

* Converting ADR to a fixed decimal number.
  
* Converting reservation_status_date from Date/Time to Date.

* Creating a dedicated date table in Power BI using DAX.
  
* Creating a Hotel Type classification from the hotel field to distinguish City Hotels and Resort Hotels.
  
* Creating a Total Stay Nights field by combining weekday and weekend nights.
  
* Creating calculated measures for key metrics.
  
* Using Field Parameters and Bookmark navigation to create dynamic dashboard visualisations.


## Data Limitations

Several limitations should be considered when interpreting the analysis:

* The dataset includes **booking-level records but no customer identifier**, so individual customers cannot be tracked across multiple bookings.
  
* It also contains both **reservation_status** and **is_canceled**, which show a small discrepancy in cancellation counts. **is_canceled** was used as the cancellation indicator throughout the analysis for consistency.
  
* Some categorical fields contain **Undefined** values. Some examples were market segments and distribution channels.
  
* The dataset covers **2024 only**, so the analysis cannot be used to identify year-over-year trends or long-term seasonality.


## Power BI Dashboard

The Power BI report consists of four pages:

### 1. Booking Overview

Provides an overview of booking volume across cities, hotels and distribution channels, with booking trends throughout 2024.

![Booking Overview](Images/booking_overview.png)

### 2. Cancellation Analysis

Explores cancellation rates across multiple variables, including the relationship between lead time and cancellation behaviour.

![Cancellation Analysis](Images/cancellation_analysis.png)

### 3. Customer & Booking Behaviour

Delves into the differences between repeated and non-repeated guests, including booking behaviour and meal preferences.

![Customer & Booking Behaviour](Images/customer_booking_behaviour.png)

### 4. Pricing & ADR Analysis

Analyses Average Daily Rate across multiple parameters including ADR trends over time and its relationship with cancellation behaviour.

![Pricing & ADR Analysis](Images/pricing_adr_analysis.png)

## SQL Analysis

SQL was used to explore the dataset and answer the main questions before building the Power BI report.

The analysis includes:

* Overall booking performance
  
* Cancellation patterns by customer type and market segment
  
* Booking volume and cancellations by country
  
* Cancellation behaviour by lead time
  
* ADR by customer type, hotel type, and room type
  
* Repeated vs non-repeated guest behaviour
  
* Bookings and ADR by distribution channel and market segment
  
* The relationship between ADR and cancellations
  
* Cancellation behaviour by deposit type

The complete SQL analysis is available in the [`SQL`](SQL/) folder, with individual queries organized by question.


## Business Recommendations

Based on the insights generated from the data, the following actions are recommended to optimize revenue and improve booking efficiency:

* **Implement a Dynamic Cancellation Policy for High-Risk Segments:** With an overall cancellation rate of 37.04% lead by Groups (61.06%), and Transient customers (40.75%), the hotel should enforce stricter, non-refundable deposit requirements for bookings made through Group market segments and Transient customer type.
  
* **Launch a Loyalty Program to Increase Repeat Guests:** Since repeated guests account for only 3.19% of total bookings but have a much lower cancellation rate (14.49%) introducing a structured loyalty or rewards program could significantly increase customer lifetime value and stabilize predictable revenue.
  
* **Optimize Distribution Channel Mix:** While Travel Agencies and Tour Operators (TA/TO) bring in the massive dominant volume of bookings (~97.9K), they also suffer from a very high cancellation rate (41.03%). Marketing efforts and exclusive deals should be shifted toward GDS and Direct channels to maximize profitability per room while mitigating cancellation risks.
  
* **Audit Room Type P Data and Review Room Type H Pricing:** Investigate the 100% cancellation rate of Room Type P to fix potential system or data entry errors. Additionally, build targeted promotions around Room Type H, since it has the highest average ADR ($190.12), making it a premium revenue driver.
  





