# Supply Chain Optimisation for Automotive Manufacturer


![Supply Chain Optimisation](Assets/Images/Supply Chain Optimisation.jpg)





# Table of Contents

- [Objective](#objective)
- [User Story](#user-story)
- [Data Source](#data-source)
- [Stages](#stages)
- [Design](#design)
  - [Dashboard components required](#dashboard-components-required)
  - [Dashboard mockup](#dashboard-mockup)
  - [Tools Used](#tools-used)
- [Development](#development)
  - [Pseudocode](#pseudocode)
  - [Data exploration notes](#data-exploration-notes)
  - [Data cleaning](#data-cleaning)
  - [Transform the data](#transform-the-data)
  - [Create the SQL view](#create-the-sql-view)
- [Testing](#testing)
  - [Row Count check](#row-count-check)
  - [Column Count check](#column-count-check)
  - [Data Type check](#data-type-check)
  - [Duplicate Count check](#duplicate-count-check)
- [Visualisation](#visualisation)
  - [Results](#results)
  - [DAX Measures](#dax-measures)
    - [Total Subscribers (M)](#total-subscribers-m)
    - [Total Views (B)](#total-views-b)
    - [Total Videos](#total-videos)
    - [Average Views Per Video (M)](#average-views-per-video-m)
    - [Subscriber Engagement Rate](#subscriber-engagement-rate)
    - [Views per subscriber](#views-per-subscriber)
- [Analysis](#analysis)
  - [Findings](#findings)
    - [Top 10 YouTubers with the most subscribers](#1-who-are-the-top-10-youtubers-with-the-most-subscribers)
    - [Top 3 channels with the most videos uploaded](#2-which-3-channels-have-uploaded-the-most-videos)
    - [Top 3 channels with the most views](#3-which-3-channels-have-the-most-views)
    - [Top 3 channels with the highest average views per video](#4-which-3-channels-have-the-highest-average-views-per-video)
    - [Top 3 channels with the highest views per subscriber ratio](#5-which-3-channels-have-the-highest-views-per-subscriber-ratio)
    - [Top 3 channels with the highest subscriber engagement rate per video uploaded](#6-which-3-channels-have-the-highest-subscriber-engagement-rate-per-video-uploaded)
  - [Notes](#notes)
  - [Validation](#validation)
    - [Youtubers with the most subscribers](#1-youtubers-with-the-most-subscribers)
    - [Youtubers with the most videos uploaded](#2-youtubers-with-the-most-videos-uploaded)
    - [Youtubers with the most views](#3-youtubers-with-the-most-views)
  - [Discovery](#discovery)
  - [Recommendations](#recommendations)
  - [Potential ROI](#potential-roi)
  - [Action plan](#action-plan)




# Objective

- What is the key objective of the project?

  To optimise the logistics and supply chain for a vehicle manufacturer. The objectives can be broken down as follows:

  1. Optimise Delivery Routes and Schedules
  2. Enhance Inventory Management
  3. Reduce Transportation Costs
  4. Improve Supplier Performance


## User Story

As the Head of Operations, I need to optimise our inbound logistics to ensure timely delivery of parts and components, reduce transportation costs and mantain optimal inventory levels at our warehouses. This will enable us to support Just in Time (JIT) manufacturing and enhance overall operational efficiency.

## Target Audience

1. Operations Director
2. Supply Chain Managers
3. Logisitcs Coordinators
4. Procurement officers

## Data Source

The data for this project is coming from a synthesized dataset based on hypothetical supply chain operations of an automotive manufacturer, incorporating various supplier and warehouse locations across Europe and the UK.


# Stages

- Design
- Development
- Testing
- Analysis
- Reccomendations


# Design

- Based on the requirements provided, how can we build a dashboard to gain insights?

The dashboard can contain the following components, to prove a  comprehensive overview of the supply chain performance, enabling stakeholders to make informed decisions and optimise operations effectively:
1. Overview Section
2. Supplier Performance
3. Warehouse Inventory Management
4. Transportation Efficciency
5. Cost Analysis
6. Delivery Efficiency
7. Optimisation Insights
8. Scenario Analysis
9. Interactive Filters and Drill-Downs


## DashBoard Mockups

What should the Dashboard Look like?

Some of the data visulas that may be appropriate in answering our questions include:

1. Table
2. Bar Chart
3. Heatmap
4. Line Chart
5. KPI Card
6. Scatter Plot
7. Donut/Pie Chart

### Warehouse Operations 

![Warehouse Operation](Assets/Images/Warehouse.png)

### Inventory

![Inventory](Assets/Images/Inventory.png)

### Supplier Performance

![Supplier Performance](Assets/Images/Suppliers.png)

### Logisitics

![Logistics](Assets/Images/Logistics.png)


## Tools Used

| **Tool** | **Purpose** |
| --- | --- |
| Excel | Exploring the data |
| MySQL Server | Cleaning, testing, and analyzing the data |
| Power BI | Visualizing the data via interactive dashboards |
| GitHub | Hosting the project documentation |
| Mokkup AI | Designing the mockup of the dashboard |


# Development

## Pseudocode

## Pseudocode

- How can we approach the problem to create a solution from start to finish?

  1. Get the data from a reliable data source
  2. Explore the data in Excel to check for any errors that standout
  3. Load the data into SQL Server
  4. Clean the data with SQL
  5. Test the data with SQL
  6. Load the clean data into PowerBI
  7. Generate visualisations of the data in PowerBI
  8. Generate the findings based on the insights
  9. Write the documentation + commentary
  10. Publish the insights generated
 
## Data exploration notes

This is the stage where we scan the data for errors, inconcsistencies, bugs, weird and corrupted characters etc.

- The initial observations with this dataset are as follows:

1. The dataset contains 3000 records with information related to automotive logistics, including supplier details, part information, order dates, delivery dates, costs, and inventory details.
2. There are no missing values in any of the columns, indicating a complete dataset.
3. The dataset includes details about warehouse capacity and current inventory levels, which can be used to analyze inventory management efficiency and warehouse utilization.
4. Various transport modes are used, including Air, Sea, Road, and Rail. The distribution and cost implications of these modes need further analysis.
5. Outliers exist in numerical columns such as Quantity, UnitCost, TransportCost, TotalCost, and LeadTimeDays. These outliers need further analysis to decide whether to cap, remove, or treat them in some other manner.
6. We need to examine the correlations between numerical variables to identify potential relationships, particularly between costs, quantities, lead times, and transport modes.
7. We can also develop hypotheses related to supply chain performance, such as the impact of transport mode on costs and lead times, or the relationship between order quantities and total costs.


# Data Cleaning and Testing

The aim is to refine the dataset to ensure it is structured and ready for analysis. 

The cleaned data should meet the following criteria and constraints:

- Only relevant columns should be retained.
- All data types should be appropriate for the contents of each column.
- No column should contain null values, indicating complete data for all records.

Below is a table outlining the constraints on our cleaned dataset:

| **Property** | **Description** |
| --- | --- |
| Number of Rows | 3000 |
| Number of Columns | 18 |

And here is a tabular representation of the expected schema for the clean data:

| Column Name             | Data Type    | Description                                           |
|-------------------------|--------------|-------------------------------------------------------|
| `SupplierID`            | INT          | Unique identifier for the supplier                    |
| `PartID`                | INT          | Unique identifier for the part                        |
| `PartDescription`       | VARCHAR(255) | Description of the part                               |
| `OrderDate`             | DATETIME     | Date and time when the order was placed               |
| `EstimatedDeliveryDate` | DATETIME     | Estimated date and time of delivery                   |
| `ActualDeliveryDate`    | DATETIME     | Actual date and time of delivery                      |
| `Quantity`              | INT          | Quantity of parts ordered                             |
| `UnitCost`              | DECIMAL(10,2)| Cost per unit of the part                             |
| `TransportMode`         | VARCHAR(50)  | Mode of transport used for delivery (e.g., Air, Sea)  |
| `TransportCost`         | DECIMAL(10,2)| Cost of transport                                     |
| `WarehouseID`           | INT          | Unique identifier for the warehouse                   |
| `WarehouseLocation`     | VARCHAR(255) | Location of the warehouse                             |
| `WarehouseCapacity`     | INT          | Capacity of the warehouse in terms of storage units   |
| `CurrentInventory`      | INT          | Current inventory level in the warehouse              |
| `SupplierName`          | VARCHAR(255) | Name of the supplier                                  |
| `SupplierLocation`      | VARCHAR(255) | Location of the supplier                              |
| `TotalCost`             | DECIMAL(15,2)| Total cost for the order (Quantity * UnitCost)        |
| `LeadTimeDays`          | INT          | Lead time in days for the delivery                    |


- Steps taken to clean and shape the data into the desired format

  1. Convert Date Columns to Datetime Format
  2. Check for missing values
  3. Handle outliers
  4. Standardise text data
  5. Revalidate data types


## Transform and test the data

Before data transformation, a new database is created in the MySQL server. After the database is created, the raw data file is imported into the server using the table import wizard. After the import is complete, we can now being cleaning the data.

### Convert Date Columns to DateTime format

```sql
CREATE TABLE Cleaned_Automotive_Logistics (
    SupplierID INT,
    PartID INT,
    PartDescription VARCHAR(255),
    OrderDate DATETIME,
    EstimatedDeliveryDate DATETIME,
    ActualDeliveryDate DATETIME,
    Quantity INT,
    UnitCost DECIMAL(10, 2),
    TransportMode VARCHAR(50),
    TransportCost DECIMAL(10, 2),
    WarehouseID INT,
    WarehouseLocation VARCHAR(255),
    WarehouseCapacity INT,
    CurrentInventory INT,
    SupplierName VARCHAR(255),
    SupplierLocation VARCHAR(255),
    TotalCost DECIMAL(15, 2),
    LeadTimeDays INT
);

INSERT INTO Cleaned_Automotive_Logistics (
    SupplierID, PartID, PartDescription, OrderDate, EstimatedDeliveryDate,
    ActualDeliveryDate, Quantity, UnitCost, TransportMode, TransportCost,
    WarehouseID, WarehouseLocation, WarehouseCapacity, CurrentInventory,
    SupplierName, SupplierLocation, TotalCost, LeadTimeDays
)
SELECT 
    SupplierID, PartID, PartDescription,
    STR_TO_DATE(OrderDate, '%Y-%m-%d %H:%i:%s'),
    STR_TO_DATE(EstimatedDeliveryDate, '%Y-%m-%d %H:%i:%s'),
    STR_TO_DATE(ActualDeliveryDate, '%Y-%m-%d %H:%i:%s'),
    Quantity, UnitCost, TransportMode, TransportCost,
    WarehouseID, WarehouseLocation, WarehouseCapacity, CurrentInventory,
    SupplierName, SupplierLocation, TotalCost, LeadTimeDays
FROM Raw_Automotive_Logistics;
```

### Correct Invalid Date Ranges

```sql
UPDATE Cleaned_Automotive_Logistics
SET EstimatedDeliveryDate = ActualDeliveryDate, ActualDeliveryDate = EstimatedDeliveryDate
WHERE EstimatedDeliveryDate > ActualDeliveryDate;

-- Verify corrections
SELECT * FROM Cleaned_Automotive_Logistics
WHERE OrderDate > EstimatedDeliveryDate OR EstimatedDeliveryDate > ActualDeliveryDate;
```

### Handle Outliers

```sql
SET @row_num = 0;
SET @total_rows = (SELECT COUNT(*) FROM Cleaned_Automotive_Logistics);
SET @percentile_1 = 0.01 * @total_rows;
SET @percentile_99 = 0.99 * @total_rows;

SELECT *
FROM Cleaned_Automotive_Logistics
WHERE Quantity < (
  SELECT MIN(Quantity)
  FROM (
    SELECT Quantity,
           @row_num = @row_num + 1 AS row_num
    FROM Cleaned_Automotive_Logistics
    ORDER BY Quantity
  ) AS ordered
  WHERE row_num = CEIL(@percentile_1)
)
OR Quantity > (
  SELECT MAX(Quantity)
  FROM (
    SELECT Quantity,
           @row_num = @row_num + 1 AS row_num
    FROM Cleaned_Automotive_Logistics
    ORDER BY Quantity
  ) AS ordered
  WHERE row_num = CEIL(@percentile_99)
);
```
A similar check is done for all the other columns with numerical values

### Standardise Text Data

```sql
UPDATE Cleaned_Automotive_Logistics
SET PartDescription = UPPER(PartDescription),
    SupplierName = UPPER(SupplierName),
    WarehouseLocation = UPPER(WarehouseLocation),
    SupplierLocation = UPPER(SupplierLocation),
    TransportMode = UPPER(TransportMode);
```

### Data Consistency check

```sql
SELECT *, (Quantity * UnitCost) AS CalculatedTotalCost
FROM Cleaned_Automotive_Logistics
WHERE TotalCost != (Quantity * UnitCost);

-- Update TotalCost to correct discrepancies
UPDATE Cleaned_Automotive_Logistics
SET TotalCost = Quantity * UnitCost
WHERE TotalCost != (Quantity * UnitCost);
```

### Revalidate Data Types

```sql
DESCRIBE Cleaned_Automotive_Logistics;
```
![Revalidated data types](Assets/Images/Revalidated data types.png)

### Missing Values Check

```sql
SELECT * FROM Cleaned_Automotive_Logistics
WHERE OrderDate IS NULL OR EstimatedDeliveryDate IS NULL OR ActualDeliveryDate IS NULL 
OR Quantity IS NULL OR UnitCost IS NULL OR TransportMode IS NULL 
OR TransportCost IS NULL OR WarehouseID IS NULL OR WarehouseLocation IS NULL 
OR WarehouseCapacity IS NULL OR CurrentInventory IS NULL 
OR SupplierName IS NULL OR SupplierLocation IS NULL OR TotalCost IS NULL 
OR LeadTimeDays IS NULL;
```

### Data range Validation

```sql
-- Example for Quantity
SELECT MIN(Quantity), MAX(Quantity) FROM Cleaned_Automotive_Logistics;

-- Example for UnitCost
SELECT MIN(UnitCost), MAX(UnitCost) FROM Cleaned_Automotive_Logistics;

-- Example for TransportCost
SELECT MIN(TransportCost), MAX(TransportCost) FROM Cleaned_Automotive_Logistics;

-- Example for LeadTimeDays
SELECT MIN(LeadTimeDays), MAX(LeadTimeDays) FROM Cleaned_Automotive_Logistics;
```

### Sample queries

Now that the data is cleaned and tested for integrity, we can perform sample queries to ensure consitency and correctness. Here are a few queries that can be performed:

```sql
-- Query to get the total number of orders per supplier
SELECT SupplierID, SupplierName, COUNT(*) AS TotalOrders
FROM Cleaned_Automotive_Logistics
GROUP BY SupplierID, SupplierName;
```

```sql
-- Query to find the top 5 most expensive parts by unit cost
SELECT PartID, PartDescription, UnitCost
FROM Cleaned_Automotive_Logistics
ORDER BY UnitCost DESC
LIMIT 5;
```

```sql
-- Summary statistics for TransportCost
SELECT AVG(TransportCost) AS AvgTransportCost, MIN(TransportCost) AS MinTransportCost, MAX(TransportCost) AS MaxTransportCost, STDDEV(TransportCost) AS StdDevTransportCost
FROM Cleaned_Automotive_Logistics;
```
