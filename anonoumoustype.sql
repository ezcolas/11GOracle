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

