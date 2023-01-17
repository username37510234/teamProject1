<<<<<<< HEAD
SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS COMMENT_INFO;
DROP TABLE IF EXISTS DIB_INFO;
DROP TABLE IF EXISTS LIKE_INFO;
DROP TABLE IF EXISTS FESTIVAL_INFORMATION;
DROP TABLE IF EXISTS USER_INFO;




/* Create Tables */

CREATE TABLE COMMENT_INFO
(
	CI_NUM int NOT NULL,
	CI_CONTENT text NOT NULL,
	CI_ACTIVE char(5) NOT NULL,
	CI_CREDATTIM varchar(100) NOT NULL,
	UI_NUM int NOT NULL,
	FI_NUM int NOT NULL,
	PRIMARY KEY (CI_NUM)
);


CREATE TABLE DIB_INFO
(
	DI_NUM int NOT NULL,
	DI_ACTIVE char(5) NOT NULL,
	DI_DATE varchar(100) NOT NULL,
	UI_NUM int NOT NULL,
	FI_NUM int NOT NULL,
	PRIMARY KEY (DI_NUM),
	UNIQUE (UI_NUM),
	UNIQUE (FI_NUM)
);


CREATE TABLE FESTIVAL_INFORMATION
(
	FI_NUM int NOT NULL AUTO_INCREMENT,
	ADDR1 varchar(400),
	ADDR2 varchar(400),
	AREACODE varchar(10),
	BOOKTOUR varchar(1),
	CAT1 varchar(12),
	CAT2 varchar(12),
	CAT3 varchar(12),
	CONTENTID varchar(12) NOT NULL,
	CONTENTTYPEID varchar(2) NOT NULL,
	CREATEDTIME varchar(14) NOT NULL,
	EVENTSTARTDATE varchar(8) NOT NULL,
	EVENTENDDATE varchar(8) NOT NULL,
	FIRSTIMAGE varchar(100),
	FIRSTIMAGE2 varchar(100),
	MAPX varchar(30),
	MAPY varchar(30),
	MLEVEL varchar(10),
	MODIFIEDTIME varchar(14) NOT NULL,
	READCOUNT varchar(20),
	SIGUNGUCODE  varchar(10),
	TEL varchar(300),
	TITLE varchar(600) NOT NULL,
	PRIMARY KEY (FI_NUM),
	UNIQUE (CONTENTID)
);


CREATE TABLE LIKE_INFO
(
	LI_NUM int NOT NULL,
	LI_ACTIVE char(5) NOT NULL,
	UI_NUM int NOT NULL,
	FI_NUM int NOT NULL,
	PRIMARY KEY (LI_NUM),
	UNIQUE (UI_NUM),
	UNIQUE (FI_NUM)
);


CREATE TABLE USER_INFO
(
	UI_NUM int NOT NULL,
	UI_ID varchar(100) NOT NULL,
	UI_NAME varchar(100) NOT NULL,
	UI_NICKNAME varchar(100) NOT NULL,
	UI_PWD varchar(100) NOT NULL,
	UI_ACTIVE char(5) NOT NULL,
	UI_PHONE varchar(100) NOT NULL,
	UI_CREDAT varchar(100) NOT NULL,
	PRIMARY KEY (UI_NUM),
	UNIQUE (UI_ID)
);



/* Create Foreign Keys */

