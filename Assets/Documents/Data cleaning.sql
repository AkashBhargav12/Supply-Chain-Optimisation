/*
Data Cleaning Steps
1. Convert Date columns into Datetime format
2. Correct invaild date ranges
3. Handle outliers
4. Standardise text data
5. Ensure data consitency
6. Revalidate data types
*/
Use automotive_logistics;
drop table if exists cleaned_automotive_logistics;
-- 1. Converting date columns to Datetime format

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

-- 2. Correct Invalid Date Ranges

UPDATE Cleaned_Automotive_Logistics
SET EstimatedDeliveryDate = ActualDeliveryDate, ActualDeliveryDate = EstimatedDeliveryDate
WHERE EstimatedDeliveryDate > ActualDeliveryDate;

-- Verify corrections
SELECT * FROM Cleaned_Automotive_Logistics
WHERE OrderDate > EstimatedDeliveryDate OR EstimatedDeliveryDate > ActualDeliveryDate;

-- 3. Handle Outliers
 
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

-- 4. Standardise text data

UPDATE Cleaned_Automotive_Logistics
SET PartDescription = UPPER(PartDescription),
    SupplierName = UPPER(SupplierName),
    WarehouseLocation = UPPER(WarehouseLocation),
    SupplierLocation = UPPER(SupplierLocation),
    TransportMode = UPPER(TransportMode);
SELECT * FROM Cleaned_Automotive_Logistics;

-- 5. Data Consistency check 

SELECT *, (Quantity * UnitCost) AS CalculatedTotalCost
FROM Cleaned_Automotive_Logistics
WHERE TotalCost != (Quantity * UnitCost);

-- Update TotalCost to correct discrepancies
UPDATE Cleaned_Automotive_Logistics
SET TotalCost = Quantity * UnitCost
WHERE TotalCost != (Quantity * UnitCost);

-- 6. Revalidate Data types

DESCRIBE Cleaned_Automotive_Logistics;

-- 7. Logical consistency check

SELECT * FROM Cleaned_Automotive_Logistics
WHERE WarehouseCapacity < CurrentInventory;

UPDATE Cleaned_Automotive_Logistics
SET CurrentInventory = WarehouseCapacity
WHERE WarehouseCapacity < CurrentInventory;
 
-- 8. Missing Values check

SELECT * FROM Cleaned_Automotive_Logistics
WHERE OrderDate IS NULL OR EstimatedDeliveryDate IS NULL OR ActualDeliveryDate IS NULL 
OR Quantity IS NULL OR UnitCost IS NULL OR TransportMode IS NULL 
OR TransportCost IS NULL OR WarehouseID IS NULL OR WarehouseLocation IS NULL 
OR WarehouseCapacity IS NULL OR CurrentInventory IS NULL 
OR SupplierName IS NULL OR SupplierLocation IS NULL OR TotalCost IS NULL 
OR LeadTimeDays IS NULL;


-- 9. Data range validation

-- Example for Quantity
SELECT MIN(Quantity), MAX(Quantity) FROM Cleaned_Automotive_Logistics;

-- Example for UnitCost
SELECT MIN(UnitCost), MAX(UnitCost) FROM Cleaned_Automotive_Logistics;

-- Example for TransportCost
SELECT MIN(TransportCost), MAX(TransportCost) FROM Cleaned_Automotive_Logistics;

-- Example for LeadTimeDays
SELECT MIN(LeadTimeDays), MAX(LeadTimeDays) FROM Cleaned_Automotive_Logistics;
 
 -- 10. Descriptive Stats
 
 SELECT AVG(Quantity) AS AvgQuantity, MIN(Quantity) AS MinQuantity, MAX(Quantity) AS MaxQuantity, STDDEV(Quantity) AS StdDevQuantity
FROM Cleaned_Automotive_Logistics;

SELECT SupplierID, SupplierName, COUNT(*) AS TotalOrders
FROM Cleaned_Automotive_Logistics
GROUP BY SupplierID, SupplierName;

Select * from Cleaned_Automotive_Logistics;