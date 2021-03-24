SET SERVEROUTPUT ON;
SET VERIFY OFF;


CREATE OR REPLACE PACKAGE Insertion_Package AS

	FUNCTION isExistpid(id IN number)
	RETURN NUMBER;
	
	PROCEDURE procedure_insert_product(id IN product.pid%TYPE, name IN product.name%TYPE , model IN product.model%TYPE , price IN product.price%TYPE);
	
	FUNCTION isExisteid(id IN number)
    RETURN number;
	
	
	PROCEDURE procedure_insert_employee(id IN employee.eid%TYPE, name IN employee.name%TYPE , site IN employee.site%TYPE , phone IN employee.phonenumber%TYPE, salary IN employee.salary%TYPE);
	
	
END Insertion_Package;
/

CREATE OR REPLACE PACKAGE BODY Insertion_Package AS



	FUNCTION isExistpid(id IN number)
    RETURN number
    IS

    isFound number := 0;

    BEGIN
    
	   FOR t IN (SELECT pid FROM product) LOOP
            IF t.pid = id THEN
		         isFound :=1;
		    
            END IF;
        END LOOP;
	
        RETURN isFound;
		
		
		EXCEPTION
		
			WHEN NO_DATA_FOUND THEN
				DBMS_OUTPUT.PUT_LINE('Data not found');
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE('Other errors');
			
		
		
		
   
	
    END isExistpid;
	
	
	
	
	PROCEDURE procedure_insert_product(id IN product.pid%TYPE, name IN product.name%TYPE , model IN product.model%TYPE , price IN product.price%TYPE)
    IS

    BEGIN
	     insert into product(pid, name, model, price)values(id, name, model, price);
	
    END procedure_insert_product;
	
	
	 FUNCTION isExisteid(id IN number)
     RETURN number
     IS

    isFound number := 0;

    BEGIN
    
	   FOR t IN (SELECT eid FROM employee) LOOP
            IF t.eid = id THEN
		         isFound :=1;
		     
            END IF;
        END LOOP;
	
         RETURN isFound;
		 
		
		EXCEPTION
		
			WHEN NO_DATA_FOUND THEN
				DBMS_OUTPUT.PUT_LINE('Data not found');
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE('Other errors');
	
    END isExisteid;
     

    PROCEDURE procedure_insert_employee(id IN employee.eid%TYPE, name IN employee.name%TYPE , site IN employee.site%TYPE , phone IN employee.phonenumber%TYPE, salary IN employee.salary%TYPE)
     IS

    BEGIN
	     insert into employee(eid, name, site, phonenumber, salary)values(id, name, site, phone, salary);
		 
	EXCEPTION
		
		WHEN DUP_VAL_ON_INDEX THEN
			DBMS_OUTPUT.PUT_LINE('DUPLICATE CANT BE INSERTED');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	
    END procedure_insert_employee;
     

	
	
	
	

	
END Insertion_Package;
/



commit;
