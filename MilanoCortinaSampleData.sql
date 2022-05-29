-- Fill sample data for Milano-Cortina'2026 Winter Olympic Games

USE venue_implementation_tracker;

INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('ALS','Alpine Skiing');
INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('BTH','Biathlon');
INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('BOB','Bobsleigh');
INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('CCS','Cross-Country Skiing');
INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('CUR','Curling');
INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('FSK','Figure Skating');
INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('FRS','Free Style Skiing');
INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('IHO','Ice Hockey');
INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('LUG','Luge');
INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('NCO','Nordic Combined');
INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('SSS','Short Track Speed Skating');
INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('SKN','Skeleton');
INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('SKJ','Skii Jumping');
INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('SKM','Skii Mountaineering');
INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('SNB','Snowboard');
INSERT INTO disciplines (dis_disciplinecode,dis_disciplinename) VALUES ('SSK','Spped Skating');

INSERT INTO zones (zon_zonecode, zon_zonename, zon_description) VALUES ('MIL', 'Milano', '');
INSERT INTO zones (zon_zonecode, zon_zonename, zon_description) VALUES ('VTE', 'Valtellina', '');
INSERT INTO zones (zon_zonecode, zon_zonename, zon_description) VALUES ('VER', 'Verona', '');
INSERT INTO zones (zon_zonecode, zon_zonename, zon_description) VALUES ('VFI', 'Val di Fiemme', '');
INSERT INTO zones (zon_zonecode, zon_zonename, zon_description) VALUES ('COR', 'Cortina d\'Ampezzo', '');
INSERT INTO zones (zon_zonecode, zon_zonename, zon_description) VALUES ('ANT', 'Anterselva', '');


INSERT INTO venues (ven_venuecode, ven_venuename, ven_description, ven_venuetype, ven_zonecode) VALUES ('MST', 'Meazz Stadium', 'Milano: San Siro. Open Ceremony', 'Non-Competition', 'MIL'); -- Open Ceremony
INSERT INTO venues (ven_venuecode, ven_venuename, ven_description, ven_venuetype, ven_zonecode) VALUES ('PSG', 'Palaitalia Santa Giulia', '', 'Competition', 'MIL'); -- Ice Hockey
INSERT INTO venues (ven_venuecode, ven_venuename, ven_description, ven_venuetype, ven_zonecode) VALUES ('MHA', 'Milano Hockey Arena', '', 'Competition', 'MIL'); -- IH PIH
INSERT INTO venues (ven_venuecode, ven_venuename, ven_description, ven_venuetype, ven_zonecode) VALUES ('FOA', 'Forum Di Assagio', '', 'Competition', 'MIL'); -- ST and FS
INSERT INTO venues (ven_venuecode, ven_venuename, ven_description, ven_venuetype, ven_zonecode) VALUES ('PDU', 'Piazza Duomo', 'Milano. Closing Ceremony Paralympics', 'Non-Competition', 'MIL'); -- Closing Ceremony PG
INSERT INTO venues (ven_venuecode, ven_venuename, ven_description, ven_venuetype, ven_zonecode) VALUES ('LIV', 'Livigno', '', 'Competition', 'VTE'); -- FS SB
INSERT INTO venues (ven_venuecode, ven_venuename, ven_description, ven_venuetype, ven_zonecode) VALUES ('BOS', 'Bormio Stelvio', '', 'Competition', 'VTE'); -- AS, SM
INSERT INTO venues (ven_venuecode, ven_venuename, ven_description, ven_venuetype, ven_zonecode) VALUES ('AVE', 'Arena Of Verona', 'Verona: Closing Ceremony', 'Non-Competition', 'VER'); 
INSERT INTO venues (ven_venuecode, ven_venuename, ven_description, ven_venuetype, ven_zonecode) VALUES ('BAP', 'Baselga Di Pinè', '', 'Competition', 'VFI'); -- SS
INSERT INTO venues (ven_venuecode, ven_venuename, ven_description, ven_venuetype, ven_zonecode) VALUES ('TES', 'Tesero Cross-Country Skiing Stadium', '', 'Competition', 'VFI'); -- CC NC  
INSERT INTO venues (ven_venuecode, ven_venuename, ven_description, ven_venuetype, ven_zonecode) VALUES ('PRE', 'Predazzo Ski Jumping Stadium', '', 'Competition', 'VFI'); -- SJ, NC
INSERT INTO venues (ven_venuecode, ven_venuename, ven_description, ven_venuetype, ven_zonecode) VALUES ('ODT', 'Olympia Delle Tofane', '', 'Competition', 'COR'); -- AS
INSERT INTO venues (ven_venuecode, ven_venuename, ven_description, ven_venuetype, ven_zonecode) VALUES ('CSC', 'Cortina Sliding Centre', '', 'Competition', 'COR'); -- BS SN LG
INSERT INTO venues (ven_venuecode, ven_venuename, ven_description, ven_venuetype, ven_zonecode) VALUES ('COS', 'Cortina Olympic Stadium', '', 'Competition', 'COR'); -- CU
INSERT INTO venues (ven_venuecode, ven_venuename, ven_description, ven_venuetype, ven_zonecode) VALUES ('SUA', 'Südtirol Arena', '', 'Competition', 'ANT'); -- BT

INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('PSG', 'IHO');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('MHA', 'IHO');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('FOA', 'SSS');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('FOA', 'FSK');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('LIV', 'FSK');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('LIV', 'SNB');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('BOS', 'ALS');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('BOS', 'SKM');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('BAP', 'SSK');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('TES', 'CCS');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('TES', 'NCO');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('PRE', 'SKJ');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('PRE', 'NCO');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('ODT', 'ALS');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('CSC', 'BOB');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('CSC', 'SKN');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('CSC', 'LUG');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('COS', 'CUR');
INSERT INTO venuedisciplines (vdi_venuecode, vdi_disciplinecode) VALUES ('SUA', 'BTH');

INSERT INTO users (usr_username, usr_given_name, usr_family_name, usr_password, usr_active, usr_locked) VALUES ('john@deloitte.com', 'John', 'Smith', 'mypassword', 'N', 'N');
INSERT INTO users (usr_username, usr_given_name, usr_family_name, usr_password, usr_active, usr_locked) VALUES ('paul@deloitte.com', 'Paul', 'Samuelson', 'mypassword', 'N', 'N');
INSERT INTO users (usr_username, usr_given_name, usr_family_name, usr_password, usr_active, usr_locked) VALUES ('mary@deloitte.com', 'Mary', 'Brown', 'mypassword', 'N', 'N');
INSERT INTO users (usr_username, usr_given_name, usr_family_name, usr_password, usr_active, usr_locked) VALUES ('susane@deloitte.com', 'Susane', 'Austin', 'mypassword', 'N', 'N');
INSERT INTO users (usr_username, usr_given_name, usr_family_name, usr_password, usr_active, usr_locked) VALUES ('gavin@deloitte.com', 'Gavin', 'Gray', 'mypassword', 'N', 'N');

INSERT INTO userprofiles (upr_username, upr_rolename) VALUES ('john@deloitte.com','Administrator');
INSERT INTO userprofiles (upr_username, upr_rolename) VALUES ('paul@deloitte.com','Venue Manager');
INSERT INTO userprofiles (upr_username, upr_rolename) VALUES ('mary@deloitte.com','Venue Manager');
INSERT INTO userprofiles (upr_username, upr_rolename) VALUES ('susane@deloitte.com','Viewer');
INSERT INTO userprofiles (upr_username, upr_rolename) VALUES ('susane@deloitte.com','Venue Manager');
INSERT INTO userprofiles (upr_username, upr_rolename) VALUES ('gavin@deloitte.com','Viewer');


INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('paul@deloitte.com', 'Venue Manager', 'PSG');
INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('paul@deloitte.com', 'Venue Manager', 'MHA');
INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('paul@deloitte.com', 'Venue Manager', 'FOA');
INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('mary@deloitte.com', 'Venue Manager', 'LIV');
INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('mary@deloitte.com', 'Venue Manager', 'BOS');
INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('mary@deloitte.com', 'Venue Manager', 'BAP');
INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('susane@deloitte.com', 'Viewer', 'PSG');
INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('susane@deloitte.com', 'Viewer', 'MHA');
INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('susane@deloitte.com', 'Viewer', 'FOA');
INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('susane@deloitte.com', 'Venue Manager', 'CSC');
INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('susane@deloitte.com', 'Venue Manager', 'COS');
INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('susane@deloitte.com', 'Venue Manager', 'SUA');
INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('gavin@deloitte.com', 'Viewer', 'LIV');
INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('gavin@deloitte.com', 'Viewer', 'BOS');
INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('gavin@deloitte.com', 'Viewer', 'BAP');
INSERT INTO venueuserprofiles (vup_username, vup_rolename, vup_venuecode)  VALUES ('gavin@deloitte.com', 'Viewer', 'SUA');


INSERT INTO categories (cat_categoryname) VALUES ('Spaces');
INSERT INTO categories (cat_categoryname) VALUES ('Services');


INSERT INTO subcategories (sub_subcategoryname, sub_categoryid) VALUES ('Build',1);
INSERT INTO subcategories (sub_subcategoryname, sub_categoryid) VALUES ('Power',1);
INSERT INTO subcategories (sub_subcategoryname, sub_categoryid) VALUES ('Build',1);
 


-- INSERT INTO topics (top_topicname, top_topictype, top_topiccategory) VALUES ('Results Room Power', 'checkbox',1);



-- CREATE TABLE topics (
-- CREATE TABLE userprofiles (
-- CREATE TABLE venueuserprofiles (
-- CREATE TABLE venuetopics (


