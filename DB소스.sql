-- 장바구니
DROP TABLE cart;
CREATE TABLE cart (
    cart_id NUMBER PRIMARY KEY, 
    product_name VARCHAR2(100) NOT NULL,
    product_price NUMBER(6) NOT NULL,
    name VARCHAR2(20),
CONSTRAINT fk_cart_member FOREIGN KEY (name) REFERENCES membertest(id)
);

CREATE SEQUENCE cart_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE OR REPLACE TRIGGER cart_id_trigger
BEFORE INSERT ON cart
FOR EACH ROW
WHEN (new.cart_id IS NULL)
BEGIN
    SELECT cart_id_seq.NEXTVAL INTO :new.cart_id FROM dual;
END;
/

commit;


-- 회원정보
CREATE TABLE membertest (
    id VARCHAR2(20) PRIMARY KEY,              -- id를 PRIMARY KEY로 설정
    name VARCHAR2(20) NOT NULL,    
      role VARCHAR2(20) DEFAULT 'USER' NOT NULL,-- name은 필수
    email VARCHAR2(100) UNIQUE NOT NULL,      -- email9은 고유값
    password VARCHAR2(1000) NOT NULL,         -- password는 필수
    tel VARCHAR2(50),                         -- 전화번호 (필수는 아님)
    birth DATE                       -- 생년월일 (필수는 아님)
   -- role은 기본값 'USER'
);

commit;
select * from membertest;

-- 결제
CREATE TABLE payment_info (
    product_name VARCHAR2(100) NOT NULL,
    product_price NUMBER(6) NOT NULL,
    merchant_uid VARCHAR2(50) NOT NULL,  -- 결제 고유 ID
    purchase_date DATE NOT NULL,
    buyer_name VARCHAR(30) NOT NULL,
    buyer_tel VARCHAR(20) NOT NULL,
CONSTRAINT fk_buyer_name FOREIGN KEY (buyer_name) REFERENCES membertest(id)
);

COMMIT;

-- 관광지 테이블
drop table attraction;

create table attraction (
place varchar2(200),
sigungu varchar2(20),
address varchar2(200),
overview CLOB,
longtitude float(20),
altitude float(20)
);

commit;

select * from attraction;

--축제 
drop table festival;
create table festival (
place varchar2(200),
sigungu varchar2(20),
address varchar2(200),
overview CLOB,
longtitude float(20),
altitude float(20),
startdate date,
enddate date
);

commit;

select * from festival;

-- 식당/카페
drop table food;

create table food (
place varchar2(200),
sigungu varchar2(20),
address varchar2(200),
overview CLOB,
longtitude float(20),
altitude float(20)
);

commit;

select * from food;

