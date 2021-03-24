SET SERVEROUTPUT ON;
SET VERIFY OFF;


CREATE OR REPLACE PACKAGE ServerPackage AS

	
	PROCEDURE procedure_search_sellItems(siteid IN number);
	
	PROCEDURE ShowAllSitesSell(id IN NUMBER);
	PROCEDURE DeleteHistorySell(id IN NUMBER);
	
	FUNCTION TopSeller(id IN number)
	RETURN NUMBER;
	
	
	
	
END ServerPackage;
/

CREATE OR REPLACE PACKAGE BODY ServerPackage AS


	
	PROCEDURE ShowAllSitesSell(id IN NUMBER)
    IS

     total_row number := 0;
	 
	 temp1 number := 0;
	 temp2 number := 0;
	 total_taka number :=0;
	 
	 
    BEGIN
	
			IF id = 1 THEN
				 DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
				 DBMS_OUTPUT.PUT_LINE('-----------------------ALL SITES  ---------------');
				 DBMS_OUTPUT.PUT_LINE('SELL ID----PRODUCT ID----EMPLOYEE ID----SELL DATE----BUYER PHONENUMBER');
				 FOR R IN ( (SELECT * FROM sell) union (select * from sell@site2) ) LOOP
				 total_row := total_row + 1; 
				 DBMS_OUTPUT.PUT_LINE(R.sid || '       ' || R.pid ||  '       ' || R.eid || '    ' || R.selldate ||  '      ' || R.phonenumber);
			
				 END LOOP;
				 
				 select sum(price) INTO temp1 from product where pid in(select pid from sell);
				 select sum(price) INTO temp2 from product where pid in(select pid from sell@site2);
				 
				 total_taka := temp1 + temp2 ;
				 
				 IF total_row = 0 THEN
					 DBMS_OUTPUT.PUT_LINE('NO RECORDS FOUND');
				 ELSE
					   DBMS_OUTPUT.PUT_LINE('TOTAL TAKA' || ' ' || total_taka);
					   DBMS_OUTPUT.PUT_LINE('TOTAL ROWS' || ' ' ||  total_row);
				 END IF;
				 
			END IF;
			
			
			EXCEPTION
		
				WHEN NO_DATA_FOUND THEN
					DBMS_OUTPUT.PUT_LINE('Data not found');
				WHEN OTHERS THEN
					DBMS_OUTPUT.PUT_LINE('Other errors');
			
		
    END ShowAllSitesSell;
	
	
	
	
	
	
	PROCEDURE procedure_search_sellItems(siteid IN number)
    IS
	
	total_row number := 0;
	
	total_taka number :=0;

    BEGIN
	
	    
		
			IF siteid = 1 THEN
				 DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
				 DBMS_OUTPUT.PUT_LINE('-----------------------SITE 01 ---------------');
				 DBMS_OUTPUT.PUT_LINE('SELL ID----PRODUCT ID----EMPLOYEE ID----SELL DATE----BUYER PHONENUMBER');
				 FOR R IN (SELECT * FROM sell) LOOP
				 total_row := total_row + 1; 
				 DBMS_OUTPUT.PUT_LINE(R.sid || '       ' || R.pid ||  '       ' || R.eid || '    ' || R.selldate ||  '      ' || R.phonenumber);
			
				 END LOOP;
				 
				 select sum(price) INTO total_taka from product where pid in(select pid from sell);
				 
				 
			ELSIF siteid = 2 THEN
				 DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
				 DBMS_OUTPUT.PUT_LINE('-----------------------SITE 02 ---------------');
				 DBMS_OUTPUT.PUT_LINE('SELL ID----PRODUCT ID----EMPLOYEE ID----SELL DATE----BUYER PHONENUMBER');
				 FOR R IN (SELECT * FROM sell@site2) LOOP
				 total_row := total_row + 1; 
				 DBMS_OUTPUT.PUT_LINE(R.sid || '       ' || R.pid ||  '       ' || R.eid || '    ' || R.selldate ||  '      ' || R.phonenumber);
			
				 END LOOP;
				 
				
				 select sum(price) INTO total_taka from product where pid in(select pid from sell@site2);
				 
			END IF;
			
		   
			IF total_row = 0 THEN
				 DBMS_OUTPUT.PUT_LINE('NO RECORDS FOUND');
			ELSE
				 DBMS_OUTPUT.PUT_LINE('TOTAl TAKA' || ' ' || total_taka);
				 DBMS_OUTPUT.PUT_LINE('TOTAL ROWS' || ' ' ||  total_row);
			END IF;
			
			EXCEPTION
		
				WHEN NO_DATA_FOUND THEN
					DBMS_OUTPUT.PUT_LINE('Data not found');
				WHEN OTHERS THEN
					DBMS_OUTPUT.PUT_LINE('Other errors');
			
			
    END procedure_search_sellItems;
	
	
	
	
	FUNCTION TopSeller(id IN number)
    RETURN number
    IS

    
    site1_sell number := 0;
	site2_sell number := 0;
	
    BEGIN
	
    
		   select sum(price) INTO site2_sell from product where pid in(select pid from sell@site2);
		   select sum(price) INTO site1_sell from product where pid in(select pid from sell);
		   
		   IF site2_sell > site1_sell THEN
				 DBMS_OUTPUT.PUT_LINE('SITE 2 TOP IS SELLER');  
				 DBMS_OUTPUT.PUT_LINE('TOTAL SELL' || ' ' || site2_sell);  
			ELSIF site2_sell = site1_sell THEN
				  DBMS_OUTPUT.PUT_LINE('SITE 1 AND SITE 2 SOLD SAME AMOUNT'); 
				 
			ELSE
				  DBMS_OUTPUT.PUT_LINE('SITE 1 TOP IS SELLER ');  
				  DBMS_OUTPUT.PUT_LINE('TOTAL SELL' || ' ' || site1_sell);
			END IF;
		  
			
		
		   RETURN 1;
		   
		   EXCEPTION
		
				WHEN NO_DATA_FOUND THEN
					DBMS_OUTPUT.PUT_LINE('Data not found');
				WHEN OTHERS THEN
					DBMS_OUTPUT.PUT_LINE('Other errors');
	   
	   
	
    END TopSeller;
	
	
	
	
	PROCEDURE DeleteHistorySell(id IN NUMBER)
    IS

     total_row number := 0;
	 
	
	
    BEGIN
	
	    IF id = 1 THEN
		     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------');
			 DBMS_OUTPUT.PUT_LINE('-----------ALL SITES DELETE HISTORY ------------');
		     DBMS_OUTPUT.PUT_LINE('DID----SID----PID----EID----SELL DATE------DELETE DATE----PHONENUMBER');
		     FOR R IN ( (SELECT * FROM delete_sell_history) union (select * from delete_sell_history@site2) ) LOOP
		     total_row := total_row + 1; 
		     DBMS_OUTPUT.PUT_LINE(R.did || ' ' || R.sid ||  ' ' || R.pid || ' ' || R.eid ||  ' ' || R.selldate || '   ' || R.deletedate || '   ' || R.phonenumber);
		
	         END LOOP;
			 
			
			
			 IF total_row = 0 THEN
			 
		         DBMS_OUTPUT.PUT_LINE('NO RECORDS FOUND');
		   
		     END IF;
			 
	    END IF;
		
		EXCEPTION
		
				WHEN NO_DATA_FOUND THEN
					DBMS_OUTPUT.PUT_LINE('Data not found');
				WHEN OTHERS THEN
					DBMS_OUTPUT.PUT_LINE('Other errors');
		
		
    END DeleteHistorySell;
	
	

	
	
END ServerPackage;
/



commit;
