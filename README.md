# Olympics SQL Analysis Project
## Overview

This project involves analyzing the Olympics dataset spanning 120 years of history, comprising two CSV files - 'athletes' and 'athlete_events.' These datasets provide comprehensive information about nations participating in the Olympics and the events that occurred over the years. The project aims to answer specific analytical questions related to Olympic performance using SQL techniques.

## Datasets
Create a database called Olympics
Craete 2 tables with [dataset]()

  **Athletes Dataset:**
        Contains detailed information about all players who participated in the Olympics.

  **Athlete Events Dataset:**
        Provides information about all events that occurred over the years, with the 'athlete_id' linking back to the 'id' column in the 'athletes' table.

## Analysis Tasks
1. Team with Maximum Gold Medals Over the Years
2. Total Silver Medals for Each Team and Year
3. Player with Maximum Gold Medals (No Silver or Bronze)
4. Maximum Gold Medals per Year
5. India's First Gold, Silver, and Bronze Medal
6. Players Winning Gold in Both Summer and Winter Olympics
7. Players Winning Gold, Silver, and Bronze in a Single Olympics
8. Players with Consecutive Gold Medals in Three Summer Olympics

## SQL Techniques Used for Analysis
**Key SQL Functions/Concepts Utilized:**

1. **Window Functions:**
  LEAD(), LAG(), ROW_NUMBER(), RANK() for efficient data navigation.
2. **Aggregation:**
   GROUP BY, PARTITION BY, HAVING clauses for summarizing data.
3. **String Aggregation:**
        STRING_AGG() for concatenating string values.
 4. **Common Table Expressions (CTE):**
        Used to streamline complex queries.
 5. **Subqueries:**
        Filtering data based on specified conditions.

## Project Structure

  1. **data/:** Contains the CSV files 'athletes' and 'athlete_events.'
  2. **scripts/:** SQL scripts for importing data and performing analysis.
  3. **presentation/:** Presentation slides summarizing key findings.


  Happy Coding!
