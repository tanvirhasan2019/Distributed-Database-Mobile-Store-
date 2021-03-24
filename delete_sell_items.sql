SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT A1 char PROMPT "-----------------------------------------"
ACCEPT A22 char PROMPT "---------------DELETE SOLD ITEMS-------------"
ACCEPT A33 char PROMPT "----------------------------------------"
	
ACCEPT A number PROMPT "ENTER SELL ID :"


DECLARE

     
	sell_id sell.sid%TYPE;
	isExist number := 0;
	
	
	
BEGIN

    
	sell_id :=&A;
	
	
	
	isExist := Sell_Package.isExistsid(sell_id);
	
	
	IF isExist = 1  THEN
 	     Sell_Package.procedure_sell_delete(sell_id);
    ELSIF isExist = 0 THEN
	     DBMS_OUTPUT.PUT_LINE('-----SELL ID NOT FOUND--------');
	END IF;
	
	
	
	


END;
/
commit;