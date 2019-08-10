Create table dept AS Select * from departments;


CREATE PROCEDURE add_dept 
IS
  v_dept_id dept.department_id%TYPE;
  v_dept_name dept.department_name%TYPE;
BEGIN
  v_dept_id :=280;
  v_dept_name := 'ST-Curriculum';
  INSERT INTO dept(department_id, department_name)
  VALUES(v_dept_id, v_dept_name);
  
  DBMS_OUTPUT.PUT_LINE(' Inserted ' || SQL%ROWCOUNT || ' row ');
END;
/

 -- Invoking a Procedure
 BEGIN
  add_dept;
END;

Select * from dept where department_id=280;


-- Create a Function
CREATE FUNCTION check_sal 
RETURN Boolean 
IS
  v_dept_id employees.department_id%TYPE;
  v_empno employees.employee_id%TYPE;
  v_sal employees.salary%TYPE;
  v_avg_sal employees.salary%TYPE;
BEGIN
  v_empno:=205;
  SELECT salary, department_id INTO v_sal, v_dept_id FROM employees
  WHERE employee_id = v_empno;
  
  SELECT avg(salary) INTO v_avg_sal FROM employees WHERE
  department_id =v_dept_id;
  
  IF v_sal > v_avg_sal THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
  
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN NULL;
END;

SET SERVEROUTPUT ON
-- Invoking a Function 
BEGIN
  IF(check_sal IS NULL) THEN
    DBMS_OUTPUT.PUT_LINE('The function returned NULL due to exception');
  ELSIF(check_sal) THEN
    DBMS_OUTPUT.PUT_LINE('Salary > average');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Salary < average');
  END IF;
END;
/

-- Passing a Parameter to the function
DROP FUNCTION check_sal;

CREATE FUNCTION check_sal(p_empno employees.employee_id%TYPE)
RETURN Boolean IS
  v_dept_id employees.department_id%TYPE;
  v_sal employees.salary%TYPE;
  v_avg_sal employees.salary%TYPE;
BEGIN
  SELECT salary, department_id INTO v_sal, v_dept_id FROM employees
    WHERE employee_id = p_empno;
  
  SELECT avg(salary) INTO v_avg_sal FROM employees
    WHERE department_id = v_dept_id;
  
  IF v_sal > v_avg_sal THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END;

 -- Invoking the Function with a Parameter
 BEGIN
  DBMS_OUTPUT.PUT_LINE('Checking for employee with id 205');
  IF(check_sal(205) IS NULL) THEN
     DBMS_OUTPUT.PUT_LINE('The function returned NULL due to exception');
  ELSIF(check_sal(205)) THEN
    DBMS_OUTPUT.PUT_LINE('Salary > average');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Salary < average');
  END IF;
END;
  