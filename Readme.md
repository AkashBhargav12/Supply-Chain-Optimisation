# Supply Chain Optimization for Automotive Manufacturer

## Table of Contents

1. [Project Overview](#project-overview)
2. [Objectives](#objectives)
3. [Implementation Process](#implementation-process)
4. [Data Analysis](#data-analysis)
5. [Results](#results)
6. [Recommendations](#recommendations)
7. [Action Plan](#action-plan)
8. [Monitoring & KPIs](#monitoring--kpis)
9. [Conclusion](#conclusion)

## Project Overview

### Background
This project focuses on optimizing the logistics and supply chain for a vehicle manufacturer to enhance delivery performance, improve supplier relationships, reduce transportation costs, and refine inventory management.

### User Story
As the Head of Operations, we need to optimize our inbound logistics to:
- Ensure timely delivery of parts and components
- Reduce transportation costs
- Maintain optimal inventory levels at warehouses
- Support Just in Time (JIT) manufacturing
- Enhance overall operational efficiency

### Target Audience
- Operations Director
- Supply Chain Managers
- Logistics Coordinators
- Procurement Officers

### Data Source
The analysis uses a synthesized dataset based on hypothetical supply chain operations of an automotive manufacturer, incorporating various supplier and warehouse locations across Europe and the UK.

## Objectives

1. Strengthen Supplier Relationships
2. Optimize Inventory Management for High-Demand Parts
3. Reduce Lead Time
4. Improve On-Time Delivery Rate
5. Implement Cost-Effective Transport Solutions
6. Prioritize Best Suppliers for Each Part Category
7. Adopt Best Practices in Inventory Management

## Implementation Process

### 1. Design Phase
#### Dashboard Components
- Overview Section
- Supplier Performance
- Warehouse Inventory Management
- Transportation Efficiency
- Cost Analysis
- Delivery Efficiency
- Interactive Filters and Drill-Downs

#### Tools Used
| Tool | Purpose |
|------|----------|
| Excel | Data exploration |
| MySQL Server | Data cleaning and analysis |
| Power BI | Interactive dashboard creation |
| GitHub | Project documentation |
| Mokkup AI | Dashboard mockup design |

### 2. Development Phase
#### Data Cleaning Process
1. Convert date columns to DateTime format
2. Handle outliers in numerical data
3. Standardize text data
4. Validate data consistency
5. Check for missing values
6. Verify data ranges

#### Database Schema
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
```

## Data Analysis

### Key Findings

1. **Top 5 Suppliers by Quantity**
   - SUPPLIER_376: 8,445 units
   - SUPPLIER_390: 7,342 units
   - SUPPLIER_126: 7,337 units
   - SUPPLIER_55: 7,273 units
   - SUPPLIER_304: 6,933 units

2. **Most Ordered Parts**
   - Windshield: 166,922 units
   - Door: 165,268 units
   - Seat: 157,901 units

3. **Performance Metrics**
   - Average Lead Time: 13.68 days
   - On-Time Delivery Rate: 40.53%
   - Most Cost-Effective Transport: Rail (Avg. Cost: £1,050.43)

## Results

### Dashboard Visualizations
[Access PowerBI Dashboard](https://app.powerbi.com/view?r=eyJrIjoiYTUxMWU2MGQtNTJmZC00MGFhLWE4MzEtYTZkMTU0YzJjMjAyIiwidCI6ImI1MWY0MTY0LTE1M2ItNDhlYi05MWMyLTZiYzVmYTgxNmI0NiJ9)

The dashboard consists of six pages:
1. Overview
2. Supplier Performance
3. Warehouse Operations
4. Transport Performance
5. Delivery Performance
6. Cost Analysis

## Recommendations

1. **Supplier Relationship Enhancement**
   - Develop strategic partnerships with top 5 suppliers
   - Implement Kraljic Matrix for partnership framework

2. **Inventory Optimization**
   - Increase stock levels for high-demand parts
   - Implement improved forecasting methods

3. **Lead Time Reduction**
   - Target below 14-day average
   - Streamline procurement processes

4. **Delivery Performance**
   - Investigate causes of low on-time delivery rate
   - Implement corrective actions

5. **Transport Optimization**
   - Increase rail transport usage
   - Balance cost savings with delivery speed

## Action Plan

### Immediate Actions (0-3 months)
1. Schedule quarterly business reviews with top suppliers
2. Implement real-time shipment tracking
3. Conduct inventory management training

### Medium-Term Actions (3-6 months)
1. Develop supplier scorecard system
2. Optimize transport mix
3. Implement advanced inventory management systems

### Long-Term Actions (6-12 months)
1. Establish long-term supplier contracts
2. Deploy comprehensive performance monitoring
3. Implement automated inventory optimization

## Monitoring & KPIs

### Core Metrics
1. **Supplier Performance**
   - Supplier Score
   - Contract Compliance Rate
   - Review Attendance

2. **Inventory Management**
   - Stockout Rate
   - Inventory Turnover
   - Safety Stock Levels

3. **Delivery Performance**
   - On-Time Delivery Rate
   - Lead Time Variance
   - Customer Satisfaction Score

### Monitoring Methods
- Real-time tracking systems
- Monthly performance reviews
- Quarterly supplier assessments
- Automated alert systems

## Conclusion

This optimization project has identified significant opportunities for improvement in the automotive manufacturer's supply chain. Through detailed analysis and strategic recommendations, we've outlined a path to:
- Enhanced supplier relationships
- Optimized inventory management
- Reduced transportation costs
- Improved delivery performance

Implementation of these recommendations will support JIT manufacturing and drive operational excellence across the supply chain.
