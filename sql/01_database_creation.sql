create database martpulse_ai;
use martpulse_ai;

-- Import of raw .csv files has been done via "Table Data Import Wizard"

-- IMPORT DATA VALIDATION
delimiter //
create procedure verify_table(tab_name varchar(25))
begin
	set @st1=concat('select * from ',tab_name,' limit 3;');
    prepare stmt1 from @st1;
    execute stmt1;
    deallocate prepare stmt1;
    
    set @st2=concat('select count(*) from ',tab_name,';');
    prepare stmt2 from @st2;
    execute stmt2;
    deallocate prepare stmt2;
end //
delimiter ;
call verify_table('channels');
call verify_table('campaigns');
call verify_table('customers'); 
call verify_table('external_factors');
call verify_table('marketing_performance');


#Error Code: 1170. BLOB/TEXT column 'channel_id' used in key specification without a key length
#converting all non-supported types into Varchar/Char datatypes
select 
    TABLE_SCHEMA AS 'Database Name',
    TABLE_NAME AS 'Table Name',
    COLUMN_NAME AS 'Column Name',
    DATA_TYPE AS 'Data Type'
from INFORMATION_SCHEMA.COLUMNS 
WHERE DATA_TYPE IN ('text', 'mediumtext', 'longtext', 'tinytext', 'blob', 'mediumblob', 'longblob', 'tinyblob')
		AND TABLE_SCHEMA = DATABASE();

alter table campaigns modify campaign_id char(5);
alter table campaigns add constraint PK_CA primary key(campaign_id);
alter table campaigns modify campaign_name varchar(50);
alter table campaigns modify campaign_type char(30);
alter table campaigns modify brand varchar(30);
alter table campaigns modify product_category varchar(30);
alter table campaigns modify channel_id char(5);
alter table campaigns modify campaign_start_date date;
alter table campaigns modify campaign_end_date date;
alter table campaigns modify campaign_status varchar(15);

alter table channels modify channel_id char(5);
alter table channels modify channel_name varchar(30);
alter table channels modify  channel_type varchar(30);

alter table customers modify customer_id char(10);
alter table customers modify city varchar(30);
alter table customers modify state varchar(30);
alter table customers modify audience_segment varchar(40);
alter table customers modify gender varchar(15);
alter table customers modify age_group varchar(10);

alter table external_factors modify factor_id char(5);
alter table external_factors modify date date;
alter table external_factors modify holiday_flag varchar(3);
alter table external_factors modify weather varchar(15);
alter table external_factors modify festival_flag varchar(3);

alter table marketing_performance modify performance_id char(10);
alter table marketing_performance modify campaign_id char(5);
alter table marketing_performance modify customer_id char(10);
alter table marketing_performance modify interaction_date date;
alter table marketing_performance modify factor_id char(5);
alter table marketing_performance modify frequency decimal(5,2);


-- Establishing relationship b/w the tables
alter table channels add constraint PK_CH primary key(channel_id);
alter table campaigns add constraint FK_CH_inCA foreign key(channel_id) references channels(channel_id);

alter table customers add constraint PK_CU primary key(customer_id);

alter table external_factors add constraint PK_EF primary key(factor_id);

alter table marketing_performance add constraint PK_MP primary key(performance_id);
alter table marketing_performance add constraint FK_CA_inMP foreign key(campaign_id) references campaigns(campaign_id);
alter table marketing_performance add constraint FK_CU_inMP foreign key(customer_id) references customers(customer_id);
alter table marketing_performance add constraint FK_EF_inMP foreign key(factor_id) references external_factors(factor_id);

DESCRIBE channels;
DESCRIBE campaigns;
DESCRIBE customers;
DESCRIBE external_factors;
DESCRIBE marketing_performance;
