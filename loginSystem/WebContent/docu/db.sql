drop table user_registration;
create table user_registration(
userSeqId number(5),
name varchar2(20),
age number(3),
city varchar2(20),
state varchar2(20),
email varchar2(30) unique,
password varchar2(10) unique,
mobile varchar2(15)	unique
);

drop sequence user_registration_seq;
create sequence user_registration_seq
start with 1
increment by 1;


insert into user_registration(userSeqId,name,age,city,state,email,password,mobile)
values(user_registration_seq.nextval,'pranav',20,'raipur','chhatishgarh','pkj172017','123','9852238502');


drop table admin_registration;
create table admin_registration(
adminSeq number(5) primary key,
name varchar(25),
age number(3),
city varchar2(20),
state varchar(20),
email varchar2(30) unique,
password varchar2(10) unique,
mobile varchar2(15) unique
);

drop sequence admin_registration_seq;
create sequence admin_registration_seq
start with 200
increment by 1;
insert into admin_registration(admin_registration_seq,name,age,city,state,email,password,mobile)
values(admin_registration_seq.nextval,'pranav1',21,'raipur','chhatishgarh','pkj212017','543','9852545502');







