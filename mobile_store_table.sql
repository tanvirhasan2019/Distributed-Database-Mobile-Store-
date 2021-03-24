clear screen;

drop table delete_sell_history;
drop table sell;
drop table employee_activity;
drop table employee;
drop table product;



create table product
(
	pid number,
	name varchar2(30),
	model varchar2(30),
	price number,
	primary key(pid)
);

insert into product (pid, name, model, price) values (1, 'SAMSUNG', 'M21', 23000); 
insert into product (pid, name, model, price) values (2, 'SAMSUNG', 'M30', 30000); 
insert into product (pid, name, model, price) values (3, 'SAMSUNG', 'M50', 40000); 
insert into product (pid, name, model, price) values (4, 'HUAWEI', 'NOVA 2I', 12000); 
insert into product (pid, name, model, price) values (5, 'HUAWEI', 'NOVA 3I', 28000); 
insert into product (pid, name, model, price) values (6, 'XIAOMI', 'NOTE 4', 17000); 
insert into product (pid, name, model, price) values (7, 'XIAOMI', 'NOTE 9', 38000); 
insert into product (pid, name, model, price) values (8, 'IPHONE', 'A2172', 100000); 
insert into product (pid, name, model, price) values (9, 'IPHONE', 'A2275', 100500); 
insert into product (pid, name, model, price) values (10, 'IPHONE', 'A2288', 107000); 



create table employee
(
	eid number,
	name varchar2(30),
	site number,
	phonenumber varchar2(11),
	salary number,
	primary key(eid)
);

insert into employee (eid, name, site, phonenumber, salary) values (1, 'TANVIR', 1, '01521407602', 20000); 
insert into employee (eid, name, site, phonenumber, salary) values (2, 'HASAN', 1, '01921407603', 18000); 
insert into employee (eid, name, site, phonenumber, salary) values (3, 'TAWKIR', 1, '01721407604', 25000); 
insert into employee (eid, name, site, phonenumber, salary) values (4, 'FAHIM', 1, '01821407605', 30000); 
insert into employee (eid, name, site, phonenumber, salary) values (5, 'POPIN', 1, '01321407606', 15000); 


create table employee_activity
(
	aid number,
	eid number,
	presentdate TIMESTAMP default LOCALTIMESTAMP,
	present int,
	FOREIGN KEY(eid) REFERENCES employee(eid),
	primary key(aid)
);

insert into employee_activity (aid, eid, present) values (1, 1, 1); 
insert into employee_activity (aid, eid, present) values (2, 2, 0); 
insert into employee_activity (aid, eid, present) values (3, 3, 1); 
insert into employee_activity (aid, eid, present) values (4, 4, 1); 
insert into employee_activity (aid, eid, present) values (5, 5, 1); 


create table sell
(
	sid number,
	pid number,
	eid number,
	selldate TIMESTAMP default LOCALTIMESTAMP,
	phonenumber varchar2(11),
	FOREIGN KEY(pid) REFERENCES product(pid),
	FOREIGN KEY(eid) REFERENCES employee(eid),
	primary key(sid)
);


insert into sell (sid, pid, eid, phonenumber) values (1, 1, 1, '017XXXXXXXX'); 
insert into sell (sid, pid, eid, phonenumber) values (2, 3, 2, '013XXXXXXXX'); 
insert into sell (sid, pid, eid, phonenumber) values (3, 5, 1, '019XXXXXXXX'); 
insert into sell (sid, pid, eid, phonenumber) values (4, 7, 2, '013XXXXXXXX'); 
insert into sell (sid, pid, eid, phonenumber) values (5, 8, 1, '016XXXXXXXX'); 



create table delete_sell_history
(
    did number,
    sid number,
	pid number,
	eid number,
	selldate TIMESTAMP default LOCALTIMESTAMP,
	deletedate TIMESTAMP default LOCALTIMESTAMP,
	phonenumber varchar2(11),
	FOREIGN KEY(pid) REFERENCES product(pid),
	FOREIGN KEY(eid) REFERENCES employee(eid),
	primary key(did)
);




commit;

