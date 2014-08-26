-- load info about applications and virtual machines
--


SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = diskprint, pg_catalog;


--INSERT INTO virtualmachine (vmsettingid, virtualmachineid, vm_appname, vm_appversion, installdate) VALUES ('1', 1, 'Windows XP', 'Professional', '2012-03-30 11:11:04.152015');
INSERT INTO diskprint.virtualmachine (vmid, vmappname, vmappversion) VALUES ('1', 'VmWare Fusion', '3.14');
INSERT INTO diskprint.virtualmachine (vmid, vmappname, vmappversion) VALUES ('3', 'VmWare Fusion', '6');

-- INSERT INTO os (etid, ossystemname) VALUES ('11331-2', 'Windows XP Professional');
INSERT INTO diskprint.os (osetid, ossystemname, vmid, installdate) VALUES ('234-1', 'Windows XP Professional', '1', 'February 5, 2013 3:40:56PM');
INSERT INTO diskprint.os (osetid, ossystemname, vmid, installdate) VALUES ('11331-2', 'Windows XP Professional', '1', 'June 26, 2013 9:10:56AM');
INSERT INTO diskprint.os (osetid, ossystemname, vmid, installdate) VALUES ('9480-1', 'Windows 7 Ultimate 32bit', '1', 'March 3, 2012 2:30:56PM');
INSERT INTO diskprint.os (osetid, ossystemname, vmid, installdate) VALUES ('9480-2', 'Windows 7 Ultimate 64bit', '1', 'January 30, 2013 1:23:56PM');
INSERT INTO diskprint.os (osetid, ossystemname, vmid, installdate) VALUES ('9544-1', 'Windows 7 Ultimate 64bit', '1', 'July 07, 2013 10:43:30AM');
INSERT INTO diskprint.os (osetid, ossystemname, vmid, installdate) VALUES ('8504-1', 'Windows Vista Ultimate w/SP1 32bit', '1', 'February 12, 2012 12:20:56PM');
INSERT INTO diskprint.os (osetid, ossystemname, vmid, installdate) VALUES ('8504-2', 'Windows Vista Ultimate w/SP1 64bit', '1', 'May 20, 2012 3:40:56PM');
INSERT INTO diskprint.os (osetid, ossystemname, vmid, installdate) VALUES ('14694-1', 'Windows 8 32bit', '3', 'February 16, 2014 2:30:56PM');

-- INSERT INTO vmsetting (vmsettingid, vminstancename, organization, sharing, applicationmenu, printers, autoprotect, soundconnect, usbdevice, otherdevicesconnected, advancedother, network, cd_dvdconnected, cd_dvdusediskimage, processorid, harddisktype, disksize, preallocatediskspace, split2gbfile) VALUES ('1', 'COMMON', 'NIST NSRL', 'disabled', 'enabled', 'disabled', 'disabled', 'enabled', 'enabled', 'no', 'unchanged', 'NAT', 'yes', '', 1, 'IDE', '4GB', 'yes', 'no');

-- start of the modified vmsetting
INSERT INTO diskprint.vmsetting (vmid, osetid, vminstancename, organization, sharing, applicationmenu, printers, autoprotect, startupdisk, advancedother, sound, usbdevice, otherdevicesconnected, network, cddvdconnected, cddvdusediskimage, harddisktype,disksize, preallocatediskspace, split2gbfile, display, processor, processorram) 
VALUES  ('1', '11331-2', '11331-2', 'nsrl-org', 'Disabled','Enabled', 'Disabled','Disabled', 'hard disk IDE disk','leave unchanged', 'Connected', 'Enabled','No', 'Bridged', 'Yes','NA', 'IDE','20GB','Yes', 'No','3D Enabled', '1 cpu', '2048MB');


INSERT INTO diskprint.vmsetting (vmid, osetid, vminstancename, organization, sharing, applicationmenu,  printers, autoprotect, startupdisk, advancedother, sound, usbdevice, otherdevicesconnected, network, cddvdconnected, cddvdusediskimage, harddisktype, disksize, preallocatediskspace, split2gbfile, display, processor, processorram) 
VALUES  ('1', '9480-1','9480-1', 'NIST', 'Disabled','Enabled', 'Disabled','Disabled', 'Hard Disk SCSI Disk', 'leave unchanged', 'Connected', 'Enabled', 'No', 'NAT', 'Yes', 'NA','IDE Disk','10GB','Yes', 'No', '3D Enabled', '1 cpu', '1024MB');

 INSERT INTO diskprint.vmsetting (vmid, osetid, vminstancename, organization, sharing, applicationmenu,  printers, autoprotect, startupdisk, advancedother, sound, usbdevice, otherdevicesconnected, network, cddvdconnected, cddvdusediskimage, harddisktype, disksize, preallocatediskspace, split2gbfile, display, processor, processorram) 
