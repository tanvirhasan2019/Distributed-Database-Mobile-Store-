SET SERVEROUTPUT ON;
SET VERIFY OFF;


ACCEPT A1 char PROMPT "-----------------------------------------"
ACCEPT A22 char PROMPT "--------ENTER EMPLOYEE INFORMATION--------"
ACCEPT A33 char PROMPT "-----------------------------------------"
	
ACCEPT A number PROMPT "ENTER EMPLOYEE ID :"
ACCEPT B char PROMPT "ENTER NAME NAME :"
ACCEPT C char PROMPT "ENTER EMPLOYEE PHONENUMBER :"
ACCEPT D number PROMPT "ENTER EMPLOYEE SALARY :"



DECLARE

	isTrue number ;
	
	--eid, name, site, phonenumber, salary
	
	employee_eid employee.eid%TYPE;
	employee_name employee.name%TYPE;
	employee_site employee.site%TYPE;
	employee_phonenumber employee.phonenumber%TYPE;
    employee_salary employee.salary%TYPE;
	
	
BEGIN

   
	employee_eid :=&A;
		
	employee_name :='&B';
	
	employee_site := 1;
	
	employee_phonenumber := '&C';
	
	employee_salary := &D;
	
	isTrue := Insertion_Package.isExisteid(employee_eid);
    IF isTrue = 0 THEN
		 Insertion_Package.procedure_insert_employee(employee_eid, employee_name, employee_site, employee_phonenumber, employee_salary);
    ELSIF isTrue = 1 THEN
		 DBMS_OUTPUT.PUT_LINE('------EMPLOYEE ALREADY EXIST--------');
    END IF;
	     
	
END;
/

commit;


