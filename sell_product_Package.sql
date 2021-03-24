SET SERVEROUTPUT ON;
SET VERIFY OFF;


CREATE OR REPLACE PACKAGE Sell_Package AS

	
	FUNCTION isExistsid(id IN number)
	RETURN NUMBER;
	
	PROCEDURE procedure_sell_product(product_id IN sell.pid%TYPE, employee_id IN sell.eid%TYPE , sell_phonenumber IN sell.phonenumber%TYPE);
	
    PROCEDURE procedure_sell_delete(id IN sell.sid%TYPE);

	
END Sell_Package;
/

CREATE OR REPLACE PACKAGE BODY Sell_Package AS



	
	
	PROCEDURE procedure_sell_product(product_id IN sell.pid%TYPE, employee_id IN sell.eid%TYPE , sell_phonenumber IN sell.phonenumber%TYPE)
    IS

     last_id number;
    BEGIN
	     select count(*) INTO last_id  from sell;
		 
		 last_id := last_id + 1 ;

		 -- FOR SITE 1 SID (1 TO 10000)
		 -- FOR SITE 2 SID (10000 TO 20000)
		 
		 
	     insert into sell(sid, pid, eid, phonenumber)values(last_id, product_id, employee_id, sell_phonenumber);
         
		
		EXCEPTION
		
			WHEN DUP_VAL_ON_INDEX THEN
				DBMS_OUTPUT.PUT_LINE('DUPLICATE CANT BE INSERTED');
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE('Other errors');
			
	
    END procedure_sell_product;
	
	
	
	
	
	PROCEDURE procedure_sell_delete(id IN sell.sid%TYPE)
    IS

     
    BEGIN
	    DELETE FROM sell where sid=id;
    
		EXCEPTION
		
			WHEN NO_DATA_FOUND THEN
				DBMS_OUTPUT.PUT_LINE('Data not found');
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE('Other errors');
	
    END procedure_sell_delete;
	
	
	
	
	FUNCTION isExistsid(id IN number)
    RETURN number
    IS

    isFound number := 0;

    BEGIN
    
	   FOR t IN (SELECT sid FROM sell) LOOP
            IF t.sid = id THEN
		         isFound :=1;
		    
            END IF;
        END LOOP;
	
        RETURN isFound;
		
		
	EXCEPTION
		
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('Data not found');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	
    END isExistsid;
	
	
	

	
END Sell_Package;
/



commit;
