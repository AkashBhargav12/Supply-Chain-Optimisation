use automotive_logistics;

-- 1. Top 5 suppliers by quantity supplied

SELECT SupplierName, SUM(Quantity) AS TotalQuantity
FROM cleaned_automotive_logistics
GROUP BY SupplierName
ORDER BY TotalQuantity DESC
LIMIT 5;

-- 2. Top 3 most ordered parts

SELECT PartDescription, SUM(Quantity) AS TotalOrdered
FROM cleaned_automotive_logistics
GROUP BY PartDescription
ORDER BY TotalOrdered DESC
LIMIT 3;

-- 3. Average Lead Time

SELECT AVG(LeadTimeDays) AS AverageLeadTime
FROM cleaned_automotive_logistics;

-- 4. On Time Delivery Rate

SELECT 
  (SUM(CASE WHEN ActualDeliveryDate <= EstimatedDeliveryDate THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS OnTimeDeliveryRate
FROM cleaned_automotive_logistics;

-- 5. Best Transport Mode

SELECT TransportMode, AVG(TransportCost) AS AvgCost
FROM cleaned_automotive_logistics
GROUP BY TransportMode
ORDER BY AvgCost ASC
LIMIT 1;

-- 6. Best supplier for each part

SELECT t.PartDescription, t.SupplierName, t.AvgLeadTime
FROM (
    SELECT PartDescription, SupplierName, AVG(LeadTimeDays) AS AvgLeadTime,
           ROW_NUMBER() OVER (PARTITION BY PartDescription ORDER BY AVG(LeadTimeDays)) AS rn
    FROM cleaned_automotive_logistics
    GROUP BY PartDescription, SupplierName
) t
WHERE t.rn = 1;


-- 7. Top 3 warehouses by turnover rate

SELECT WarehouseLocation, (SUM(Quantity) / AVG(CurrentInventory)) AS InventoryTurnoverRate
FROM cleaned_automotive_logistics
GROUP BY WarehouseLocation
ORDER BY InventoryTurnoverRate DESC
LIMIT 3;

