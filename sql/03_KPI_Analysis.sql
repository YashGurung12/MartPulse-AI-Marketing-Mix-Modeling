/* KPI ANALYSIS: For current status of the business */
/*To Answer:
1. How much did we spend?
2. How much revenue did we generate?
3. Which channels performed best?
4. Which campaign types performed best?
5. Which customer segments generated the most revenue?
6. How did revenue trend over time?*/


#OVERALL BUSINESS KPIs
-- How is the business performing in terms of revenue
select sum(Revenue) as 'Total Revenue' from marketing_performance;

-- What is the total Ad Cost
select sum(spend) as 'Total Ad Cost' from marketing_performance;

-- Total Users who have viewed the advertisements
select sum(impressions) as 'Total Views' from marketing_performance;

-- Total Useres who have interated with the advertisments
select sum(clicks) as 'Total Users Clicked' from marketing_performance;

-- Total Converted Users from advertisements
select sum(conversions) as 'Total Acquisition' from marketing_performance;



#MARKETING KPIs
-- CTR(Click Through Rate)
select round((sum(clicks)/sum(impressions))*100,2) as 'CTR%' from marketing_performance;

-- CVR (Conversion Rate)
select round((sum(conversions)/sum(clicks))*100,2) as 'CVR%' from marketing_performance;

-- CPC (Cost per Clicks)
select round((sum(spend)/sum(clicks)),2) as 'CPC' from marketing_performance;

-- CPA (Cost per Acquisition)
select round((sum(spend)/sum(conversions)),2) as 'CPA' from marketing_performance;

-- ROAS (Return on Ad Spend)
select round(sum(revenue)/sum(spend),2) as 'ROAS' from marketing_performance;



#CHANNEL KPIs
-- Revenue based Best performing Channels
select CH.channel_name, sum(Revenue) as 'Revenue' 
from channels as CH inner join campaigns as CA on CH.channel_id=CA.channel_id
inner join marketing_performance as MP on CA.campaign_id=MP.campaign_id
group by CH.channel_id
order by Revenue desc;

-- Spend based Best performing Channels
with CH_cte as(Select channel_id,channel_name from channels),
	CA_cte as(Select CA.campaign_id,CH_cte.channel_id,CH_cte.channel_name 
				from campaigns as CA inner join CH_cte on CA.channel_id=CH_cte.channel_id),
    MP_cte as(Select CA_cte.channel_name,sum(spend) as 'Total_Spend' from marketing_performance as MP inner join CA_cte 
					on MP.campaign_id=CA_cte.campaign_id group by CA_cte.channel_name)
select * from MP_cte order by Total_Spend;

-- ROAS based Best performing Channels
with CH_cte as(Select channel_id,channel_name from channels),
	CA_cte as(Select CA.campaign_id,CH_cte.channel_name
				from campaigns as CA inner join CH_cte on CA.channel_id=CH_cte.channel_id),
	MP_cte as(select CA_cte.channel_name,sum(MP.revenue)/sum(MP.spend) as 'ROAS' from marketing_performance as MP
				inner join CA_cte on MP.campaign_id=CA_cte.campaign_id group by CA_cte.channel_name)
select * from MP_cte order by ROAS desc;



#CAMPAIGN KPIs
-- Revenue based best Campaigns
select CA.campaign_name,sum(revenue) as 'Revenue' from campaigns as CA inner join marketing_performance as MP 
on CA.campaign_id=MP.campaign_id group by CA.campaign_name order by Revenue desc;

-- Spend based best Campaigns
with CA_cte as (Select Campaign_id,Campaign_name from campaigns),
	MP_cte as(Select CA_cte.campaign_name,sum(spend) as 'Spend' from marketing_performance as MP inner join CA_cte
				on MP.campaign_id=CA_cte.campaign_id group by CA_cte.campaign_name)
select * from MP_cte order by Spend;

-- ROAS based best Campaigns
select CA.campaign_name,sum(revenue)/sum(spend) as 'ROAS' from marketing_performance as MP
inner join campaigns as CA on CA.campaign_id=MP.campaign_id 
group by CA.campaign_name order by ROAS;



#CUSTOMER KPIs
-- City Based Revenue
with CU_cte as(Select customer_id,City from customers),
	MP_cte as(select City,sum(revenue)as 'Revenue' from marketing_performance as MP
				inner join CU_cte on MP.customer_id=CU_cte.customer_id group by City)
select * from MP_cte order by revenue desc;

-- Audience based Revenue
select CU.audience_segment,sum(revenue) as 'Revenue' from customers as CU
inner join marketing_performance as MP on CU.customer_id=MP.customer_id 
group by CU.audience_segment
order by Revenue desc;

-- Age based Revenue
select CU.age_group,sum(revenue) as 'Revenue' from customers as CU
inner join marketing_performance as MP on CU.customer_id=MP.customer_id 
group by CU.age_group
order by Revenue desc;



#TIME BASED KPIs
-- Monthly Revenue
Select date_format(interaction_date,'%Y-%M') as 'Month',sum(Revenue)as 'Revenue' from marketing_performance
group by Month order by Month;

-- Monthly Spend
select date_format(interaction_date,'%Y-%M')as 'Month',sum(Spend) as 'Cost' from marketing_performance 
group by Month order by Month;

-- Monthly Conversions
select date_format(interaction_date,'%Y-%M')as 'Month', sum(conversions) as 'Acquisition'
from marketing_performance group by Month order by Month;


