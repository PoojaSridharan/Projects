### SQL Project: Economic and Social Analysis of Countries
**Overview:**

This SQL project analyzes the economic and social health of countries across various metrics, including corruption, GDP (Gross Domestic Product), cost of living, tourism, and unemployment rates. The dataset used includes information on several factors that influence a country's overall economic status. The project aims to explore key questions related to the relationship between corruption, wealth, tourism, cost of living, and unemployment, while identifying patterns that distinguish top-performing economies from struggling ones.

**Project Objectives**
1. Corruption vs. Wealth (GDP): Examine the relationship between a country's corruption index and its GDP or wealth, to determine whether high corruption is associated with lower economic performance.

2. Cost of Living vs. Tourism: Investigate whether a high cost of living deters tourism or whether there are countries with high tourism rates despite high costs.

3. GDP vs. Unemployment: Analyze if richer countries, based on GDP per capita, tend to have lower unemployment rates.

4. Tourism vs. Unemployment: Determine whether countries with higher tourism rates tend to have lower unemployment rates, exploring tourism's potential to create jobs.

5. Cost of Living vs. Unemployment: Investigate how the cost of living affects unemployment rates and whether high living costs correlate with higher or lower unemployment.

6. Top Countries by Economic Health: Rank countries by their overall economic health, using a composite index based on wealth, corruption levels, unemployment rates, and purchasing power.

7. Economic Health Clusters: Group countries into clusters based on their economic performance, creating distinct classifications such as top performers, moderate performers, and low performers.

**SQL Queries and Analysis**
1. Corruption vs. GDP
Goal: Identify how corruption correlates with GDP and economic performance.
Key Insights: While high corruption generally correlates with lower GDP, exceptions exist, such as in countries where other economic factors come into play. There’s a significant gap between the cost of living and monthly income in highly corrupt countries, indicating economic burden.
2. Cost of Living vs. Tourism
Goal: Analyze whether a high cost of living deters tourism.
Key Insights: High tourism rates are not necessarily deterred by high living costs. Many countries attract affluent tourists who contribute significantly to the economy despite the high cost of living, as seen in destinations like Qatar and Hong Kong.
3. GDP vs. Unemployment
Goal: Determine whether the richest countries by GDP have lower unemployment.
Key Insights: While richer countries generally have lower unemployment, there are outliers where countries with lower GDP still maintain low unemployment, possibly due to labor-intensive industries.
4. Tourism vs. Unemployment
Goal: Investigate the connection between tourism rates and unemployment.
Key Insights: Countries with high tourism receipts can still have high unemployment rates if other sectors struggle. In contrast, countries that attract affluent tourists, like Hong Kong and Qatar, tend to have low unemployment due to their efficient economies.
5. Cost of Living vs. Unemployment
Goal: Explore the impact of the cost of living on unemployment rates.
Key Insights: High living costs can coincide with both high and low unemployment rates, depending on the country’s wealth, social policies, and economic structure.
6. Top Countries by Economic Health
Goal: Rank countries based on overall economic health using composite indicators like GDP, corruption index, unemployment rate, and purchasing power.
Key Insights: The healthiest economies tend to have high GDP, low corruption, low unemployment, and strong purchasing power. This ranking highlights the top 10 economically healthy countries.
7. Economic Health Clusters
Goal: Classify countries into distinct economic clusters based on their performance in various metrics.

**Key Insights:**
Top Performers: Wealthy countries with low corruption and unemployment, high GDP, and strong purchasing power.
Moderate Performers: Economically stable but facing challenges in corruption control or improving purchasing power.
Low Performers: Countries struggling with high unemployment, corruption, and low purchasing power.

**Technologies Used**
SQL: Structured Query Language was used to query and manipulate data across multiple tables, join relevant datasets, and create meaningful insights.
RANK() and NTILE(): These window functions were utilized to rank and group countries based on various economic indicators.

**Conclusions**
This project highlights the complexity of global economic health, emphasizing that factors like corruption, cost of living, and tourism can have varying effects on a country's economy. The analysis also demonstrates the importance of balancing multiple metrics—such as GDP, unemployment, and purchasing power—to assess the overall well-being of a nation's economy.

By grouping countries into clusters, the project also provides a framework for comparing economic performance and identifying key areas for improvement or policy changes. Ultimately, this analysis can help policymakers, researchers, and economists better understand global economic dynamics and make informed decisions.
