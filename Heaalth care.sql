create database healthcare;
use healthcare;
select * from healthcare_csv;
select count(fac_name) as total_hospitals from healthcare_csv;
select sum(round(net_tot,2)) as total_revenue from healthcare_csv;
select sum(lic_beds  + avl_beds) as total_beds from healthcare_csv;
select sum(dis_tot) as total_discharges from healthcare_csv;
SELECT county_name, count(fac_name) as hospital_count from healthcare_csv group by county_name order by hospital_count desc limit 5;
select fac_name, sum(net_tot) as total_revenue from healthcare_csv group by fac_name order by total_revenue desc limit 10;
select type_cntrl, sum(net_pat_rev_cc) as Net_Patient_Revenue from healthcare_csv group by type_cntrl order by net_patient_revenue desc limit 5;

select teach_rurl,type_cntrl,sum(net_pat_rev_cc) as Net_Patient_Revenue 
from healthcare_csv group by teach_rurl, type_cntrl order by net_patient_revenue desc;

select county_name,fac_name,sum(net_tot) as total_revenue
from healthcare_csv group by county_name, fac_name order by total_revenue desc limit 20;

select county_name,fac_name,sum(net_pat_rev_cc) as total_revenue
from healthcare_csv group by county_name, fac_name order by total_revenue desc limit 20;

select year(year_qtr), sum(net_tot) as net_total_revenue from healthcare_csv group by year(year_qtr) order by year(year_qtr); 
SELECT YEAR(STR_TO_DATE(beg_date, '%d/%m/%Y')) AS year, SUM(net_tot) AS net_total_revenue
FROM healthcare_csv GROUP BY YEAR(STR_TO_DATE(beg_date, '%d/%m/%Y')) ORDER BY YEAR(STR_TO_DATE(beg_date, '%d/%m/%Y'));