ALTER TABLE COMMENT_INFO
	ADD FOREIGN KEY (FI_NUM)
	REFERENCES FESTIVAL_INFORMATION (FI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE DIB_INFO
	ADD FOREIGN KEY (FI_NUM)
	REFERENCES FESTIVAL_INFORMATION (FI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE LIKE_INFO
	ADD FOREIGN KEY (FI_NUM)
	REFERENCES FESTIVAL_INFORMATION (FI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE COMMENT_INFO
	ADD FOREIGN KEY (UI_NUM)
	REFERENCES USER_INFO (UI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE DIB_INFO
	ADD FOREIGN KEY (UI_NUM)
	REFERENCES USER_INFO (UI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE LIKE_INFO
	ADD FOREIGN KEY (UI_NUM)
	REFERENCES USER_INFO (UI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



=======
SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS COMMENT_INFO;
DROP TABLE IF EXISTS DIB_INFO;
DROP TABLE IF EXISTS LIKE_INFO;
DROP TABLE IF EXISTS FESTIVAL_INFORMATION;
DROP TABLE IF EXISTS USER_INFO;




/* Create Tables */

CREATE TABLE COMMENT_INFO
(
	CI_NUM int,
	CI_CONTENT text NOT NULL,
	CI_ACTIVE char(5) NOT NULL,
	CI_CREDATTIM varchar(100) NOT NULL,
	UI_NUM int NOT NULL,
	FI_NUM int NOT NULL
);


CREATE TABLE DIB_INFO
(
	DI_NUM int NOT NULL,
	DI_ACTIVE char(5) NOT NULL,
	DI_DATE varchar(100) NOT NULL,
	UI_NUM int NOT NULL,
	FI_NUM int NOT NULL,
	PRIMARY KEY (DI_NUM),
	UNIQUE (UI_NUM),
	UNIQUE (FI_NUM)
);


CREATE TABLE FESTIVAL_INFORMATION
(
	FI_NUM int NOT NULL AUTO_INCREMENT,
	ADDR1 varchar(400),
	ADDR2 varchar(400),
	AREACODE varchar(10),
	BOOKTOUR varchar(1),
	CAT1 varchar(12),
	CAT2 varchar(12),
	CAT3 varchar(12),
	CONTENTID varchar(12) NOT NULL,
	CONTENTTYPEID varchar(2) NOT NULL,
	CREATEDTIME varchar(14) NOT NULL,
	EVENTSTARTDATE varchar(8) NOT NULL,
	EVENTENDDATE varchar(8) NOT NULL,
	FIRSTIMAGE varchar(100),
	FIRSTIMAGE2 varchar(100),
	MAPX varchar(30),
	MAPY varchar(30),
	MLEVEL varchar(10),
	MODIFIEDTIME varchar(14) NOT NULL,
	READCOUNT varchar(20),
	SIGUNGUCODE  varchar(10),
	TEL varchar(300),
	TITLE varchar(600) NOT NULL,
	PRIMARY KEY (FI_NUM),
	UNIQUE (CONTENTID)
);


CREATE TABLE LIKE_INFO
(
	LI_NUM int NOT NULL,
	LI_ACTIVE char(5) NOT NULL,
	UI_NUM int NOT NULL,
	FI_NUM int NOT NULL,
	PRIMARY KEY (LI_NUM),
	UNIQUE (UI_NUM),
	UNIQUE (FI_NUM)
);


CREATE TABLE USER_INFO
(
	UI_NUM int NOT NULL,
	UI_ID varchar(100) NOT NULL,
	UI_NAME varchar(100) NOT NULL,
	UI_NICKNAME varchar(100) NOT NULL,
	UI_PWD varchar(100) NOT NULL,
	UI_ACTIVE char(5) NOT NULL,
	UI_PHONE varchar(100) NOT NULL,
	UI_CREDAT varchar(100) NOT NULL,
	PRIMARY KEY (UI_NUM),
	UNIQUE (UI_ID)
);



/* Create Foreign Keys */

ALTER TABLE COMMENT_INFO
	ADD FOREIGN KEY (FI_NUM)
	REFERENCES FESTIVAL_INFORMATION (FI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE DIB_INFO
	ADD FOREIGN KEY (FI_NUM)
	REFERENCES FESTIVAL_INFORMATION (FI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE LIKE_INFO
	ADD FOREIGN KEY (FI_NUM)
	REFERENCES FESTIVAL_INFORMATION (FI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE COMMENT_INFO
	ADD FOREIGN KEY (UI_NUM)
	REFERENCES USER_INFO (UI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE DIB_INFO
	ADD FOREIGN KEY (UI_NUM)
	REFERENCES USER_INFO (UI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE LIKE_INFO
	ADD FOREIGN KEY (UI_NUM)
	REFERENCES USER_INFO (UI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



>>>>>>> branch 'main' of https://github.com/Mirabilia963/3rd-Team.git
