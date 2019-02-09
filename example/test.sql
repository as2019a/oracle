select * from employees;
select department_id, max(salary), min(salary) from employees 
group by salary >= 8000;

elect employee_id, first_name, job_id, (salary(1+commission_pct)) 
from empl_view;

select * from regions;
select * from countries;
-- r.region_name, c.country_name

select region_name, country_name from regions r, countries c
where r.region_id = c.region_id;