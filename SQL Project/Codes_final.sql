use sql_project1;
-- Q1 How does corruption correlate with the GDP or overall wealth of a country?
select b.country_name,b.corruption_index,d.cost_index,d.monthly_income,c.gdp_ppp,RANK() OVER (ORDER BY b.corruption_index DESC) AS corruption_rank,RANK() OVER (ORDER BY c.gdp_ppp DESC) AS gdp_rank
from countries as a
inner join corruption as b
on a.country_name = b.country_name
inner join gdp_ppp as c
on a.country_name = c.country_name
inner join cost_of_living as d
on a.country_name = d.country_name
order by b.corruption_index desc;
/*
Corruption vs. GDP: 
While some countries with high corruption have higher GDP (like Equatorial Guinea), others with similarly high corruption have much lower GDP (like Haiti and Nicaragua). 
This suggests that while corruption might generally be correlated with lower GDP, exceptions can arise due to other factors.

Cost of Living and Income: There’s a noticeable gap between the cost of living and monthly income in highly corrupt countries, 
which could indicate a higher economic burden on citizens in those regions. 
Haiti, in particular, shows extreme economic hardship, where high corruption coincides with a low GDP and poor income levels relative to the cost of living
*/

-- Q2 Does a high cost of living deter tourism, or are there popular tourist destinations with high costs of living?
select a.country_name,b.tourists_in_millions,b.receipts_in_billions,b.receipts_per_tourist,b.percentage_of_gdp,c.cost_index,c.purchasing_power_index,
round((b.receipts_in_billions / b.tourists_in_millions) *1000* (b.percentage_of_gdp/100),2) as tourist_gdp_contribution,
CASE 
WHEN b.percentage_of_gdp > 10 THEN 'High' 
WHEN b.percentage_of_gdp <=10 and b.percentage_of_gdp >5 THEN 'Moderate'
ELSE 'Low' END as tourism_dependency
from countries as a
inner join tourism as b
on a.country_name = b.country_name
inner join cost_of_living as c
on a.country_name = c.country_name
order by b.percentage_of_gdp desc;
/*
High Costs Can Coexist with High Tourism: 
The data suggests that high living costs do not necessarily deter tourism, especially in destinations that provide exclusive experiences or cater to affluent tourists. 
Countries with a strong tourism brand can attract visitors despite high costs.

Economic Diversification: 
Countries with low tourism dependency often have diversified economies that do not rely heavily on tourism, indicating a balanced economic structure.

Target Audience and Marketing: 
Countries like Macao successfully attract high-value tourists, 
emphasizing the importance of targeting the right audience and crafting marketing strategies that highlight unique tourism offerings.

High Receipts with Low Tourist Numbers:
Many destinations exemplify a strategy of attracting high-spending tourists, evidenced by low tourist numbers coupled with significant receipts. 
For instance, countries like Qatar and Hong Kong have relatively few visitors—0.6 million and 3.6 million, respectively—but generate high receipts, 
approximately $14.32 billion and $32.7 billion. 
Both achieve impressive receipts per tourist—$24,601 for Qatar and $9,161 for Hong Kong—underscoring their focus on luxury tourism. 
By targeting affluent travelers and offering premium experiences, 
these destinations effectively generate substantial economic benefits despite having smaller overall tourist bases.
*/

-- Q3 Do the richest countries (by GDP) have lower unemployment rates?
select a.country_name,b.unemployment_rate,c.country_name as rich_country, c.gdp_per_capita
from countries as a
inner join unemployment as b
on a.country_name = b.country_name
left join richest_countries as c
on a.country_name = c.country_name
order by b.unemployment_rate asc;

/*
While rich countries (high GDP per capita) generally tend to have low unemployment, 
this result demonstrates that low unemployment rates can exist in less wealthy or non-rich countries as well.
This highlights that GDP per capita is not the sole determinant of a country's unemployment rate. 
Factors like economic structure, labor market size, informal employment, tourism, and government policies can play significant roles in maintaining low unemployment.

For example, countries like Cambodia and Niger might have low unemployment because of labor-intensive industries, 
but this doesn't necessarily mean their population enjoys high standards of living or economic wealth.
*/

