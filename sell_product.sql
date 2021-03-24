SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT A1 char PROMPT "-----------------------------------------"
ACCEPT A22 char PROMPT "---------------SELL PRODUCT-------------"
ACCEPT A33 char PROMPT "----------------------------------------"
	
ACCEPT A number PROMPT "ENTER PRODUCT ID :"
ACCEPT B number PROMPT "ENTER CUSTOMER PHONENUMBER :"



DECLARE

     
	product_id sell.pid%TYPE;
	employee_id sell.eid%TYPE;
	sell_phonenumber sell.phonenumber%TYPE;
	
	pidExist number := 0;
	eidExist number := 0;
	
	
	
	
BEGIN

    
	product_id :=&A;
	
	--LET ASSUEM EMPLOYEE ID 1 IS LOGGED IN
	employee_id := 1;
	
	
	sell_phonenumber :=&B;
	
	pidExist := Insertion_Package.isExistpid(product_id);
	
	IF pidExist = 1  THEN
	     eidExist := Insertion_Package.isExisteid(employee_id);
		 IF eidExist = 1 THEN
		     Sell_Package.procedure_sell_product(product_id, employee_id, sell_phonenumber);
	     ELSIF eidExist = 0 THEN
		     DBMS_OUTPUT.PUT_LINE('-----INVALID EMPLOYEE--------');
		 END IF;
	ELSIF pidExist = 0 THEN
		     DBMS_OUTPUT.PUT_LINE('-----PRODUCT NOT FOUND--------'); 
	END IF;
	
	
	
	


END;
/
commit;