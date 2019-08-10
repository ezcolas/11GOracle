-- Simple IF Statement 
SET SERVEROUTPUT ON

DECLARE
  v_myage  number:=31;
BEGIN
  IF v_myage < 11
  THEN
    DBMS_OUTPUT.PUT_LINE(' I am a child ');
  END IF;
END;
/

-- IF THEN ELSE STATEMENT
DECLARE
  v_myage  number:=31;
BEGIN
  IF v_myage < 11
  THEN
    DBMS_OUTPUT.PUT_LINE(' I am a child ');
  ELSE
    DBMS_OUTPUT.PUT_LINE(' I am not a child ');  
  END IF;
END;
/

-- Case Expressions
SET VERIFY OFF
DECLARE 
  v_grade CHAR(1) := UPPER('&grade');
  v_appraisal VARCHAR2(20);
BEGIN
  v_appraisal := CASE v_grade
    WHEN 'A' THEN 'Excellent'
    WHEN 'B' THEN 'Very Good'
    WHEN 'C' THEN 'Good'
    ELSE 'No such grade'
  END;
  DBMS_OUTPUT.put_line('Grade: ' || v_grade || ' Appraisal ' || v_appraisal);
END;
/

-- Searched CASE Expressions
DECLARE
  v_grade CHAR(1) := UPPER('&grade');
  v_appraisal VARCHAR2(20);
BEGIN
  v_appraisal := CASE
                    WHEN v_grade = 'A' THEN 'Excellent'
                    WHEN v_grade IN ('B', 'C') THEN 'Good'
                    ELSE 'No such grade'
                END;
  DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade || ' Appraisal ' || v_appraisal);
END;
/

-- Case Statement 
DECLARE
  v_deptid NUMBER;
  v_deptname VARCHAR2(20);
  v_emps NUMBER;
  v_mngid NUMBER := 108;
BEGIN
  CASE v_mngid
    WHEN 108 THEN 
      SELECT department_id, department_name INTO v_deptid, v_deptname FROM departments WHERE manager_id=108;
      SELECT count(*) INTO v_emps FROM employees WHERE department_id = v_deptid;
  END CASE;
  DBMS_OUTPUT.put_line('You are working in the ' || v_deptname || ' department. There are '||v_emps ||' employees in this department');
END;
/

-- Basic Loop 
DECLARE
  v_countryid locations.country_id%TYPE := 'CA';
  v_loc_id locations.location_id%TYPE;
  v_counter NUMBER(2) :=1;
  v_new_city locations.city%TYPE :='Montreal';
BEGIN
  SELECT MAX(location_id) INTO v_loc_id FROM locations WHERE country_id = v_countryid;
  LOOP
    INSERT INTO locations(location_id, city, country_id)
    VALUES((v_loc_id + v_counter), v_new_city, v_countryid);
    v_counter := v_counter + 1;
    EXIT WHEN v_counter > 3;
  END LOOP;
END;
/

-- While LOOP - Example
DECLARE
  v_countryid locations.country_id%TYPE := 'CA';
  v_loc_id locations.location_id%TYPE; 
  v_new_city locations.city%TYPE :='Montreal';
  v_counter NUMBER :=1;
BEGIN
  SELECT MAX(location_id) INTO v_loc_id FROM locations WHERE country_id = v_countryid;
  WHILE v_counter <=3 LOOP
    INSERT INTO locations(location_id, city, country_id)
    VALUES((v_loc_id + v_counter), v_new_city, v_countryid);
    v_counter := v_counter + 1;
  END LOOP;
END;
/

-- For LOOPS : Example
DECLARE
  v_countryid locations.country_id%TYPE := 'CA';
  v_loc_id locations.location_id%TYPE; 
  v_new_city locations.city%TYPE :='Montreal';
  v_counter NUMBER :=1;
BEGIN
  SELECT MAX(location_id) INTO v_loc_id FROM locations WHERE country_id = v_countryid;
  FOR i IN 1.. 3 LOOP
    INSERT INTO locations(location_id, city, country_id)
    VALUES((v_loc_id + i), v_new_city, v_countryid);
  END LOOP;
END;
/


-- PL/SQL continue Statement :Example 1
DECLARE
  v_total SIMPLE_INTEGER := 0;
BEGIN
  FOR i IN 1..10 LOOP
    v_total := v_total + i;
    DBMS_OUTPUT.PUT_LINE('Total is: '|| v_total);
    CONTINUE WHEN i > 5;
    DBMS_OUTPUT.PUT_LINE('Total is: '|| v_total);
  END LOOP;
END;
/