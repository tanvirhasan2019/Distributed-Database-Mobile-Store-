SET VERIFY OFF;
SET SERVEROUTPUT ON;

ACCEPT A1 char PROMPT "--------------------------------------------------"
ACCEPT A2 char PROMPT "-------------------DASHBOARD----------------------"
ACCEPT A3 char PROMPT "--------------------------------------------------"
ACCEPT A4 number PROMPT "1. SOLD ITEMS AT SITE 1"
ACCEPT A5 number PROMPT "2. SOLD ITEMS AT SITE 2"
ACCEPT A55 number PROMPT "3. SHOW ALL SOLD ITEMS"
ACCEPT A6 number PROMPT "4. TOP SELLER "
ACCEPT A7 number PROMPT "5. DELETE HISTORY (SELL TABLE)  "
ACCEPT A7 number PROMPT "6. SHOW ALL EMPLOYEES  "
ACCEPT A8 char PROMPT "--------------------------------------------------"
ACCEPT A9 char PROMPT "--------------------------------------------------"
ACCEPT A10 char PROMPT "--------------------------------------------------"
    
    

DECLARE

     choose number;
	 temp number := 0;

BEGIN
   
	
	choose :=&choose;
	IF choose = 1 THEN
	     ServerPackage.procedure_search_sellItems(1);
	ELSIF choose = 2 THEN
	      ServerPackage.procedure_search_sellItems(2);
    ELSIF choose = 3 THEN
	      ServerPackage.ShowAllSitesSell(1);
	ELSIF choose = 4 THEN
	      temp := ServerPackage.TopSeller(1);
    ELSIF choose = 5 THEN
	       ServerPackage.DeleteHistorySell(1);
    ELSIF choose = 6 THEN
	       ServerExtendedPackage.ShowAllEmployee(1);
	END IF;
	


    
END;
/

commit;
