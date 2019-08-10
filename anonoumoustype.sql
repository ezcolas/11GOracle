-- Examine an Anonymouse Block
SET SERVEROUTPUT ON

Declare
  v_fname VARCHAR(20);
BEGIN
  SELECT FIRST_NAME INTO v_fname FROM EMPLOYEES
  WHERE EMPLOYEE_ID=100;
  
  DBMS_OUTPUT.PUT_LINE(' The First Name of the EMployee is ' || v_fname );
END;
/

Declare
  v_myName VARCHAR2(20);
BEGIN
  DBMS_OUTPUT.PUT_LINE('My name is :' || v_myName);
  v_myName := 'Colas';
  DBMS_OUTPUT.PUT_LINE('My name is :' || v_myName);
END;
/


Declare
  v_myName1 VARCHAR2(20) := 'Jhon';
BEGIN
  DBMS_OUTPUT.PUT_LINE('My name is :' || v_myName1);
  v_myName1 := 'Colas';
  DBMS_OUTPUT.PUT_LINE('My name is :' || v_myName1);
END;
/

-- Delimiters in String Literals
Declare
  v_event VARCHAR2(15);
BEGIN
  v_event := q'!Father's day!';
  DBMS_OUTPUT.PUT_LINE('3rd Sunday in June is : ' || v_event);
  v_event := q'[Mother's day]';
  DBMS_OUTPUT.PUT_LINE('2nd Sunday in May is : ' || v_event);
END;
/


-- Example of Bind Variable
VARIABLE b_result NUMBER;
BEGIN
  SELECT (SALARY * 12) + NVL(COMMISSION_PCT, 0) INTO :b_result
  FROM employees WHERE EMPLOYEE_ID=144;
END;
/

PRINT b_result

-- REFERENCING BING Variables
VARIABLE b_emp_salary NUMBER
BEGIN
  SELECT salary INTO :b_emp_salary
  FROM EMPLOYEES where EMPLOYEE_ID = 178;
END;
/

PRINT b_emp_salary
SELECT first_name, last_name from EMPLOYEES where salary =:b_emp_salary;


-- REFERENCING BING Variables
VARIABLE b_emp_salary NUMBER
SET AUTOPRINT ON
DECLARE
  v_empno NUMBER(6):=&empno;
BEGIN
  SELECT salary INTO :b_emp_salary
  FROM EMPLOYEES where EMPLOYEE_ID = v_empno;
END;
/

