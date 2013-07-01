# Diskprint database

This repository holds the initial load scripts for the diskprint database. 

* `00_load_diskprintdb.sql` - Schema for the diskprint database.
* `01_load_emunerated.sql` - Populates the enumerated tables.
* `02-load-first-os-slice.sql` - Populates the tables holding OS and VM data. This data is collected when creating a baseline OS.
* `set_up_diskprint_database.sh` - Shell script that runs the above SQL scripts.
* `set_up_postgres.md` - Human script to set up a Postgres server.
* `examples/` - Sample SQL statements for populating database tables.


## Configuring

Your Postgres database should have a user `diskprint_writer`.  Or, you should replace occurrences of `diskprint_writer` in `00_load_diskprintdb.sql` with the database account that will be ingesting data.

If you are unfamiliar with Postgres administration, the document `set_up_postgres.md` gives sufficient instructions for a test virtual machine or semi-isolated server.


## Priming with data

At times, you may have data on a separate server you want to move to another (particularly a testing-to-production migration).  If bootstrapping a database with virtual machine data, first populate `storage`, then populate `slice`.  To get populating data from database DEVDB, run these commands:

    pg_dump -U postgres --data-only --schema=diskprint --table=diskprint.storage DEVDB >storage.sql
    pg_dump -U postgres --data-only --schema=diskprint --table=diskprint.slice DEVDB >slice.sql

Importing in the target database is then (run on the target server):

    psql -U postgres diskprints -f storage.sql
    psql -U postgres diskprints -f slice.sql
