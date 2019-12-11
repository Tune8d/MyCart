drop table userList purge;

create table userList(
	userID varchar2(20) is null primary key,
	userPassword varchar2(20),
	userName varchar2(20),
	userGender varchar2(20),
	userEmail varchar2(20),
	userAdmin number(2),
	userJoinDate DATE
	--Primary key 를 못써먹는다 ㅡㅡ.... 도대체 왜 --> 삽입이 두번 된다..
)

select * from userList;

insert into userList
values('테스터1', '1111', '홍길동', '남', 'tester01@gmail.com')

update userList set userID='tester01' where userName='홍길동'

alter table userList
add(
	userAdmin number(2)
)

update userList set userAdmin='00' where userName='홍길동'

insert into userList
values('admin', '9999', '관리자', '여', 'admin@myCart.com', '09', null)

alter table userList
add(
	userJoinDate date
)

delete from userList where userID = 'test1'

ALTER TABLE userList DROP PRIMARY KEY DROP INDEX;

ALTER TABLE userList ADD CONSTRAINT user_ID PRIMARY KEY (userID)

drop table userMyTableBoard purge;

create table userMyTableBoard(
	boardID number(10),
	boardTitle varchar2(100),
	boardPrice number(30) not null,
	boardEa number(10),
	boardSeller varchar2(30),
	boardSellerLink varchar2(2000),
	boardDate DATE,
	boardAvailable number(1), --글 삭제 구분 
	boardUserID varchar2(20) -- references userList(userID); 이걸 session.param 으로 받아서 join 기준으로 삼으면 되겠다 --제약을 인라인으로 정의할 경우 foreign key 가 필요없다고 함
);

select * from userMyTableBoard;
