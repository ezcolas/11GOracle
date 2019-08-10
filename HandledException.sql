SET SERVEROUTPUT ON

-- Handling the exception
DECLARE 
  v_lname VARCHAR2(15);
BEGIN
  SELECT last_name INTO v_lname FROM employees
  WHERE first_name = 'John';
  
  DBMS_OUTPUT.put_line('John''s last name is :' || v_lname);
  EXCEPTION
    WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE(' Your select statement retrieved multiple rows. Consider using a cursor.');
END;
/

-- Non Predefined Error Trapping
-- To trap Oracle Server error 01400 
DECLARE 
  e_insert_except EXCEPTION;
  PRAGMA EXCEPTION_INIT (e_insert_excep, -01400);
BEGIN
  INSERT INTO departements
    (department_id, department_name) VALUES(280, NULL);
EXCEPTION
  WHEN e_insert_excep THEN
    DBMS_OUTPUT.PUT_LINE('INSERT OPERATION FAILED');
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

-- Trapping USER-Defined Exceptions
DECLARE
  v_deptno NUMBER :=500;
  v_name VARCHAR2(20) :='Testing';
  e_invalid_department EXCEPTION;
BEGIN
  UPDATE departments
  SET department_name = v_name
  WHERE department_id = v_deptno;
  IF SQL%NOTFOUND THEN
    RAISE e_invalid_department;
  END IF;
  COMMIT;
EXCEPTION
  WHEN e_invalid_department THEN
    DBMS_OUTPUT.PUT_LINE('No such department id.');
END;