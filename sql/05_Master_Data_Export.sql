select
    MP.*,
    CA.campaign_name,
    CA.campaign_type,
    CA.brand,
    CA.product_category,
    CA.campaign_budget,
    CA.campaign_status,
    CH.channel_name,
    CH.channel_type,
    CH.city,
    CU.state,
    CU.gender,
    CU.age_group,
    CU.audience_segment,
    EF.weather,
    EF.holiday_flag,
    EF.festival_flag,
    EF.competitor_spend,
    EF.discount_percentage
from marketing_performance as MP inner join campaigns as CA on MP.campaign_id = CA.campaign_id
inner join channels as CH ON CA.channel_id = CH.channel_id
inner join customers as CU ON MP.customer_id = CU.customer_id
inner join external_factors EF ON MP.factor_id = EF.factor_id;