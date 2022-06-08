

create table mvc_board(
Write_no number(10) primary key,
Title varchar2(100),
Content varchar2(300),
Savedate date default sysdate,
Hit number(10) default 0,
Image_file_name varchar2(100),
Id varchar2(20) not null,
constraint fk_test foreign key(id) references membership(id) on delete cascade
);

desc mvc_board;

create sequence mvc_board_seq nocache nocycle;