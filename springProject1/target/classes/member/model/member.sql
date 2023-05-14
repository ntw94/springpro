create table member(
	member_no int auto_increment,
	member_id varchar(50) not null,
	member_pwd varchar(50) not null,
	member_name varchar(50) not null,
	member_email varchar(200) not null,
	member_regiDate datetime default now(),
	
	primary key (member_no),
	unique(member_id)
)


select * from member;

drop table member;

insert into member (member_id,member_pwd,member_name,member_email)
	   values ('hong','1234','홍길동','hong@hong.com');
	   
	   
	   
	   