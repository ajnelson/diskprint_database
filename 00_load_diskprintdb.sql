-- PostgreSQL database dump
--

-- Dumped from database version 9.0.3
-- Dumped by pg_dump version 9.0.3
-- Started on 2013-02-11 13:57:30 EST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1921 (class 1262 OID 20345)
-- Name: diskprints; Type: DATABASE; Schema: -; Owner: postgres
--

--AJN TODO Doug can find how to restore LC_COLLATE stuff if really desired.
CREATE DATABASE diskprints WITH TEMPLATE = template0 ENCODING = 'UTF8';


ALTER DATABASE diskprints OWNER TO postgres;

\connect diskprints

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 6 (class 2615 OID 20556)
-- Name: diskprint; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA diskprint;


ALTER SCHEMA diskprint OWNER TO postgres;

--
-- TOC entry 1922 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA diskprint; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA diskprint IS 'diskprint schema';


--
-- TOC entry 359 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = diskprint, pg_catalog;

--
-- TOC entry 18 (class 1255 OID 20557)
-- Dependencies: 6 359
-- Name: queueprocess(); Type: FUNCTION; Schema: diskprint; Owner: postgres
--

CREATE FUNCTION queueprocess() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO diskprint.processqueue (location, slicehash)
	VALUES (NEW.location, NEW.slicehash);
RETURN NULL;
END;$$;


ALTER FUNCTION diskprint.queueprocess() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1551 (class 1259 OID 20558)
-- Dependencies: 6
-- Name: cell; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.cell (
    actionid integer NOT NULL,
    actiontype character varying(32) NOT NULL
);


ALTER TABLE diskprint.cell OWNER TO postgres;

--
-- TOC entry 1552 (class 1259 OID 20561)
-- Dependencies: 1551 6
-- Name: cell_actionid_seq; Type: SEQUENCE; Schema: diskprint; Owner: postgres
--

CREATE SEQUENCE cell_actionid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE diskprint.cell_actionid_seq OWNER TO postgres;

--
-- TOC entry 1924 (class 0 OID 0)
-- Dependencies: 1552
-- Name: cell_actionid_seq; Type: SEQUENCE OWNED BY; Schema: diskprint; Owner: postgres
--

ALTER SEQUENCE cell_actionid_seq OWNED BY cell.actionid;


--
-- TOC entry 1553 (class 1259 OID 20563)
-- Dependencies: 6
-- Name: celltype; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.celltype (
    celltypeid integer NOT NULL,
    typedesc character varying(32) NOT NULL
);


ALTER TABLE diskprint.celltype OWNER TO postgres;

--
-- TOC entry 1554 (class 1259 OID 20566)
-- Dependencies: 6 1553
-- Name: celltype_celltypeid_seq; Type: SEQUENCE; Schema: diskprint; Owner: postgres
--

CREATE SEQUENCE celltype_celltypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE diskprint.celltype_celltypeid_seq OWNER TO postgres;

--
-- TOC entry 1925 (class 0 OID 0)
-- Dependencies: 1554
-- Name: celltype_celltypeid_seq; Type: SEQUENCE OWNED BY; Schema: diskprint; Owner: postgres
--

ALTER SEQUENCE celltype_celltypeid_seq OWNED BY celltype.celltypeid;


--
-- TOC entry 1555 (class 1259 OID 20568)
-- Dependencies: 1853 6
-- Name: filemetadata; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.filemetadata (
    keyhash character varying(64) NOT NULL,
    slicehash character varying(127) NOT NULL,
    path character varying(1023) NOT NULL,
    filename character varying(255) NOT NULL,
    extension character varying(255) DEFAULT ''::character varying NOT NULL,
    bytes bigint NOT NULL,
    mtime timestamp without time zone NOT NULL,
    ctime timestamp without time zone NOT NULL
);


ALTER TABLE diskprint.filemetadata OWNER TO postgres;

