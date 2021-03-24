SET SERVEROUTPUT ON;
SET VERIFY OFF;


CREATE OR REPLACE PACKAGE ServerExtendedPackage AS

	
	
	PROCEDURE ShowAllEmployee(id IN NUMBER);
	
	
	
	
END ServerExtendedPackage;
/

CREATE OR REPLACE PACKAGE BODY ServerExtendedPackage AS


	
	PROCEDURE ShowAllEmployee(id IN NUMBER)
    IS

     total_row number := 0;
	 
	-- temp1 number := 0;
	 --temp2 number := 0;
	 --total_taka number :=0;
	 site1_emp number := 0;
	 site2_emp number := 0;
	 
	 
    BEGIN
	
	
			IF id = 1 THEN
				 DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
				 DBMS_OUTPUT.PUT_LINE('----------ALL EMPLOYEES IN BANGLADESH---------------');
				 DBMS_OUTPUT.PUT_LINE('EMPLOYEE ID--NAME---SITE----PHONENUMBER----SALARY');
				 FOR R IN ( (SELECT * FROM employee) union (select * from employee@site2) ) LOOP
				 
				     IF R.site = 1 THEN
					     site1_emp := site1_emp + 1;
					 ELSIF R.site = 2 THEN
					     site2_emp := site2_emp + 1;
					 END IF;
					 
				 total_row := total_row + 1; 
				 DBMS_OUTPUT.PUT_LINE(R.eid || '       ' || R.name ||  '       ' || R.site || '    ' || R.phonenumber ||  '      ' || R.salary);
			
				 END LOOP;
				 
				
				 
				 IF total_row = 0 THEN
					 DBMS_OUTPUT.PUT_LINE('NO RECORDS FOUND');
				 ELSE
					   DBMS_OUTPUT.PUT_LINE('TOTAL EMPLOYEE AT SITE1:' || ' ' || site1_emp);
					   DBMS_OUTPUT.PUT_LINE('TOTAL EMPLOYEE AT SITE2:' || ' ' || site2_emp);
					   DBMS_OUTPUT.PUT_LINE('TOTAL ROWS' || ' ' ||  total_row);
				 END IF;
				 
			END IF;
			
			
			
			EXCEPTION
		
				WHEN NO_DATA_FOUND THEN
					DBMS_OUTPUT.PUT_LINE('Data not found');
				WHEN OTHERS THEN
					DBMS_OUTPUT.PUT_LINE('Other errors');
			
			
			
		
    END ShowAllEmployee;
	
	

	
	
END ServerExtendedPackage;
/



commit;
