create table shop_member (
	mem_id varchar(30) not null primary key,
	mem_passwd varchar(30),
	mem_email varchar(50),
	mem_phone varchar(50),
	mem_postcode varchar(30),
	mem_jibunAddress varchar(50),
	mem_roadAddress varchar(50),
	mem_birth varchar(50),
	mem_chk_admin varchar(40)
)engine = innodb default charset=utf8

drop table shop_member;

select * from shop_member;