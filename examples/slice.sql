INSERT INTO diskprint.slice (sliceid, slicetype, osetid, appetid, creationdate, slicenotes, slicestate, slicehash) VALUES (10, 'Install', '8504-2', '6031-1', '2012/06/20','Select a location for the Network 2 Network. Home; Permission Window. Continue; Start; Computer; TurboTax 2005; setup; Permission Window. Continue; Welcome Window. Next; License Agreement. I agree. Next; Select Installation Directory. Next', 'latest', 'e703abc8f639e0ee507c47d97e98f8af710c7e7f');

INSERT INTO diskprint.slicelineage (slicehash, predecessor_slicehash) VALUES ('e703abc8f639e0ee507c47d97e98f8af710c7e7f', NULL);

INSERT INTO diskprint.sequence (osetid, appetid, start_slicehash, end_slicehash) VALUES ('8504-2', '6031-1', 'e703abc8f639e0ee507c47d97e98f8af710c7e7f', 'e703abc8f639e0ee507c47d97e98f8af710c7e7f');