--
-- TOC entry 1556 (class 1259 OID 20575)
-- Dependencies: 1854 6
-- Name: hive; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.hive (
    hiveid integer NOT NULL,
    hivepath character varying NOT NULL,
    appetid character varying(50) NOT NULL,
    osetid character varying(50) NOT NULL,
    datetime_ingested_to_postgres timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE diskprint.hive OWNER TO postgres;

--
-- TOC entry 1557 (class 1259 OID 20582)
-- Dependencies: 1556 6
-- Name: hive_hiveid_seq; Type: SEQUENCE; Schema: diskprint; Owner: postgres
--

CREATE SEQUENCE hive_hiveid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE diskprint.hive_hiveid_seq OWNER TO postgres;

--
-- TOC entry 1926 (class 0 OID 0)
-- Dependencies: 1557
-- Name: hive_hiveid_seq; Type: SEQUENCE OWNED BY; Schema: diskprint; Owner: postgres
--

ALTER SEQUENCE hive_hiveid_seq OWNED BY hive.hiveid;


--
-- TOC entry 1558 (class 1259 OID 20584)
-- Dependencies: 6
-- Name: md5; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.md5 (
    keyhash character varying(64) NOT NULL,
    hashval character(32) NOT NULL
);


ALTER TABLE diskprint.md5 OWNER TO postgres;

--
-- TOC entry 1559 (class 1259 OID 20587)
-- Dependencies: 6
-- Name: netchatter; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.netchatter (
    location character varying(1023) NOT NULL,
    slicehash character varying(127) NOT NULL
);


ALTER TABLE diskprint.netchatter OWNER TO postgres;

--
-- TOC entry 1560 (class 1259 OID 20593)
-- Dependencies: 6
-- Name: os; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.os (
    osetid character varying(50) NOT NULL,
    ossystemname character varying(150),
    vmid integer NOT NULL,
    installdate date NOT NULL
);


ALTER TABLE diskprint.os OWNER TO postgres;

--
-- TOC entry 1561 (class 1259 OID 20596)
-- Dependencies: 6
-- Name: processqueue; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.processqueue (
    location character varying(1023),
    slicehash character varying(127) NOT NULL
);


ALTER TABLE diskprint.processqueue OWNER TO postgres;

--
-- TOC entry 1562 (class 1259 OID 20602)
-- Dependencies: 1856 1857 1858 1859 1860 1861 1862 1863 1864 6
-- Name: regdelta; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.regdelta (
    osetid character varying(50) NOT NULL,
    appetid character varying(50) NOT NULL,
    sliceid integer NOT NULL,
    hiveid integer NOT NULL,
    cellaction integer NOT NULL,
    parentmtimebefore character varying(36) DEFAULT NULL::character varying,
    parentmtimeafter character varying(36) DEFAULT NULL::character varying,
    mtimebefore character varying(36) DEFAULT NULL::character varying,
    mtimeafter character varying(36) DEFAULT NULL::character varying,
    valuesha1before character varying(40) DEFAULT NULL::character varying,
    valuesha1after character varying(40) DEFAULT NULL::character varying,
    celltypebefore character varying(32) DEFAULT NULL::character varying,
    celltypeafter character varying(32) DEFAULT NULL::character varying,
    iskeybefore boolean DEFAULT true NOT NULL,
    iskeyafter boolean DEFAULT true NOT NULL,
    slicetype character varying(32) NOT NULL,
    cellpath character varying(1024) DEFAULT NULL::character varying
);


ALTER TABLE diskprint.regdelta OWNER TO postgres;

--
-- TOC entry 1563 (class 1259 OID 20617)
-- Dependencies: 6
-- Name: registry; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.registry (
    slicehash character varying(127) NOT NULL,
    regfilepath character varying(255) NOT NULL,
    regfilename character varying(255) NOT NULL,
    regfilehash character varying(127) NOT NULL
);


ALTER TABLE diskprint.registry OWNER TO postgres;

--
-- TOC entry 1564 (class 1259 OID 20623)
-- Dependencies: 6
-- Name: regresult; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.regresult (
    location character varying(255) NOT NULL,
    metadata character varying(255) NOT NULL,
    slicehash character varying(127) NOT NULL
);


ALTER TABLE diskprint.regresult OWNER TO postgres;

--
-- TOC entry 1565 (class 1259 OID 20629)
-- Dependencies: 6
-- Name: sha1; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.sha1 (
    keyhash character varying(64) NOT NULL,
    hashval character(40) NOT NULL
);


ALTER TABLE diskprint.sha1 OWNER TO postgres;

--
-- TOC entry 1566 (class 1259 OID 20632)
-- Dependencies: 1865 1866 1867 6
-- Name: slice; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

--AJN TODO Add slicestate and slicehash to the generating code, and remove vmmachineid.
--AJN TODO Check to see if slicetype 'Open' is being generated with a trailing whitespace in the string.
CREATE TABLE diskprint.slice (
    sliceid integer NOT NULL,
    slicetype character varying(32) DEFAULT 'Default'::character varying NOT NULL,
    osetid character varying(50) NOT NULL,
    appetid character varying(50) NOT NULL,
    creationdate timestamp without time zone DEFAULT now() NOT NULL,
    slicenotes character varying(1023) NOT NULL,
    slicestate character varying(127) DEFAULT 'latest'::character varying NOT NULL,
    slicehash character varying(127) NOT NULL
);


ALTER TABLE diskprint.slice OWNER TO postgres;


CREATE TABLE diskprint.slicelineage (
    slicehash character varying(127) NOT NULL,
    predecessor_slicehash character varying(127)
);


ALTER TABLE diskprint.slicelineage OWNER TO postgres;


CREATE TABLE diskprint.sequence (
    osetid character varying(50) NOT NULL,
    appetid character varying(50) NOT NULL,
    sequenceid integer NOT NULL,
    start_slicehash character varying(127) NOT NULL,
    end_slicehash character varying(127) NOT NULL
);


ALTER TABLE diskprint.sequence OWNER TO postgres;


CREATE SEQUENCE sequence_sequenceid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE diskprint.sequence_sequenceid_seq OWNER TO postgres;
ALTER SEQUENCE sequence_sequenceid_seq OWNED BY sequence.sequenceid;
ALTER TABLE sequence ALTER COLUMN sequenceid SET DEFAULT nextval('sequence_sequenceid_seq'::regclass);

--
-- TOC entry 1567 (class 1259 OID 20641)
-- Dependencies: 6 1566
-- Name: slice_sliceid_seq; Type: SEQUENCE; Schema: diskprint; Owner: postgres
--

CREATE SEQUENCE slice_sliceid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE diskprint.slice_sliceid_seq OWNER TO postgres;

--
-- TOC entry 1928 (class 0 OID 0)
-- Dependencies: 1567
-- Name: slice_sliceid_seq; Type: SEQUENCE OWNED BY; Schema: diskprint; Owner: postgres
--

ALTER SEQUENCE slice_sliceid_seq OWNED BY slice.sliceid;


--
-- TOC entry 1568 (class 1259 OID 20643)
-- Dependencies: 6
-- Name: slicestate; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.slicestate (
    type character varying(127) NOT NULL
);


ALTER TABLE diskprint.slicestate OWNER TO postgres;

--
-- TOC entry 1569 (class 1259 OID 20646)
-- Dependencies: 6
-- Name: slicetype; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.slicetype (
    type character varying(32) NOT NULL
);


ALTER TABLE diskprint.slicetype OWNER TO postgres;

--
-- TOC entry 1570 (class 1259 OID 20649)
-- Dependencies: 6
-- Name: storage; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.storage (
    location character varying(1023) NOT NULL,
    slicehash character varying(127) NOT NULL
);


ALTER TABLE diskprint.storage OWNER TO postgres;

--
-- TOC entry 1571 (class 1259 OID 20655)
-- Dependencies: 6
-- Name: virtualmachine; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.virtualmachine (
    vmid integer NOT NULL,
    vmappname character varying(127) NOT NULL,
    vmappversion character varying(127) NOT NULL
);


ALTER TABLE diskprint.virtualmachine OWNER TO postgres;

--
-- TOC entry 1572 (class 1259 OID 20658)
-- Dependencies: 6
-- Name: vmsetting; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.vmsetting (
    vminstancename character varying(127) NOT NULL,
    organization character varying(127) NOT NULL,
    sharing character varying(32),
    applicationmenu character varying(32),
    printers character varying(32),
    autoprotect character varying(32),
    sound character varying(32),
    usbdevice character varying(32),
    otherdevicesconnected character varying(32),
    advancedother character varying(127) NOT NULL,
    network character varying(32),
    cddvdconnected character varying(32),
    cddvdusediskimage character varying(127) NOT NULL,
    harddisktype character varying(127) NOT NULL,
    disksize character varying(32),
    preallocatediskspace character varying(32),
    split2gbfile character varying(32),
    vmid integer NOT NULL,
    osetid character varying(50) NOT NULL,
    startupdisk character varying(50) NOT NULL,
    display character varying(32) NOT NULL,
    processor character varying(32) NOT NULL,
    processorram character varying(32) NOT NULL,
    ossystemname character varying,
    installdate date
);


ALTER TABLE diskprint.vmsetting OWNER TO postgres;

--
-- TOC entry 1573 (class 1259 OID 20664)
-- Dependencies: 1868 6
-- Name: workjournal; Type: TABLE; Schema: diskprint; Owner: postgres; Tablespace: 
--

CREATE TABLE diskprint.workjournal (
    sliceid integer NOT NULL,
    statustime timestamp without time zone DEFAULT now() NOT NULL,
    workstatus character varying(32) NOT NULL,
    script character varying(128) NOT NULL,
    workerid character varying(128) NOT NULL,
    outputdir character varying(256) NOT NULL
);


ALTER TABLE diskprint.workjournal OWNER TO postgres;

--
-- TOC entry 1851 (class 2604 OID 20671)
-- Dependencies: 1552 1551
-- Name: actionid; Type: DEFAULT; Schema: diskprint; Owner: postgres
--

ALTER TABLE cell ALTER COLUMN actionid SET DEFAULT nextval('cell_actionid_seq'::regclass);


--
-- TOC entry 1852 (class 2604 OID 20672)
-- Dependencies: 1554 1553
-- Name: celltypeid; Type: DEFAULT; Schema: diskprint; Owner: postgres
--

ALTER TABLE celltype ALTER COLUMN celltypeid SET DEFAULT nextval('celltype_celltypeid_seq'::regclass);


--
-- TOC entry 1855 (class 2604 OID 20673)
-- Dependencies: 1557 1556
-- Name: hiveid; Type: DEFAULT; Schema: diskprint; Owner: postgres
--

ALTER TABLE hive ALTER COLUMN hiveid SET DEFAULT nextval('hive_hiveid_seq'::regclass);


--
-- TOC entry 1870 (class 2606 OID 20675)
-- Dependencies: 1551 1551
-- Name: cell_actionid_key; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cell
    ADD CONSTRAINT cell_actionid_key UNIQUE (actionid);


--
-- TOC entry 1872 (class 2606 OID 20677)
-- Dependencies: 1551 1551
-- Name: cell_actiontype_key; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cell
    ADD CONSTRAINT cell_actiontype_key UNIQUE (actiontype);


--
-- TOC entry 1874 (class 2606 OID 20679)
-- Dependencies: 1553 1553
-- Name: celltype_celltypeid_key; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY celltype
    ADD CONSTRAINT celltype_celltypeid_key UNIQUE (celltypeid);


--
-- TOC entry 1876 (class 2606 OID 20681)
-- Dependencies: 1553 1553
-- Name: celltype_typedesc_key; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY celltype
    ADD CONSTRAINT celltype_typedesc_key UNIQUE (typedesc);


--
-- TOC entry 1878 (class 2606 OID 29360)
-- Dependencies: 1555 1555 1555 1555 1555
-- Name: filemetadata_pkey; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY filemetadata
    ADD CONSTRAINT filemetadata_pkey PRIMARY KEY (slicehash, path, bytes, keyhash);


--
-- TOC entry 1880 (class 2606 OID 20683)
-- Dependencies: 1556 1556
-- Name: hive_hiveid_key; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hive
    ADD CONSTRAINT hive_hiveid_key UNIQUE (hiveid);


--
-- TOC entry 1882 (class 2606 OID 29154)
-- Dependencies: 1558 1558 1558
-- Name: md5_pkey; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY md5
    ADD CONSTRAINT md5_pkey PRIMARY KEY (keyhash, hashval);


--
-- TOC entry 1884 (class 2606 OID 20685)
-- Dependencies: 1559 1559
-- Name: netchatter_pkey; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY netchatter
    ADD CONSTRAINT netchatter_pkey PRIMARY KEY (slicehash);


--
-- TOC entry 1886 (class 2606 OID 20687)
-- Dependencies: 1560 1560
-- Name: os_etid_key; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY os
    ADD CONSTRAINT os_etid_key UNIQUE (osetid);


--
-- TOC entry 1888 (class 2606 OID 20689)
-- Dependencies: 1561 1561
-- Name: processqueue_pkey; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY processqueue
    ADD CONSTRAINT processqueue_pkey PRIMARY KEY (slicehash);


--
-- TOC entry 1890 (class 2606 OID 20691)
-- Dependencies: 1563 1563
-- Name: registry_pkey; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY registry
    ADD CONSTRAINT registry_pkey PRIMARY KEY (slicehash);


--
-- TOC entry 1892 (class 2606 OID 20693)
-- Dependencies: 1566 1566 1566 1566
-- Name: slice_pkey; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY slice
    ADD CONSTRAINT slice_pkey PRIMARY KEY (sliceid, osetid, appetid);


ALTER TABLE ONLY sequence
    ADD CONSTRAINT sequence_pkey PRIMARY KEY (osetid, appetid, start_slicehash, end_slicehash);

--
-- TOC entry 1894 (class 2606 OID 20695)
-- Dependencies: 1568 1568
-- Name: slicestate_type_key; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY slicestate
    ADD CONSTRAINT slicestate_type_key UNIQUE (type);


--
-- TOC entry 1896 (class 2606 OID 20697)
-- Dependencies: 1569 1569
-- Name: slicetype_type_key; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY slicetype
    ADD CONSTRAINT slicetype_type_key UNIQUE (type);


--
-- TOC entry 1898 (class 2606 OID 20699)
-- Dependencies: 1570 1570
-- Name: storage_pkey; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY storage
    ADD CONSTRAINT storage_pkey PRIMARY KEY (slicehash);


--
-- TOC entry 1900 (class 2606 OID 20701)
-- Dependencies: 1571 1571
-- Name: virtualmachine_virtualmachineid_key; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY virtualmachine
    ADD CONSTRAINT virtualmachine_virtualmachineid_key UNIQUE (vmid);


--
-- TOC entry 1902 (class 2606 OID 20703)
-- Dependencies: 1572 1572
-- Name: vmsetting_osetid_key; Type: CONSTRAINT; Schema: diskprint; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vmsetting
    ADD CONSTRAINT vmsetting_osetid_key UNIQUE (osetid);


--
-- TOC entry 1918 (class 2620 OID 20704)
-- Dependencies: 1570 18
-- Name: processtrigger; Type: TRIGGER; Schema: diskprint; Owner: postgres
--

CREATE TRIGGER processtrigger AFTER INSERT ON storage FOR EACH ROW EXECUTE PROCEDURE queueprocess();


--
-- TOC entry 1903 (class 2606 OID 29142)
-- Dependencies: 1555 1570 1897
-- Name: filemetadata_slicehash_fkey; Type: FK CONSTRAINT; Schema: diskprint; Owner: postgres
--

ALTER TABLE ONLY filemetadata
    ADD CONSTRAINT filemetadata_slicehash_fkey FOREIGN KEY (slicehash) REFERENCES storage(slicehash);

-- AJN TODO Silliness:  NULL is disallowed for storage(slicehash).  NULL is allowed in slicelineage.  This is a foreign key violation not caught until INSERT time.  Haven't googled the solution yet...
--ALTER TABLE ONLY slicelineage
--    ADD CONSTRAINT slicelineage_slicehash_fkey FOREIGN KEY (slicehash) REFERENCES storage(slicehash);

--ALTER TABLE ONLY slicelineage
--    ADD CONSTRAINT slicelineage_predecessor_slicehash_fkey FOREIGN KEY (predecessor_slicehash) REFERENCES storage(slicehash);

ALTER TABLE ONLY sequence
    ADD CONSTRAINT sequence_start_slicehash_fkey FOREIGN KEY (start_slicehash) REFERENCES storage(slicehash);

ALTER TABLE ONLY sequence
    ADD CONSTRAINT sequence_end_slicehash_fkey FOREIGN KEY (end_slicehash) REFERENCES storage(slicehash);

--
-- TOC entry 1904 (class 2606 OID 29098)
-- Dependencies: 1559 1897 1570
-- Name: netchatter_slicehash_fkey; Type: FK CONSTRAINT; Schema: diskprint; Owner: postgres
--

ALTER TABLE ONLY netchatter
    ADD CONSTRAINT netchatter_slicehash_fkey FOREIGN KEY (slicehash) REFERENCES storage(slicehash);


--
-- TOC entry 1905 (class 2606 OID 20705)
-- Dependencies: 1571 1899 1560
-- Name: os_vmid_fkey; Type: FK CONSTRAINT; Schema: diskprint; Owner: postgres
--

ALTER TABLE ONLY os
    ADD CONSTRAINT os_vmid_fkey FOREIGN KEY (vmid) REFERENCES virtualmachine(vmid);


--
-- TOC entry 1906 (class 2606 OID 20710)
-- Dependencies: 1551 1562 1869
-- Name: regdelta_cellaction_fkey; Type: FK CONSTRAINT; Schema: diskprint; Owner: postgres
--

ALTER TABLE ONLY regdelta
    ADD CONSTRAINT regdelta_sliceid_fkey FOREIGN KEY (sliceid, osetid, appetid) REFERENCES slice(sliceid, osetid, appetid);

ALTER TABLE ONLY regdelta
    ADD CONSTRAINT regdelta_cellaction_fkey FOREIGN KEY (cellaction) REFERENCES cell(actionid);


--
-- TOC entry 1907 (class 2606 OID 20715)
-- Dependencies: 1553 1873 1562
-- Name: regdelta_celltypeafter_fkey; Type: FK CONSTRAINT; Schema: diskprint; Owner: postgres
--

--AJN TODO The cell types are not yet fully enumerated, and I forget what they will be ultimately.  For now, the types are going into the regdelta table directly as strings.
--ALTER TABLE ONLY regdelta
--    ADD CONSTRAINT regdelta_celltypeafter_fkey FOREIGN KEY (celltypeafter) REFERENCES celltype(celltypeid);


--
-- TOC entry 1908 (class 2606 OID 20720)
-- Dependencies: 1553 1562 1873
-- Name: regdelta_celltypebefore_fkey; Type: FK CONSTRAINT; Schema: diskprint; Owner: postgres
--

--AJN TODO Ditto with celltypeafter.
--ALTER TABLE ONLY regdelta
--    ADD CONSTRAINT regdelta_celltypebefore_fkey FOREIGN KEY (celltypebefore) REFERENCES celltype(celltypeid);


--
-- TOC entry 1909 (class 2606 OID 20725)
-- Dependencies: 1879 1556 1562
-- Name: regdelta_hiveid_fkey; Type: FK CONSTRAINT; Schema: diskprint; Owner: postgres
--

ALTER TABLE ONLY regdelta
    ADD CONSTRAINT regdelta_hiveid_fkey FOREIGN KEY (hiveid) REFERENCES hive(hiveid);


--
-- TOC entry 1910 (class 2606 OID 20730)
-- Dependencies: 1895 1562 1569
-- Name: regdelta_slicetype_fkey; Type: FK CONSTRAINT; Schema: diskprint; Owner: postgres
--

ALTER TABLE ONLY regdelta
    ADD CONSTRAINT regdelta_slicetype_fkey FOREIGN KEY (slicetype) REFERENCES slicetype(type);


--
-- TOC entry 1911 (class 2606 OID 20735)
-- Dependencies: 1570 1897 1563
-- Name: registry_slicehash_fkey; Type: FK CONSTRAINT; Schema: diskprint; Owner: postgres
--

ALTER TABLE ONLY registry
    ADD CONSTRAINT registry_slicehash_fkey FOREIGN KEY (slicehash) REFERENCES storage(slicehash);


--
-- TOC entry 1912 (class 2606 OID 20740)
-- Dependencies: 1566 1885 1560
-- Name: slice_etid_fkey; Type: FK CONSTRAINT; Schema: diskprint; Owner: postgres
--

ALTER TABLE ONLY slice
    ADD CONSTRAINT slice_etid_fkey FOREIGN KEY (osetid) REFERENCES os(osetid);


--
-- TOC entry 1915 (class 2606 OID 29168)
-- Dependencies: 1566 1570 1897
-- Name: slice_slicehash_fkey; Type: FK CONSTRAINT; Schema: diskprint; Owner: postgres
--

ALTER TABLE ONLY slice
    ADD CONSTRAINT slice_slicehash_fkey FOREIGN KEY (slicehash) REFERENCES storage(slicehash);


--
-- TOC entry 1913 (class 2606 OID 20745)
-- Dependencies: 1566 1568 1893
-- Name: slice_slicestate_fkey; Type: FK CONSTRAINT; Schema: diskprint; Owner: postgres
--

ALTER TABLE ONLY slice
    ADD CONSTRAINT slice_slicestate_fkey FOREIGN KEY (slicestate) REFERENCES slicestate(type);


--
-- TOC entry 1914 (class 2606 OID 20750)
-- Dependencies: 1566 1569 1895
-- Name: slice_slicetype_fkey; Type: FK CONSTRAINT; Schema: diskprint; Owner: postgres
--

ALTER TABLE ONLY slice
    ADD CONSTRAINT slice_slicetype_fkey FOREIGN KEY (slicetype) REFERENCES slicetype(type);


--
-- TOC entry 1916 (class 2606 OID 20755)
-- Dependencies: 1572 1560 1885
-- Name: vmsetting_osetid_fkey; Type: FK CONSTRAINT; Schema: diskprint; Owner: postgres
--

ALTER TABLE ONLY vmsetting
    ADD CONSTRAINT vmsetting_osetid_fkey FOREIGN KEY (osetid) REFERENCES os(osetid);


--
-- TOC entry 1917 (class 2606 OID 20760)
-- Dependencies: 1572 1571 1899
-- Name: vmsetting_vmid_fkey; Type: FK CONSTRAINT; Schema: diskprint; Owner: postgres
--

ALTER TABLE ONLY vmsetting
    ADD CONSTRAINT vmsetting_vmid_fkey FOREIGN KEY (vmid) REFERENCES virtualmachine(vmid);


--
-- TOC entry 1923 (class 0 OID 0)
-- Dependencies: 6
-- Name: diskprint; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA diskprint FROM PUBLIC;
REVOKE ALL ON SCHEMA diskprint FROM postgres;
GRANT ALL ON SCHEMA diskprint TO postgres;
GRANT ALL ON SCHEMA diskprint TO PUBLIC;


--
-- TOC entry 1927 (class 0 OID 0)
-- Dependencies: 1566
-- Name: slice; Type: ACL; Schema: diskprint; Owner: postgres
--

REVOKE ALL ON TABLE slice FROM PUBLIC;
REVOKE ALL ON TABLE slice FROM postgres;
GRANT ALL ON TABLE slice TO postgres;


--
-- TOC entry 1929 (class 0 OID 0)
-- Dependencies: 1570
-- Name: storage; Type: ACL; Schema: diskprint; Owner: postgres
--

REVOKE ALL ON TABLE storage FROM PUBLIC;
REVOKE ALL ON TABLE storage FROM postgres;
GRANT ALL ON TABLE storage TO postgres;


-- Add permissions to diskprints for user diskprint_writer
GRANT ALL ON cell TO diskprint_writer;

GRANT ALL ON cell_actionid_seq      TO diskprint_writer;
GRANT ALL ON celltype               TO diskprint_writer;
GRANT ALL ON celltype_celltypeid_seq TO diskprint_writer;
GRANT ALL ON filemetadata           TO diskprint_writer;
GRANT ALL ON hive                   TO diskprint_writer;
GRANT ALL ON hive_hiveid_seq        TO diskprint_writer;
GRANT ALL ON md5                    TO diskprint_writer;
GRANT ALL ON netchatter             TO diskprint_writer;
GRANT ALL ON os                     TO diskprint_writer;
GRANT ALL ON processqueue           TO diskprint_writer;
GRANT ALL ON regdelta               TO diskprint_writer;
GRANT ALL ON registry               TO diskprint_writer;
GRANT ALL ON regresult              TO diskprint_writer;
GRANT ALL ON sequence               TO diskprint_writer;
GRANT ALL ON sequence_sequenceid_seq TO diskprint_writer;
GRANT ALL ON sha1                   TO diskprint_writer;
GRANT ALL ON slice                  TO diskprint_writer;
GRANT ALL ON slice_sliceid_seq      TO diskprint_writer;
GRANT ALL ON slicelineage           TO diskprint_writer;
GRANT ALL ON slicestate             TO diskprint_writer;
GRANT ALL ON slicetype              TO diskprint_writer;
GRANT ALL ON storage                TO diskprint_writer;
GRANT ALL ON virtualmachine         TO diskprint_writer;
GRANT ALL ON vmsetting              TO diskprint_writer;
GRANT ALL ON workjournal            TO diskprint_writer;


-- Completed on 2013-02-11 13:57:33 EST

--
-- PostgreSQL database dump complete
--

