use martpulse_ai;

-- Validation: to check records have been properlly imported from the csv file created
delimiter //
create procedure record_verification(tab varchar(30))
begin
	set @st=concat('Select count(*) from ',tab,';');
    prepare stmt from @st;
    execute stmt;
    deallocate prepare stmt;
end //
delimiter ;
call record_verification('channels');
call record_verification('campaigns');
call record_verification('customers');
call record_verification('external_factors');
call record_verification('marketing_performance');


-- Validation: duplicate records
select * from channels where channel_id in (Select channel_id from channels group by channel_id
													having count(*)>1);
select * from campaigns where campaign_id in (Select campaign_id from campaigns group by
													campaign_id having count(*)>1);
select * from customers where customer_id in (Select customer_id from customers group by
													customer_id having count(*)>1);
select * from external_factors where factor_id in (Select factor_id from external_factors
														group by factor_id having count(*)>1);
select * from marketing_performance where performance_id in (select performance_id from 
													marketing_performance group by performance_id
                                                    having count(*)>1);
               
               
-- Validation: Null values
delimiter //
create procedure null_validate(tab varchar(30),field varchar(30))
begin
	declare res varchar(50);
    set @st1=concat('Select * from ',tab,' where ',field,' is null;');
    prepare stmt1 from @st1;
    execute stmt1;
    deallocate prepare stmt1;
end //
delimiter ;
call null_validate('channels','channel_id');
call null_validate('customers','customer_id');
call null_validate('external_factors','factor_id');
call null_validate('marketing_performance','performance_id');


-- Validation: relationship b/w tables
select distinct MP.campaign_id from marketing_performance as MP left join campaigns as CA 
on MP.campaign_id=CA.campaign_id where CA.campaign_id is null;

select distinct MP.customer_id from marketing_performance as MP left join customers as CU
on MP.customer_id=CU.customer_id where CU.customer_id is null;

select distinct MP.factor_id from marketing_performance as MP left join external_factors as EF
on MP.factor_id=EF.factor_id where EF.factor_id is null;


-- Validation: Business Rules
select spend from marketing_performance where spend<=0;

select impressions from marketing_performance where impressions<reach;

select clicks from marketing_performance where clicks>impressions or clicks>reach;

select conversions from marketing_performance where conversions>clicks or conversions>reach;

select revenue from marketing_performance where revenue<0;

select * from campaigns where campaign_start_date>campaign_end_date;

select interaction_date from marketing_performance  as MP inner join campaigns as CA
on MP.campaign_id=CA.campaign_id where interaction_date not between CA.campaign_start_date and CA.campaign_end_date;

select distinct channel_type from channels;
select distinct channel_name from channels;

select distinct campaign_status from campaigns;

select distinct holiday_flag from external_factors;
select distinct festival_flag from external_factors;
select distinct weather from external_factors;






												



