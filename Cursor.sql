-- Declaring cursor
SET SERVEROUTPUT ON

Declare
  CURSOR c_emp_cursor IS
  SELECT employee_id, last_name FROM employees
  WHERE department_id =30;
  v_empno employees.employee_id%TYPE;
  v_lname employees.last_name%TYPE;
BEGIN
  OPEN c_emp_cursor;
  FETCH c_emp_cursor INTO v_empno, v_lname;
  DBMS_OUTPUT.PUT_LINE(v_empno || ' ' || v_lname);
END;



DECLARE
   -- Declaring cursor
  CURSOR c_emp_cursor IS
  SELECT employee_id, last_name FROM employees
  WHERE department_id =30;
  v_empno employees.employee_id%TYPE;
  v_lname employees.last_name%TYPE;
BEGIN
  -- Opening the cursor
  OPEN c_emp_cursor;
  LOOP
    -- Fetching Data From the Cursor
    FETCH c_emp_cursor INTO v_empno, v_lname;
    EXIT WHEN c_emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_empno ||'  ' || v_lname);
  END LOOP;
  -- CLosing the Cursor
  CLOSE c_emp_cursor;
END;
/

-- Cursor and Records, 
/* Process the rows of the active set by fetching values into a PL/SQL record
*/
DECLARE
  CURSOR c_emp_cursor IS
  SELECT employee_id, last_name FROM employees
  WHERE department_id = 30;
  
  v_emp_record c_emp_cursor%ROWTYPE;
BEGIN
  OPEN c_emp_cursor;
  LOOP
    FETCH c_emp_cursor INTO v_emp_record;
    EXIT WHEN c_emp_cursor%NOTFOUND;
 
    DBMS_OUTPUT.PUT_LINE (v_emp_record.employee_id || '  ' || v_emp_record.last_name);
   END LOOP;
   CLOSE c_emp_cursor;
END;

-- Cursor FOR LOOPS
DECLARE
  CURSOR c_emp_cursor IS
    SELECT employee_id, last_name FROM employees
    WHERE department_id = 30;
BEGIN
  FOR emp_record IN c_emp_cursor
    LOOP
      DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || '  ' || emp_record.last_name);
    END LOOP;
END;

-- CURSOR FOR LOOPS Using Subqueries
BEGIN
  FOR emp_record IN (SELECT employee_id, last_name 
    FROM employees WHERE department_id =30)
  LOOP
    DBMS_OUTPUT.PUT_LINE( emp_record.employee_id || ' ' || emp_record.last_name);
  END LOOP;
END;