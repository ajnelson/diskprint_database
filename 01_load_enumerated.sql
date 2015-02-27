--
-- load enumerated data
--


SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = diskprint, pg_catalog;


SELECT pg_catalog.setval('cell_actionid_seq', 1, true);


SELECT pg_catalog.setval('celltype_celltypeid_seq', 1, true);


SELECT pg_catalog.setval('hive_hiveid_seq', 1, false);



INSERT INTO diskprint.cell (actionid, actiontype) VALUES (1, 'created');
INSERT INTO diskprint.cell (actionid, actiontype) VALUES (2, 'removed');
INSERT INTO diskprint.cell (actionid, actiontype) VALUES (3, 'mtime_updated');
INSERT INTO diskprint.cell (actionid, actiontype) VALUES (4, 'value_updated');
INSERT INTO diskprint.cell (actionid, actiontype) VALUES (5, 'property updated');



INSERT INTO diskprint.celltype (celltypeid, typedesc) VALUES (1, 'UTF8');
INSERT INTO diskprint.celltype (celltypeid, typedesc) VALUES (2, 'UTF16');
INSERT INTO diskprint.celltype (celltypeid, typedesc) VALUES (3, 'int');



-- INSERT INTO datasize (size) VALUES ('1024MB');
-- INSERT INTO datasize (size) VALUES ('4GB');
-- INSERT INTO datasize (size) VALUES ('8GB');
-- INSERT INTO datasize (size) VALUES ('10GB');
-- INSERT INTO datasize (size) VALUES ('2GB');
-- INSERT INTO datasize (size) VALUES ('512MB');




-- INSERT INTO processorsetting (processorid, cpu, ram) VALUES (1, 1, '1024MB');


INSERT INTO diskprint.slicestate (type) VALUES ('stored');
INSERT INTO diskprint.slicestate (type) VALUES ('latest');
INSERT INTO diskprint.slicestate (type) VALUES ('last');

INSERT INTO diskprint.slicetype (type) VALUES ('Activate');
INSERT INTO diskprint.slicetype (type) VALUES ('Close');
INSERT INTO diskprint.slicetype (type) VALUES ('Default');
INSERT INTO diskprint.slicetype (type) VALUES ('Function');
INSERT INTO diskprint.slicetype (type) VALUES ('Install');
INSERT INTO diskprint.slicetype (type) VALUES ('License');
INSERT INTO diskprint.slicetype (type) VALUES ('Open');
INSERT INTO diskprint.slicetype (type) VALUES ('PreInstall');
INSERT INTO diskprint.slicetype (type) VALUES ('ProductKey');
INSERT INTO diskprint.slicetype (type) VALUES ('Reboot');
INSERT INTO diskprint.slicetype (type) VALUES ('Restart');
INSERT INTO diskprint.slicetype (type) VALUES ('Shutdown');
INSERT INTO diskprint.slicetype (type) VALUES ('Start');
INSERT INTO diskprint.slicetype (type) VALUES ('Uninstall');
INSERT INTO diskprint.slicetype (type) VALUES ('Idle');



-- INSERT INTO vmsettingstate (state) VALUES ('enabled');
-- INSERT INTO vmsettingstate (state) VALUES ('disabled');
-- INSERT INTO vmsettingstate (state) VALUES ('yes');
-- INSERT INTO vmsettingstate (state) VALUES ('no');
-- INSERT INTO vmsettingstate (state) VALUES ('3Denabled');
-- INSERT INTO vmsettingstate (state) VALUES ('NAT');


