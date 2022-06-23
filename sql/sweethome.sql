select * from member;

select * from address;

select * from main_category;

insert into main_category values ('furniture', '가구');

commit;

CREATE TABLE product (
	product_id	varchar2(80)		NOT NULL,
	product_name	varchar2(100)		NOT NULL,
	main_code	varchar2(30)		NOT NULL,
	sub_code varchar2(30)		NOT NULL,
	brand_id	varchar2(30)		NOT NULL,
	product_height	number		NOT NULL,
	product_width	 number		NULL,
	product_depth	number		NOT NULL,
	product_color	varchar2(10)		NOT NULL,
	product_price	number		NOT NULL,
	reg_date	date	DEFAULT sysdate	NOT NULL,
	p_content	varchar2(4000)		NULL,           -- 상품 설명 컬럼
    constraint pk_product_product_id primary key(product_id),
    constraint fk_product_main_code foreign key(main_code) references main_category(main_code),
    constraint fk_product_sub_code foreign key(sub_code) references sub_category(sub_code),
    constraint fk_product_brand_id foreign key(brand_id) references brand(brand_id)
);

CREATE TABLE product_image (
	attach_no	number		NOT NULL,
	product_id	varchar2(80)		NOT NULL,
	original_filename	varchar2(255)		NULL,
	renamed_filename	varchar2(255)		NULL,
	reg_date	date	DEFAULT sysdate,
    constraint pk_product_image_attach_no primary key(attach_no),
    constraint fk_product_image_product_id foreign key(product_id) references product(product_id) on delete cascade
);
--drop table product_image;
select * from product_image;
-- 상품 이미지 테이블 시퀀스 코드
create sequence seq_product_image_no nocache;




insert into brand values ( 'living_gatz', '가쯔');
insert into brand values ( 'living_quilt', '퀼트');
insert into brand values ( 'living_newnlook', '뉴앤룩');
insert into brand values ( 'living_lifesome', '라이프썸');
insert into brand values ( 'living_metaline', '메탈라인');
insert into brand values ( 'living_cottonliving', '코튼리빙');
insert into brand values ( 'living_terryfarmer', '테리파머');
insert into brand values ( 'living_mondrian', '몬드리안');
insert into brand values ( 'living_bambooyan', '밤부얀');
insert into brand values ( 'living_songwol', '송월');
insert into brand values ( 'living_livence', '리벤스');
insert into brand values ( 'living_magiccan', '매직캔');
insert into brand values ( 'living_monoflat', '모노플랫');
insert into brand values ( 'living_livingnsopum', '리빙소품');
insert into brand values ( 'living_toyama', '토야마');
insert into brand values ( 'living_byhome', '바이홈');
insert into brand values ( 'living_holzic', '홀직');
insert into brand values ( 'living_bangyum', '방염원단');
insert into brand values ( 'living_monoble', '모노블');
insert into brand values ( 'living_shininghome', '샤이닝홈');
insert into brand values ( 'living_outdoorproducts', '아웃도어프로덕츠');
insert into brand values ( 'living_pastella', '파스텔라');
insert into brand values ( 'living_vanesco', '바네스데코');
insert into brand values ( 'living_hni', '에이치앤아이');

select * from brand;


commit;



