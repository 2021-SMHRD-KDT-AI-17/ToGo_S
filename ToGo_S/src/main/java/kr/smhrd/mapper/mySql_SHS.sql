-- 판매자 멤버
create table s_member(
	id varchar(10),
	pw varchar(10) not null,
	name varchar(50) not null,
	primary key(id)
);

-- 판매자 정보 입력
INSERT INTO s_member VALUES ('123', '123', '간식');

--판매자 조회
select * from s_member;

-- 소비자 member
create table c_member(
	id varchar(50),
	pw varchar(50) not null,
	nick varchar(50) not null,
	phone varchar(50) not null,
	
	primary key(id)
)
-- 소비자 정보 입력
insert into c_member values('123','123','123','123');

-- 소비자 조회
select * from member;


drop table seller_member;

create table member(
   email varchar(100) not null,
   pw varchar(100) not null,
   tel varchar(100) not null,
   address varchar(100) not null,
   primary key(email)
);

CREATE TABLE stores
(
    `store_id`     VARCHAR(30)     NOT NULL    COMMENT '업체 아이디', 
    `store_pw`     VARCHAR(32)     NOT NULL    COMMENT '업체 비밀번호', 
    `store_name`   VARCHAR(50)     NOT NULL    COMMENT '업체명', 
    `store_bno`    VARCHAR(12)     NOT NULL    COMMENT '사업자번호', 
    `store_tel`    VARCHAR(20)     NOT NULL    COMMENT '업체 전화', 
    `joined_at`    DATETIME        NOT NULL    DEFAULT now() COMMENT '가입일자', 
    `service_idx`  INT UNSIGNED    NOT NULL    COMMENT '휴게소 식별자', 
    `store_leave`  CHAR(1)         NOT NULL    DEFAULT '0' COMMENT '폐업 유무', 
     PRIMARY KEY (store_id)
);

INSERT INTO stores (store_id, store_pw, store_name, store_bno, store_tel, joined_at, service_idx, store_leave) VALUES ('admin', '123', '휴게소', '409-00-00000', '010-4062-9993', NOW(), 1, '0');
select * from stores where store_id ='admin' and store_pw = '123' and store_leave=0;