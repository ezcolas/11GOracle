-- Commenting Code
SET SERVEROUTPUT ON

/** Declare 
  v_annual_sal NUMBER(9,2);

BEGIN
  /*Compute the annual salary on the 
  monthly salary input from the user */
/*  v_annual_sal := monthly_sal * 12;
  
  --The following line displays the annual salary
  DBMS_OUTPUT.put_line(v_annual_sal);
END;
/
*/

SET SERVEROUTPUT ON
-- Using Sequence in PL/SQL Expression
DECLARE
  v_new_id NUMBER;
BEGIN
  v_new_id := my_seq.NEXTVAL;
  
  DBMS_OUTPUT.put_line(v_new_id);
END;

-- Nested Blocs Example
DECLARE
  v_outer_variable VARCHAR2(20):='GLOBAL VARIABLE';
BEGIN
  DECLARE
    v_inner_variable VARCHAR2(20):='LOCAL VARIABLE';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('v_inner_variable');
    DBMS_OUTPUT.PUT_LINE('v_outer_variable');
  END;
END;
/

-- Variable Scope and Visibility
DECLARE 
  v_father_name VARCHAR2(20):='Patrick';
  v_date_of_birth DATE:='20-Apr-1972';
BEGIN
  DECLARE
    v_child_name VARCHAR2(20):='Mike';
    v_date_of_birth DATE:='12-Dec-2002';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Father''s Name: ' || v_father_name);
    DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || v_date_of_birth);
    DBMS_OUTPUT.PUT_LINE('Child''s Name: ' || v_child_name);
  END;
  DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || v_date_of_birth);
END;
/
 -- Using a Qualifier with Nested Blocks
 BEGIN<<outer>>
 DECLARE 
  v_father_name VARCHAR2(20):='Patrick';
  v_date_of_birth DATE:='20-Apr-1972';
BEGIN
  DECLARE
    v_child_name VARCHAR2(20):='Mike';
    v_date_of_birth DATE:='12-Dec-2002';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Father''s Name: ' || v_father_name);
    DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || v_date_of_birth);
    DBMS_OUTPUT.PUT_LINE('Child''s Name: ' || v_child_name);
  END;
  DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || v_date_of_birth);
END;