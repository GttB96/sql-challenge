---- Create tables and import data
create table departments (
	dept_no varchar primary key,
	dept_name varchar
);

create table dept_emp (
	emp_no integer not null,
	dept_no varchar not null,
	primary key(emp_no, dept_no),
	foreign key(emp_no) references employees(emp_no),
	foreign key(dept_no) references departments(dept_no)
);

create table dept_managers (
	dept_no varchar not null,
	emp_no integer not null,
	primary key(dept_no, emp_no),
	foreign key(emp_no) references employees(emp_no)
);

create table employees (
	emp_no integer primary key,
	emp_title_id varchar not null,
	birth_date DATE not null,
	first_name varchar not null,
	last_name varchar not null,
	sex varchar not null,
	hire_date DATE not null,
	foreign key (emp_title_id) references titles(title_id)
);

create table salaries (
	emp_no integer primary key,
	salary integer not null,
	foreign key(emp_no) references employees(emp_no)
);

create table titles (
	title_id varchar primary key,
	title varchar 
);

----Data Analysis #1
select e.emp_no as "Employee Number", first_name as "First Name", last_name as "Last Name", sex as "Sex", salary as "Salaries"
	from employees e
	join salaries
	on e.emp_no = salaries.emp_no
	
---Data Analysis #2
select first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date"
 from employees
 where Date_Part('year', hire_date) = 1986
 
---Data Analysis #3
select d.dept_no as "Department Number", dept_name as "Department Date", d.emp_no as "Employee Number", last_name as "Last Name", first_name as "First Name"
	from dept_managers d
	join departments dep
	on d.dept_no = dep.dept_no
	join employees e
	on d.emp_no = e.emp_no

---Data Analysis #4
select d.dept_no as "Department Number", dep.emp_no as "Employee Number", last_name as "Last Name", first_name as "First Name", dept_name as "Department Name"
	from employees e
	join dept_emp dep
	on e.emp_no = dep.emp_no
	join departments d
	on dep.dept_no = d.dept_no

---Data Analysis #5
select first_name as "First Name", last_name as "Last Name", sex as "Sex"
	from employees
	where first_name = 'Hercules' and last_name Like 'B%'

---Data Analysis #6
select dept_name as "Department Name", dep.emp_no as "Employee Number", last_name as "Last Name", first_name as "First Name"
	from departments d
	join dept_emp dep
	on d.dept_no = dep.dept_no
	join employees e
	on dep.emp_no = e.emp_no
	where dept_name = 'Sales'
	
---Data Analysis #7
select dep.emp_no as "Employee Number", last_name as "Last Name", first_name as "First Name", dept_name as "Department Name"
	from departments d
	join dept_emp dep
	on d.dept_no = dep.dept_no
	join employees e
	on dep.emp_no = e.emp_no
	where dept_name = 'Sales' or dept_name = 'Development'
	
---Data Analysis #8
select last_name as "Last Name", count(last_name) as "Frequency Count"
	from employees
	group by last_name
	order by "Frequency Count" desc
