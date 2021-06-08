use newservlet12month2018;

use webdonghothoitrang

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
  fullname VARCHAR(150) NULL,
  status int NOT NULL,
  numberphone VARCHAR(150) NULL,
  email VARCHAR(150) NULL,
  roleid bigint NOT NULL,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);
ALTER TABLE user ADD CONSTRAINT fk_user_role FOREIGN KEY (roleid) REFERENCES role(id);

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

create table cart(
 id bigint NOT NULL PRIMARY KEY auto_increment,
 product_id bigint NOT NULL,
 user_id bigint not null,
 amount int not null,
 createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL,
  billid bigint not null
);

ALTER TABLE cart ADD CONSTRAINT fk_cart_product FOREIGN KEY (product_id) REFERENCES product(id);
ALTER TABLE cart ADD CONSTRAINT fk_cart_user FOREIGN KEY (user_id) REFERENCES user(id);

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

create table quangcao(
	id bigint NOT NULL PRIMARY KEY auto_increment,
	image1 longblob,
	image2 longblob,
	image3 longblob
);

create table bill(
	id bigint NOT NULL PRIMARY KEY auto_increment,
	fullname VARCHAR(255) not null,
	numberphone VARCHAR(255) not null,
	email VARCHAR(255) not null,
	address VARCHAR(255) not null,
	totalmoney VARCHAR(255) not null,
	status VARCHAR(255) not null,
	user_id bigint NOT NULL,
        createddate TIMESTAMP NULL,
	modifieddate TIMESTAMP NULL,
	createdby VARCHAR(255) NULL,
	modifiedby VARCHAR(255) NULL
);
ALTER TABLE bill ADD CONSTRAINT fk_bill_user FOREIGN KEY (user_id) REFERENCES user(id);




