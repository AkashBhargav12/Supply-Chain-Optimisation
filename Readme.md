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