-- Q4 Is there a connection between high tourism rates and lower unemployment?
select a.country_name,b.unemployment_rate,c.tourists_in_millions,c.receipts_in_billions,c.receipts_per_tourist,c.percentage_of_gdp,
round((c.receipts_in_billions / c.tourists_in_millions) *1000* (c.percentage_of_gdp/100),2) as tourist_gdp_contribution
from countries as a
inner join unemployment as b
on a.country_name = b.country_name
left join tourism as c
on a.country_name = c.country_name
order by b.unemployment_rate desc;
/*
High Tourism and Unemployment Rates:
Countries like South Africa have a high unemployment rate (28.84%) despite having tourism (3.9 million tourists and $2.72 billion in receipts), 
indicating that tourism alone may not be enough to reduce unemployment without other economic factors or policies.
In contrast, Greece has a relatively lower unemployment rate (12.43%) and significant tourism contributions (7.4 million tourists and $6.19 billion in receipts). 
This suggests that while tourism can contribute significantly to the economy, it does not necessarily result in very low unemployment.

Low Unemployment with Significant Tourism:
Countries such as Hong Kong, Luxembourg, and Qatar show low unemployment rates (4.32%, 4.58%, and 0.13%, respectively) along with high tourism receipts. 
For example, Qatar has only 0.6 million tourists but generates a massive $14.32 billion in receipts, with an extremely high receipts-per-tourist value of $24,601. 
These countries benefit from high-value tourism and efficient economies, which may explain their low unemployment rates.

Countries with High Tourism GDP Contribution:
Countries like Luxembourg (453.9), Hong Kong (808.42), and Portugal (105.2) have a significant percentage of their GDP derived from tourism. 
These countries manage to leverage tourism as a major economic driver. 
However, this is not always directly correlated with very low unemployment rates, as seen in Portugal (6.01% unemployment rate) compared to Luxembourg's (4.58%).

Tourism-Driven Economies with Moderate Unemployment:
In Turkey and Croatia, tourism contributes a significant portion to the GDP (14.63% and 21.63%, respectively), 
but their unemployment rates (10.43% and 6.96%) are still notable. While tourism helps sustain the economy, 
other economic sectors may struggle, preventing lower unemployment rates.

Countries with Low Unemployment and Moderate Tourism Impact:
In countries like Germany and United States, both have relatively low unemployment rates (3.14% and 3.65%) 
with significant tourism sectors (Germany with 12.4 million tourists generating $58.37 billion, and the U.S. with 45 million tourists generating $84.21 billion). 
However, tourism contributes a smaller percentage of GDP (Germany 1.4%, U.S. 0.4%), 
showing that these countries have diversified economies where tourism is not the primary driver of employment.

Small Countries with High Tourism Impact:
For small countries like Macao and Serbia, tourism plays a substantial role in the economy. 
Macao, with a low unemployment rate (2.41%), benefits enormously from tourism (5.9 million tourists and $9.44 billion in receipts), 
with tourism contributing a massive 31.6% of GDP. Similarly, Serbia (unemployment 8.68%) relies heavily on tourism (tourist receipts making up 81.65% of GDP), 
suggesting that tourism is a critical economic driver in smaller nations.
*/

-- Q5 How does the cost of living impact unemployment rates?
select a.country_name,b.unemployment_rate,c.cost_index,c.monthly_income,c.purchasing_power_index,rank() over(order by b.unemployment_rate desc) as high_unemployment,
rank() over(order by c.cost_index desc) as high_cost_of_living
from countries as a
inner join unemployment as b
on a.country_name = b.country_name
inner join cost_of_living as c
on a.country_name = c.country_name
order by high_unemployment,high_cost_of_living desc;
/*
High Cost of Living, High Unemployment: 
Countries like Spain and Greece show both high unemployment and high living costs, suggesting economic strain may limit job opportunities.

Low Unemployment, High Cost of Living: 
Wealthier nations like Norway and Switzerland maintain low unemployment despite high living costs due to higher wages and strong social support.

Low Cost of Living, High Unemployment: 
Countries like Lesotho and Tunisia have high unemployment despite lower living costs, indicating that economic instability and weak infrastructure play a bigger role.
*/

-- Q6 What are the top 10 countries with the best economic health based on a composite index of wealth, low corruption, and low unemployment?
select a.country_name,b.corruption_index,c.gdp_ppp,d.unemployment_rate, e.purchasing_power_index,
rank() over(order by c.gdp_ppp desc,d.unemployment_rate asc,b.corruption_index asc,e.purchasing_power_index desc) as healthy_economy
from countries as a
inner join corruption as b
on a.country_name = b.country_name
inner join gdp_ppp as c
on a.country_name = c.country_name
inner join unemployment as d
on a.country_name = d.country_name
inner join cost_of_living as e
on a.country_name = e.country_name
order by healthy_economy asc
limit 10;

-- Q7 Can we group countries into distinct clusters based on economic health?
with ranked_data as(
select a.country_name,b.corruption_index,c.gdp_ppp,d.unemployment_rate, e.purchasing_power_index,
ntile(4) over(order by c.gdp_ppp desc) as gdp_cluster,
ntile(4) over(order by d.unemployment_rate asc) as unemployment_cluster,
ntile(4) over(order by b.corruption_index asc) as corruption_cluster,
ntile(4) over(order by e.purchasing_power_index desc) as purchasing_power_cluster
from countries as a
inner join corruption as b
on a.country_name = b.country_name
inner join gdp_ppp as c
on a.country_name = c.country_name
inner join unemployment as d
on a.country_name = d.country_name
inner join cost_of_living as e
on a.country_name = e.country_name
),

cluster_group as(
select country_name,corruption_index,gdp_ppp,unemployment_rate,purchasing_power_index,gdp_cluster,unemployment_cluster,corruption_cluster,purchasing_power_cluster,
case 
when gdp_cluster = 1 and unemployment_cluster =1 and corruption_cluster = 1 and purchasing_power_cluster = 1 then 'Top Performer'
when gdp_cluster = 4 and unemployment_cluster =4 and corruption_cluster = 4 and purchasing_power_cluster = 4 then 'Low Performer'
else 'Moderate Performer'
end as economic_cluster
from ranked_data
)

select economic_cluster, 
avg(gdp_ppp) as avg_gdp_ppp, 
avg(unemployment_rate) as avg_unemployment, 
avg(corruption_index) as avg_corruption, 
avg(purchasing_power_index) as avg_purchasing_power
from cluster_group
group by economic_cluster
ORDER BY avg_gdp_ppp DESC;

/*
Top Performers are likely wealthy, developed countries with high GDP, low corruption, and strong labor markets, offering their citizens a high standard of living.

Moderate Performers represent countries that are doing reasonably well but face challenges, particularly in managing corruption and improving purchasing power. 
These countries could be emerging markets or developed nations with certain inefficiencies.

Low Performers are economically weak countries with significant issues such as high unemployment, corruption, and low purchasing power. 
These nations require substantial economic reform and development assistance to improve their economic health and quality of life.

This clustering helps to clearly differentiate countries based on their economic health, 
highlighting areas where intervention or policy changes might be needed to promote growth and stability.
*/