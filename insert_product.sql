SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT A1 char PROMPT "-----------------------------------------"
ACCEPT A22 char PROMPT "--------ENTER PRODUCT INFORMATION--------"
ACCEPT A33 char PROMPT "-----------------------------------------"
	
ACCEPT A number PROMPT "ENTER PRODUCT ID :"
ACCEPT B char PROMPT "ENTER PRODUCT NAME :"
ACCEPT C char PROMPT "ENTER PRODUCT MODEL :"
ACCEPT D number PROMPT "ENTER PRODUCT PRICE :"





DECLARE



	isTrue number ;
	
	product_id product.pid%TYPE;
	product_name product.name%TYPE;
	product_model product.model%TYPE;
	product_price product.price%TYPE;

 
	
BEGIN

   
	product_id :=&A;
		
	product_name :='&B';
	
	product_model :='&C';
	
	product_price :=&D;
	
		 
    isTrue := insertion_package.isExistpid(product_id);
    IF isTrue = 0 THEN
		insertion_package.procedure_insert_product(product_id, product_name, product_model, product_price);
    ELSIF isTrue = 1 THEN
		 DBMS_OUTPUT.PUT_LINE('------PRODUCT ALREADY EXIST--------');
    END IF;
	
	

	
END;
/


commit;
