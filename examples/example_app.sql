--Insert record on the slice.  No lineage happens to be given in this example.
INSERT INTO diskprint.slice (
  osetid, appetid, sliceid,
  predecessor_osetid, predecessor_appetid, predecessor_sliceid,
  slicetype,
  creationdate,
  slicenotes,
  slicestate
) VALUES (
  '8504-2', '6031-1', 10,
  NULL, NULL, NULL,
  'Install',
  '2012/06/20',
  'Select a location for the Network 2 Network. Home; Permission Window. Continue; Start; Computer; TurboTax 2005; setup; Permission Window. Continue; Welcome Window. Next; License Agreement. I agree. Next; Select Installation Directory. Next',
  'latest'
);

--Insert storage record for the compressed, archived virtual machine.
--This machine has only a single snapshotted state, sliceid 10.  The 10-10 at the end of the file name is a way of denoting on which sliceid a printed sequence begins and ends; they're the same with only one slice.
INSERT INTO diskprint.storage (osetid, appetid, sliceid, location, hash, filetype, issource) VALUES (
  '8504-2', '6031-1', NULL,
  '/Volumes/RaidStore/Diskprints/VMs/8504-2-6031-1-10-10.zip',
  '8f8af710c7e7fe703abe507c47d97e9c8f639e0e',
  "vm",
  TRUE
);

--Insert storage record for the extracted disk image.
INSERT INTO diskprint.storage (osetid, appetid, sliceid, location, hash, filetype, issource) VALUES (
  '8504-2', '6031-1', 10,
  '/Volumes/RaidStore/Diskprints/Extracts/8504-2-6031-1-10/disk0.E01',
  '507c47d97e9c8f639e0e8f8af710c7e7fe703abe',
  "disk",
  FALSE
);

--Stake the name for this sequence.
INSERT INTO diskprint.namedsequenceid (sequencelabel) VALUES ("example-8504-2-6031-1-10-10");

--Define the sequence by listing the node chain.
INSERT INTO diskprint.namedsequence (
  sequencelabel,
  osetid, appetid, sliceid,
  predecessor_osetid, predecessor_appetid, predecessor_sliceid
) VALUES (
  "example-8504-2-6031-1-10-10",
  '8504-2', '6031-1', 10,
  NULL, NULL, NULL
);
