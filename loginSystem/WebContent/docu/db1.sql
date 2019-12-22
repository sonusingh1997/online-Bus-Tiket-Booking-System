drop table bus_owner_registration;
create table bus_owner_registration(
ownerId number(4) primary key,
name varchar(25),
age number(3),
city varchar(20),
state varchar(20),
busno varchar2(15),
email varchar2(30) unique,
password varchar2(10) unique,
mobile varchar2(15)
);

drop sequence busOwnerRegistration_seq;
create sequence busOwnerRegistration_seq
start with 5000
increment by 1;

insert into bus_owner_registration(ownerId,name,age,city,state,busno,email,password,mobile)
values(busOwnerRegistration_seq.nextval,'pranav',23,'raipur','chhatishgarh','pkjkk','br07hq-6576','324','8767655567');



drop table bus_registration;
create table bus_registration(
busId number(3),
busNo varchar2(15) primary key,
busType varchar(20),
totalSeats number(2),
ownerName varchar(20),
source varchar(20)		not null,
destination varchar(20) not null,
depart_time varchar2(10),
arriv_time varchar2(10)
);

drop sequence busRegistration_seq;
create sequence busRegistration_seq
start with 100
increment by 1;

insert into bus_registration(busId,busNo,busType,totalSeats,ownerName,source,destination,depart_time,arriv_time)
values(busRegistration_seq.nextval,'br08-3447','ac',60,'pranav','11121314','11121314','4:00pm','6:00am');



drop table busSeatBooked;
create table busSeatBooked(
ticketId number(4) primary key,
userId varchar2(20),
busNo varchar2(10),
bookedseatno varchar2(120),
price number(5),
booking_date date
);

drop sequence busSeatBook_seq;
create sequence busSeatBook_seq
start with 1000
increment by 1;


drop table payment_details;
create table payment_details(
paymentId number(5) primary key,
cardNo varchar2(16),
cardHolder varchar2(20),
validDate date,
cvvNo number(3),
amt number(5),
paymentDate timestamp
);

drop sequence payment_seq;
create sequence payment_seq
start with 10001
increment by 1;


drop table seatstatus;
create table seatstatus(
Id number(5),
busNo varchar2(15),
seatNo varchar2(2) ,
seatcode varchar(20)
);
drop sequence seatstatus_seq;
create sequence seatstatus_seq
start with 50
increment by 1;

insert into seatstatus
values(seatstatus_seq.nextval,'br07-3446','1A','111000');

insert into seatstatus
values(seatstatus_seq.nextval,'br07-3446','1B','111000');

insert into seatstatus
values(seatstatus_seq.nextval,'br07-3446','1C','000111');

insert into seatstatus
values(seatstatus_seq.nextval,'br07-3446','1D','001100');

insert into seatstatus
values(seatstatus_seq.nextval,'br07-3446','1E','000000');

insert into seatstatus
values(seatstatus_seq.nextval,'br07-3446','1F','000000');

insert into seatstatus
values(seatstatus_seq.nextval,'br07-3446','2A','000000');

insert into seatstatus
values(seatstatus_seq.nextval,'br07-3446','2B','000000');

insert into seatstatus
values(seatstatus_seq.nextval,'br07-3446','2C','000000');

insert into seatstatus
values(seatstatus_seq.nextval,'br07-3446','2D','000000');

			for (int l=0;l<dbseatcode.length();l++){
				if(seatcode.charAt(l)=='1' || dbseatcode.charAt(l)=='1'){
					dbnewseatcode+=1;
				}
				else{
					dbnewseatcode+=0;
				}
			}
		System.out.println(seatcode);
		System.out.println(dbseatcode);
		System.out.println(dbnewseatcode);





			int i=0;
			while(rs.next()){
				i++;
				String bookedSeat=rs.getString("bookedseatno");
				
				seatStr += bookedSeat;
				
			}
