/* BUSINESS ANALYSIS for the problem statment:
	Despite maintaining a relatively stable marketing budget, 
    Between February 2025 and April 2025, 
    the company observed a significant decline in marketing-driven revenue. */
    
#Verification of Problem Statement: Did the sales drop?
-- Monthly revenue Trend
select date_format(interaction_date,'%Y-%m') as 'Month', sum(revenue) as 'Revenue'
from marketing_performance where interaction_date between '2025-02-01' and '2025-04-30'
group by Month order by Month;


-- Marketing Efficiency based on the specified monthly sales drop
select date_format(interaction_date,'%Y-%m')as 'Month',
		round((sum(clicks)/sum(impressions))*100,2) as 'CTR',
        round((sum(conversions)/sum(reach))*100,2) as 'CVR',
        round(sum(spend)/sum(clicks),2) as 'CPC',
        round(sum(spend)/sum(conversions),2) as 'CPA',
        round(sum(revenue)/sum(spend),2) as 'ROAS'
from marketing_performance where interaction_date between '2025-02-01' and '2025-04-30' 
group by Month order by Month;


-- Which channel lost revenue?
select date_format(MP.interaction_date,'%Y-%m') as 'Month',CH.channel_type,CH.channel_name,sum(revenue) as 'Revenue' from channels as CH 
inner join campaigns as CA on CA.channel_id=CH.channel_id
inner join marketing_performance as MP on MP.campaign_id=CA.campaign_id
where interaction_date between '2025-02-01' and '2025-04-30'
group by Month, CH.channel_type,CH.channel_name
order by Month asc, revenue desc;


-- Which campaign performed poorly
with CA_cte as(Select CA.campaign_name,CA.campaign_type from campaigns as CA),
	MP_cte as(Select date_format(interaction_date,'%Y-%m') as 'Month',
					round(sum(revenue)/sum(spend),2) as 'ROAS'
				from marketing_performance as MP inner join campaigns as CA on MP.campaign_id=CA.campaign_id
				group by Month)
select * from MP_cte  where Month between '2025-02' and '2025-04' order by Month;


-- Which Customers reduced any purchases?
select CU.audience_segment, 
		date_format(interaction_date,'%Y-%m') as 'Month',
		sum(Revenue) as 'Customer Spent'
from marketing_performance as MP inner join customers as CU on MP.customer_id=CU.customer_id
where interaction_date between '2025-02-01' and '2025-04-30'
group by CU.audience_segment, Month
order by Month;

select CU.age_group, 
		date_format(interaction_date,'%Y-%m') as 'Month',
		sum(Revenue) as 'Customer Spent'
from marketing_performance as MP inner join customers as CU on MP.customer_id=CU.customer_id
where interaction_date between '2025-02-01' and '2025-04-30'
group by CU.age_group, Month
order by Month;

select CU.state, 
		date_format(interaction_date,'%Y-%m') as 'Month',
		sum(Revenue) as 'Customer Spent'
from marketing_performance as MP inner join customers as CU on MP.customer_id=CU.customer_id
where interaction_date between '2025-02-01' and '2025-04-30'
group by CU.state, Month
order by Month;

select CU.gender, 
		date_format(interaction_date,'%Y-%m') as 'Month',
		sum(Revenue) as 'Customer Spent'
from marketing_performance as MP inner join customers as CU on MP.customer_id=CU.customer_id
where interaction_date between '2025-02-01' and '2025-04-30'
group by CU.gender, Month
order by Month;



-- External Factors possibilities
select date_format(MP.interaction_date,'%Y-%m') as 'Month', EF.weather,sum(MP.revenue) as 'Revenue'
from external_factors as EF inner join marketing_performance as MP
on EF.factor_id=MP.factor_id where interaction_date between '2025-02-01' and '2025-04-30'
group by EF.weather,Month order by Month;

select date_format(MP.interaction_date,'%Y-%m') as 'Month', EF.holiday_flag,sum(MP.revenue) as 'Revenue'
from external_factors as EF inner join marketing_performance as MP
on EF.factor_id=MP.factor_id where interaction_date between '2025-02-01' and '2025-04-30'
group by EF.holiday_flag,Month order by Month;

select date_format(MP.interaction_date,'%Y-%m') as 'Month', EF.festival_flag,sum(MP.revenue) as 'Revenue'
from external_factors as EF inner join marketing_performance as MP
on EF.factor_id=MP.factor_id where interaction_date between '2025-02-01' and '2025-04-30'
group by EF.festival_flag,Month order by Month;

select date_format(MP.interaction_date,'%Y-%m') as 'Month', EF.discount_percentage,sum(MP.revenue) as 'Revenue'
from external_factors as EF inner join marketing_performance as MP
on EF.factor_id=MP.factor_id where interaction_date between '2025-02-01' and '2025-04-30'
group by EF.discount_percentage,Month order by Month;

select date_format(MP.interaction_date,'%Y-%m') as 'Month', EF.competitor_spend,sum(MP.revenue) as 'Revenue'
from external_factors as EF inner join marketing_performance as MP
on EF.factor_id=MP.factor_id where interaction_date between '2025-02-01' and '2025-04-30'
group by EF.competitor_spend,Month order by Month;


-- ROOT CAUSE ANALYSIS
select CASE WHEN interaction_date<'2025-03-01' THEN 'Before Decline'
			else 'Decline Period' END as 'Period',
		sum(revenue) as 'Revenue', sum(spend) as 'Cost',
        ROUND(SUM(revenue)/SUM(spend),2) as 'ROAS',
        ROUND(SUM(clicks)*100/SUM(impressions),2)as  'CTR',
        ROUND(SUM(conversions)*100/SUM(clicks),2) as 'CVR'
from marketing_performance group by Period;


        
        