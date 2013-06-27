11/16/12

This repository holds the initial load scripts for the diskprint database. 

`00_load_diskprintdb.sql` - schema for the diskprint database
`01_load_emunerated.sql` - populates the enumerated tables
`02-load-first-os-slice.sql` - populates the tables holding OS and VM data. This data is collected when creating a baseline OS.
`set_up_database.sh` - Shell script that runs the above SQL scripts.


## Configuring

Your Postgres database should have a user `diskprint_writer`.  Or, you should replace occurrences of `diskprint_writer` in `00_load_diskprintdb.sql` with the database account that will be ingesting data.