VALUES  ('1', '9480-2','9480-2', 'NIST', 'Disabled','Enabled', 'Disabled','Disabled', 'Hard Disk SCSI Disk', 'leave unchanged', 'Connected', 'Enabled', 'No', 'Bridged', 'Yes', 'NA','SCSI Disk','20GB','Yes', 'No', '3D Enabled', '1 cpu', '2048MB');

INSERT INTO diskprint.vmsetting (vmid, osetid, vminstancename, organization, sharing, applicationmenu,  printers, autoprotect, startupdisk, advancedother, sound, usbdevice, otherdevicesconnected, network, cddvdconnected, cddvdusediskimage, harddisktype, disksize, preallocatediskspace, split2gbfile, display, processor, processorram) 
VALUES  ('1', '9544-1','9544-1', 'nsrl-org', 'Disabled','Enabled', 'Disabled','Disabled', 'Hard Disk SCSI Disk', 'leave unchanged', 'Connected', 'Enabled', 'No', 'Bridged', 'Yes', 'NA','SCSI Disk','20GB','Yes', 'No', '3D Enabled', '1 cpu', '2048MB');

INSERT INTO diskprint.vmsetting (vmid, osetid, vminstancename, organization, sharing, applicationmenu,  printers, autoprotect, startupdisk, advancedother, sound, usbdevice, otherdevicesconnected, network, cddvdconnected, cddvdusediskimage, harddisktype, disksize, preallocatediskspace, split2gbfile, display, processor, processorram)  
VALUES  ('1', '8504-1', '8504-1', 'NIST','Disabled','Enabled', 'Disabled','Disabled', 'Hard Disk IDE Disk', 'leave unchanged',
'connected', 'Enabled', 'No', 'NAT','Yes','NA','IDE Disk','8GB','Yes', 'No','3D Enabled','1 cpu', '1GB');

INSERT INTO diskprint.vmsetting (vmid, osetid, vminstancename, organization, sharing, applicationmenu,  printers, autoprotect, startupdisk, advancedother, sound, usbdevice, otherdevicesconnected, network, cddvdconnected, cddvdusediskimage, harddisktype, disksize, preallocatediskspace, split2gbfile, display, processor, processorram)
VALUES  ('1', '8504-2', '8504-2', 'NIST', 'Disabled','Enabled', 'Disabled','Disabled', 'Hard Disk IDE Disk', 'leave unchanged',
'Yes', 'Enabled', 'No', 'NAT', 'Yes','NA','IDE Disk','8GB 10GB 12GB 15GB 18GB','Yes', 'No', '3D Enabled', '1 cpu', '1GB');

INSERT INTO diskprint.vmsetting (vmid, osetid, vminstancename, organization, sharing, applicationmenu,  printers, autoprotect, startupdisk, advancedother, sound, usbdevice, otherdevicesconnected, network, cddvdconnected, cddvdusediskimage, harddisktype, disksize, preallocatediskspace, split2gbfile, display, processor, processorram)  VALUES  ('3', '14694-1','Nist Nsrl', 'NIST', 'Disabled','Enabled', 'Disabled','Disabled', 'Hard Disk SCSI Disk', 'leave unchanged', 'Connected', 'Enabled', 'No', 'Bridged', 'Yes', 'NA','IDE Disk','40GB','Yes', 'No', '3D Enabled', '1 cpu', '2G');

-- INSERT INTO slice (virtualmachineid, sliceid, slicetype, etid, applicationetid, creationdate, slicenotes, slicestate, slicepredecessorid) VALUES (1, 1, 'InitialInstall', '11331-2', '11331-2', '2012-03-30 11:11:04.155792', 'Suspended to NAS', 'latest', NULL);

-- INSERT INTO storage (location, hash, filetype, issource) VALUES ('/Volumes/Storage/dRepository/slices/11331-2/11331-2-10.tar.gz', 'ec1ebb5ec98b6fe7ca6e18ed7fca921bd332eae2', 'slice', TRUE);
