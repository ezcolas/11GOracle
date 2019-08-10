/*
  Write and execute a PL/SQL stored procedure Factorial(n), Which computes and outputs the factorial of the input parameter n. 
  If n is negative, then the procedure prints an error message.
*/

 -- anonymous block
SET SERVEROUTPUT ON

DECLARE
  n Integer :=-4;
  o Integer :=1;
BEGIN
  IF n < 0 THEN 
    DBMS_OUTPUT.PUT_LINE(n || ' is negative');
  ELSE
    WHILE n >1 LOOP
      o := o * n;
      n := n -1;
    END LOOP; 
    DBMS_OUTPUT.PUT_LINE(o);  
  END IF;
END;
/

-- Named Block
CREATE PROCEDURE facto (
  n_input INTEGER
)
IS
  n_output Integer := 1;
  n_temp Integer:=n_input;
BEGIN
  IF n_input < 0 THEN 
    DBMS_OUTPUT.PUT_LINE('Sorry ' || n_input || ' is negative');
  ELSE
    WHILE n_temp >1 LOOP
      n_output := n_output * n_temp;
      n_temp := n_temp -1;
    END LOOP; 
    DBMS_OUTPUT.PUT_LINE('Factorial of ' || n_input || ' is ' || n_output);  
  END IF;
END;
  
Begin
  facto(6);
END;

Exec facto(6);