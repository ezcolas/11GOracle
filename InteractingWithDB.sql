-- Select Statement in PL/SQL
SET SERVEROUTPUT ON

DECLARE
  v_fname VARCHAR2(25);
BEGIN
  SELECT first_name INTO v_fname
  FROM employees WHERE employee_id = 200;
  
  DBMS_OUTPUT.put_line(' First Name is: ' || v_fname);
END;
/
-- Retrievening Data in PL/SQL
DECLARE
  v_emp_hiredate employees.hire_date%TYPE;
  v_emp_salary employees.salary%TYPE;
BEGIN
  SELECT hire_date, salary
  INTO v_emp_hiredate, v_emp_salary
  FROM employees
  WHERE employee_id = 100;
  
  DBMS_OUTPUT.put_line('Hire date is : ' || v_emp_hiredate);
  DBMS_OUTPUT.put_line('Salary is : ' || v_emp_salary);
END;
/

-- Return the sum of salaries for all the employees in the specified departement
DECLARE
  v_sum_sal NUMBER(10, 2);
  v_deptno NUMBER NOT NULL :=60;
BEGIN
  SELECT SUM(salary) -- group function
  INTO v_sum_sal FROM employees
  WHERE department_id = v_deptno;
  
  DBMS_OUTPUT.PUT_LINE('The sum of salary is ' || v_sum_sal);
END;
/

-- Inserting Data
-- Add a new employee information to the EMPLOYEES table
 BEGIN
  INSERT INTO employees
    (employee_id, first_name, last_name, email, hire_date, job_id, salary)
    VALUES(employees_seq.NEXTVAL, 'RUTH', 'CORES', 'RCORES', CURRENT_DATE, 'AD_ASST', 4000);
 END;
 /
 
 -- Updating Data 
 -- Increase the salary of all employees who are stock clerks
DECLARE
 sal_increase employees.salary%TYPE := 800;
BEGIN
  UPDATE employees
  SET salary = salary + salary + sal_increase
  WHERE job_id = 'ST_CLERK';
END;

-- Deleting Data 
-- Delete rows that belong to department 10 from the employees table
DECLARE
  deptno employees.department_id%TYPE :=10;
BEGIN
  DELETE FROM employees
  WHERE department_id = deptno;
END;
/

-- Merging Rows

-- Insert or update rows in the copy_emp table to match the employees table
BEGIN
  MERGE INTO copy_emp c
    USING employees e
    ON (e.employee_id = c.empno)
    WHEN MATCHED THEN
      UPDATE SET
        c.first_name = e.first_name,
        c.last_name = e.last_name,
        c.email = e.email,
        c.phone_number = e.phone_number,
        c.hire_date = e.hire_date, 
        c.job_id = e.job_id,
        c.salary = e.salary,
        c.commission_pct = e.commision_pct,
        c.manager_id = e.manager_id,
        c.department_id = e.department_id
    WHEN NOT MATCHED THEN 
      INSERT VALUES (e.employee_id, e.first_name, e.last_name,e.email,
      e.phone_number,e.hire_date, e.job_id,  e.salary, e.commision_pct, e.manager_id, e.department_id);
END;
/

 -- SQL CURSOR Attribute for implicite CURSORS
 /*Delete rows that have the specified employee ID from the employees table.
   Print the number of rows deleted
 */
DECLARE
  v_rows_deleted VARCHAR2(30);
  v_empno employees.employee_id%TYPE :=176;
BEGIN
  DELETE FROM employees
  WHERE employee_id = v_empno;
  
  v_rows_deleted := (SQL%ROWCOUNT || 'row deleted');
  DBMS_OUTPUT.PUT_LINE(v_rows_deleted);
END;