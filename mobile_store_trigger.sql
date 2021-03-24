SET SERVEROUTPUT ON;



--AFTER INSERT OPERATION
CREATE OR REPLACE TRIGGER product_insert_trigger 
AFTER INSERT 
ON product
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('PRODUCT TABLE INSERTION SUCCESSFUL');
	
	EXCEPTION
		
		WHEN DUP_VAL_ON_INDEX THEN
			DBMS_OUTPUT.PUT_LINE('DUPLICATE CANT BE INSERTED');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
			
END;
/

CREATE OR REPLACE TRIGGER employee_insert_trigger 
AFTER INSERT 
ON employee
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('EMPLOYEE TABLE INSERT SUCCESSFULLY');
	
	EXCEPTION
		
		WHEN DUP_VAL_ON_INDEX THEN
			DBMS_OUTPUT.PUT_LINE('DUPLICATE CANT BE INSERTED');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
			
END;
/

CREATE OR REPLACE TRIGGER activity_insert_trigger 
AFTER INSERT 
ON employee_activity
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('ACTIVITY TABLE INSERTION SUCCESSFUL');
	
	EXCEPTION
		
		WHEN DUP_VAL_ON_INDEX THEN
			DBMS_OUTPUT.PUT_LINE('DUPLICATE CANT BE INSERTED');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
			
END;
/


CREATE OR REPLACE TRIGGER sell_insert_trigger 
AFTER INSERT 
ON sell
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('PRODUCT SOLD SUCCESSFULLY');
	
	EXCEPTION
		
		WHEN DUP_VAL_ON_INDEX THEN
			DBMS_OUTPUT.PUT_LINE('DUPLICATE CANT BE INSERTED');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
			
END;
/




--CREATE OR REPLACE TRIGGER HELLO6 
--BEFORE UPDATE 
--OF TAKA
---ON MONEY
--FOR EACH ROW
--DECLARE
	--A money.id%TYPE;
	--B money.name%TYPE;
	--C money.taka%TYPE;
--BEGIN
--	A := :OLD.ID;
	--B := :OLD.NAME;
	---C := :OLD.TAKA;
---INSERT INTO MONEY1 VALUES(A, B, C);
--END;
--/



--CREATE OR REPLACE TRIGGER get_dept
--  BEFORE DELETE OR INSERT OR UPDATE ON employees
 -- FOR EACH ROW
--BEGIN
  --  DBMS_OUTPUT.PUT('Old Dept= ' || :OLD.dept|| ', ');
--  DBMS_OUTPUT.PUT('New Dept= ' || :NEW.dept );
--END;



--DELETE

CREATE OR REPLACE TRIGGER product_delete_trigger
AFTER DELETE ON product
FOR EACH ROW

DECLARE

    A product.pid%TYPE;
	B product.name%TYPE;
	C product.model%TYPE; 
	D product.price%TYPE;
	
	
	
BEGIN
    A := :OLD.pid;
	B := :OLD.name;
	C := :OLD.model;
	D := :OLD.price;
	
	
	
	
	DBMS_OUTPUT.PUT_LINE(A || '  ' || B || '  ' || C || '  '|| D || 'DELETED SUCCESSFULLY');
	
	EXCEPTION
		
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('Data not found');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
END;
/



CREATE OR REPLACE TRIGGER sell_delete_trigger
BEFORE DELETE ON sell
FOR EACH ROW
DECLARE

    A sell.sid%TYPE;
	B sell.pid%TYPE;
	C sell.eid%TYPE; 
	D sell.phonenumber%TYPE;
	E sell.selldate%TYPE;
	last_id number;
	
BEGIN
    A := :OLD.sid;
	B := :OLD.pid;
	C := :OLD.eid;
	D := :OLD.phonenumber;
	E := :OLD.selldate;
	
	--selldate TIMESTAMP default LOCALTIMESTAMP,
	--deletedate TIMESTAMP default LOCALTIMESTAMP,
	
	select count(*) INTO last_id  from delete_sell_history;
	--DBMS_OUTPUT.PUT_LINE('count' || last_id);
	last_id := last_id + 1;
	insert into delete_sell_history(did, sid, pid, eid, phonenumber, selldate)values(last_id, A, B, C, D, E);
	
	DBMS_OUTPUT.PUT_LINE(A || '  ' || B || '  ' || C || '  ' || D || 'DELETED SUCCESSFULLY');
	
	
	EXCEPTION
		
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('Data not found');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
		
		
END;
/

CREATE OR REPLACE TRIGGER employee_delete_trigger
AFTER DELETE ON employee
FOR EACH ROW
DECLARE

    A employee.eid%TYPE;
	B employee.name%TYPE;
	C employee.site%TYPE; 
	D employee.phonenumber%TYPE;
	E employee.salary%TYPE;
	
	
BEGIN
    A := :OLD.eid;
	B := :OLD.name;
	C := :OLD.site;
	D := :OLD.phonenumber;
	E := :OLD.salary;
	
	DBMS_OUTPUT.PUT_LINE(A || '  ' || B || '  ' || C || '  ' || D || E || 'DELETED SUCCESSFULLY');
	
	EXCEPTION
		
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('Data not found');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
			
			
	
END;
/

CREATE OR REPLACE TRIGGER activity_delete_trigger
AFTER DELETE ON employee_activity
FOR EACH ROW
DECLARE
    A employee_activity.aid%TYPE;
	B employee_activity.eid%TYPE;
	C employee_activity.present%TYPE; 
	
	
BEGIN
    A := :OLD.aid;
	B := :OLD.eid;
	C := :OLD.present;
	
	DBMS_OUTPUT.PUT_LINE(A || '  ' || B || '  ' || C || 'DELETED SUCCESSFULLY');
	
	EXCEPTION
		
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('Data not found');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
			
			
END;
/








--UPDATE

CREATE OR REPLACE TRIGGER product_update_trigger 
AFTER UPDATE 
ON product
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('UPDATE ON PRODUCT TABLE');
END;
/

CREATE OR REPLACE TRIGGER employee_update_trigger 
AFTER UPDATE 
ON employee
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('UPDATE ON EMPLOYEE TABLE');
END;
/


CREATE OR REPLACE TRIGGER activity_update_trigger 
AFTER UPDATE 
ON employee_activity
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('UPDATE ON ACTIVITY TABLE');
END;
/

CREATE OR REPLACE TRIGGER sell_update_trigger 
AFTER UPDATE 
ON sell
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('UPDATE ON SELL TABLE');
END;
/

commit;


