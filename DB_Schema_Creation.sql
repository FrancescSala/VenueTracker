DROP DATABASE IF EXISTS venue_implementation_tracker;
CREATE DATABASE venue_implementation_tracker;
USE venue_implementation_tracker;

SET NAMES utf8mb4 ;
SET character_set_client = utf8mb4 ;

CREATE TABLE users (
  usr_username varchar(30) NOT NULL,
  usr_given_name varchar(50) NOT NULL,
  usr_family_name varchar(50) NOT NULL,
  usr_password varchar(300) NOT NULL,
  usr_active varchar(1) NOT NULL,
  usr_locked varchar(1) NOT NULL,
  PRIMARY KEY (usr_username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE roles (
  rol_rolename varchar(30) NOT NULL,
  rol_description varchar(150) NOT NULL,
  PRIMARY KEY (rol_rolename)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO roles VALUES ('Administrator', 'Perform administration tasks as creation and maintenance of users, venues, list of topics to track, etcetera.');
INSERT INTO roles VALUES ('Venue Manager','Updates the data tracked for venues. This role is given on all venues, or only on one or more specific venues.');
INSERT INTO roles VALUES ('Viewer','Views the data tracked for venues, without capacity to modify. This role is given on all venues, or only on one or more specific venues.');

CREATE TABLE venuetypes (
  vty_venuetypename varchar(20) NOT NULL,
  PRIMARY KEY (vty_venuetypename)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO venuetypes VALUES ('Competition');
INSERT INTO venuetypes VALUES ('Non-Competition');

CREATE TABLE zones (
  zon_zonecode varchar(3) NOT NULL,
  zon_zonename varchar(35) NOT NULL,
  zon_description varchar(50),
  PRIMARY KEY (zon_zonecode)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE venues (
  ven_venuecode varchar(3) NOT NULL,
  ven_venuename varchar(35) NOT NULL,
  ven_description varchar(50),
  ven_venuetype varchar(20) NOT NULL,
  ven_zonecode varchar(3) NOT NULL,
  PRIMARY KEY (ven_venuecode),
  KEY FK_ven_venuetype_idx (ven_venuetype),
  KEY FK_zon_zonecode_idx (ven_zonecode),
  CONSTRAINT FK_ven_vty FOREIGN KEY (ven_venuetype) REFERENCES venuetypes (vty_venuetypename) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT FK_ven_zon FOREIGN KEY (ven_zonecode) REFERENCES zones (zon_zonecode) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE categories (
  cat_categoryid tinyint NOT NULL AUTO_INCREMENT,
  cat_categoryname varchar(30) NOT NULL,
  PRIMARY KEY (cat_categoryid)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE subcategories (
  sub_categoryid tinyint NOT NULL,
  sub_subcategoryid tinyint NOT NULL AUTO_INCREMENT,
  sub_subcategoryname varchar(30) NOT NULL,
  PRIMARY KEY (sub_subcategoryid),
  KEY FK_sub_categoryid_idx (sub_categoryid),
  CONSTRAINT FK_sub_cat FOREIGN KEY (sub_categoryid) REFERENCES categories (cat_categoryid) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE topictypes (
  tty_topictypename varchar(30) NOT NULL,
  PRIMARY KEY (tty_topictypename)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO topictypes VALUES ('checkbox');
INSERT INTO topictypes VALUES ('percentage');
INSERT INTO topictypes VALUES ('unbounded counter');
INSERT INTO topictypes VALUES ('bounded counter');
INSERT INTO topictypes VALUES ('date');


CREATE TABLE topics (
  top_topicid tinyint NOT NULL AUTO_INCREMENT,
  top_topicname varchar(30) NOT NULL,
  top_topictype varchar(30) NOT NULL,
  top_topicsubcategory tinyint NOT NULL,
  PRIMARY KEY (top_topicid),
  KEY FK_top_topictype_idx (top_topictype),
  KEY FK_top_topiccategory_idx (top_topicsubcategory),
  CONSTRAINT FK_top_tty FOREIGN KEY (top_topictype) REFERENCES topictypes (tty_topictypename) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT FK_top_sub FOREIGN KEY (top_topicsubcategory) REFERENCES subcategories (sub_subcategoryid) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE disciplines (
  dis_disciplinecode varchar(3) NOT NULL,
  dis_disciplinename varchar(30) NOT NULL,
  PRIMARY KEY (dis_disciplinecode)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE venuedisciplines (
  vdi_venuecode varchar(3) NOT NULL,
  vdi_disciplinecode varchar(3) NOT NULL,
  PRIMARY KEY (vdi_venuecode,vdi_disciplinecode),
  KEY FK_vdi_venuecode_idx (vdi_venuecode),
  KEY FK_vdi_disciplinecode_idx (vdi_disciplinecode), 
  CONSTRAINT FK_vdi_ven FOREIGN KEY (vdi_venuecode) REFERENCES venues (ven_venuecode) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT FK_vdi_dis FOREIGN KEY (vdi_disciplinecode) REFERENCES disciplines (dis_disciplinecode) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE userprofiles (
  upr_username varchar(30) NOT NULL,
  upr_rolename varchar(30) NOT NULL,
  PRIMARY KEY (upr_username,upr_rolename),
  KEY FK_upr_username_idx (upr_username),
  KEY FK_upr_rolename_idx (upr_rolename), 
  CONSTRAINT FK_upr_usr FOREIGN KEY (upr_username) REFERENCES users (usr_username) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT FK_upr_rol FOREIGN KEY (upr_rolename) REFERENCES roles (rol_rolename) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE venueuserprofiles (
  vup_username varchar(30) NOT NULL,
  vup_rolename varchar(30) NOT NULL,
  vup_venuecode varchar(3) NOT NULL,
  PRIMARY KEY (vup_username,vup_rolename,vup_venuecode),
  KEY FK_vup_userprofile_idx (vup_username,vup_rolename),
  KEY FK_vup_venuecode_idx (vup_venuecode), 
  CONSTRAINT FK_vup_upr FOREIGN KEY (vup_username,vup_rolename) REFERENCES userprofiles (upr_username, upr_rolename) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT FK_vup_ven FOREIGN KEY (vup_venuecode) REFERENCES venues (ven_venuecode) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE venuetopics (
  vto_venuecode varchar(3) NOT NULL,
  vto_topicid tinyint NOT NULL,
  vto_track boolean NOT NULL,
  vto_lowerbound varchar(30),
  vto_upperbound varchar(30),
  vto_value varchar(30),
  PRIMARY KEY (vto_venuecode,vto_topicid),
  KEY FK_vto_venuecode_idx (vto_venuecode), 
  KEY FK_vto_topicid_idx (vto_topicid),
  CONSTRAINT FK_vto_ven FOREIGN KEY (vto_venuecode) REFERENCES venues (ven_venuecode) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT FK_vto_top FOREIGN KEY (vto_topicid) REFERENCES topics (top_topicid) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


