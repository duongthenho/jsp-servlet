use newservlet12month2018;

create table role(
	id bigint not null primary key auto_increment,
	name VARCHAR(255) NOT NULL,
	code VARCHAR(255) NOT NULL,
	createddate TIMESTAMP NULL,
	modifieddate TIMESTAMP NULL,
	createdby VARCHAR(255) NULL,
	modifiedby VARCHAR(255) NULL
);

CREATE TABLE user (
  id bigint NOT NULL PRIMARY KEY auto_increment,
  username VARCHAR(150) NOT NULL,
  password VARCHAR(150) NOT NULL,
  status int NOT NULL,
  roleid bigint NOT NULL,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);
ALTER TABLE user ADD CONSTRAINT fk_user_role FOREIGN KEY (roleid) REFERENCES role(id);

Create table userinfor(
  id bigint NOT NULL PRIMARY KEY auto_increment,
  fullname varchar(150) not null,
  address varchar(255) not null,
  numberphone varchar(150) not null,
  email varchar(150) not null,
  note varchar(255),
  userid bigint not null,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);
ALTER TABLE userinfor ADD CONSTRAINT fk_userinfor_user FOREIGN KEY (userid) REFERENCES user(id);


CREATE TABLE category (
  id bigint NOT NULL PRIMARY KEY auto_increment,
  name VARCHAR(255) NOT NULL,
  code VARCHAR(255) NOT NULL,
  status int not null,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);

create table product(
 id bigint NOT NULL PRIMARY KEY auto_increment,
 image longblob,
 name VARCHAR(255) NOT NULL,
 price double not null,
 code varchar(255) not null,
 categoryid bigint not null,
 createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);
ALTER TABLE product ADD CONSTRAINT fk_product_category FOREIGN KEY (categoryid) REFERENCES category(id);

create table bill(
	id bigint NOT NULL PRIMARY KEY auto_increment,
	totalmoney VARCHAR(255) not null,
	status VARCHAR(255) not null,
	userinforid bigint NOT NULL,
    createddate TIMESTAMP NULL,
	modifieddate TIMESTAMP NULL,
	createdby VARCHAR(255) NULL,
	modifiedby VARCHAR(255) NULL
);
ALTER TABLE bill ADD CONSTRAINT fk_bill_userinfor FOREIGN KEY (userinforid) REFERENCES userinfor(id);

create table detailbill(
  id bigint NOT NULL PRIMARY KEY auto_increment,
  productid bigint NOT NULL,
  price float not null,
  amount int not null,
  billid bigint not null,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);
ALTER TABLE detailbill ADD CONSTRAINT fk_detailbill_product FOREIGN KEY (productid) REFERENCES product(id);
ALTER TABLE detailbill ADD CONSTRAINT fk_detailbill_bill FOREIGN KEY (billid) REFERENCES bill(id);


create table quangcao(
	id bigint NOT NULL PRIMARY KEY auto_increment,
	image1 longblob,
	image2 longblob,
	image3 longblob
);

create table tinhthanhpho(
 matp VARCHAR(255) not null primary key,
 name VARCHAR(255) not null,
 type VARCHAR(255) not null
);

create table quanhuyen(
 maqh VARCHAR(255) not null primary key,
 name VARCHAR(255) not null,
 type VARCHAR(255) not null,
 matp VARCHAR(255) not null
);
ALTER TABLE quanhuyen ADD CONSTRAINT fk_quanhuyen_tinhthanhpho FOREIGN KEY (matp) REFERENCES tinhthanhpho(matp);

create table xaphuongthitran(
 xaid VARCHAR(255) not null primary key,
 name VARCHAR(255) not null,
 type VARCHAR(255) not null,
 maqh VARCHAR(255) not null
);
ALTER TABLE xaphuongthitran ADD CONSTRAINT fk_xaphuongthitran_quanhuyen FOREIGN KEY (maqh) REFERENCES quanhuyen(maqh);




