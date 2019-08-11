/*
 Create a Table Employee with the fields:  social security no. 
 (primary key), name, position, no. of dependents, annual 
 salary.
*/

-- Created the table
CREATE TABLE employees(
  socialsecurityno VARCHAR2(11) CONSTRAINT emp_emp_id_pk PRIMARY KEY,
  name VARCHAR2(60),
  position VARCHAR2(45),
  no_dependents INTEGER,
  annualSalary INTEGER
)

-- Populate the new table created : Employees table 
INSERT INTO employees VALUES('123-34-7893','Jean Marie Pierre', 'Civil Ingeneer', 4, 85000);
INSERT INTO employees VALUES('123-34-7894','Sherley Mervil', 'Physician', 3, 100000);
INSERT INTO employees VALUES('123-34-7895','Jacques Peter', 'Data Scientist', 5, 120000);
INSERT INTO employees VALUES('123-34-7896','Jean Max Pierre', 'Software Engineer', 2, 110000);
INSERT INTO employees VALUES('123-34-7897','Romonson Joseph', 'Nurse', 1, 90000);
INSERT INTO employees VALUES('123-34-7898','Jean Phillipe Medard', 'Accounting', 6, 80000);
INSERT INTO employees VALUES('123-34-7899','Charles Nicolas', 'HR Manager', 3, 115000);
INSERT INTO employees VALUES('123-34-7900','Cetoute Bonte', 'Driver', 4, 50000);
INSERT INTO employees VALUES('123-34-7901','Dimitri Jean', 'Plumber', 2, 60000);
INSERT INTO employees VALUES('123-34-7902','Kai Jean', 'Denstist', 0, 95000);
commit;

-- Create the new table
CREATE TABLE tax( socialsecurityno VARCHAR2(11) CONSTRAINT tax_emp_id_pk PRIMARY KEY, incometax INTEGER); 

-- Created a PL/SQL Stored Procedure
CREATE PROCEDURE compute_tax 
IS   
  netSalary EMPLOYEES.ANNUALSALARY%TYPE;
  income  EMPLOYEES.ANNUALSALARY%TYPE;
  counter INT:=0;
BEGIN  
  FOR emp_record IN (SELECT socialsecurityno, annualSalary, no_dependents from EMPLOYEES)
  LOOP
   netSalary := emp_record.annualSalary -(7000 + emp_record.no_dependents * 950);
   
   IF (netSalary = 15000 AND counter = 0) THEN
      income := (netSalary * 10)/100;
      counter := 1;
   ELSIF (netSalary = 15000 AND counter != 1) THEN
       income := (netSalary * 15)/100;
   ELSE
       income := (netSalary * 30)/100;
   END IF;
   
   INSERT INTO tax VALUES(emp_record.socialsecurityno, income);    
   
  END LOOP;
END;

-- Execute the Store procedure
Exec compute_tax;

Select * from tax;


