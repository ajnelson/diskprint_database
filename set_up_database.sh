#!/bin/sh

# Run all setup SQL scripts to create the Diskprint Postgres database.
#
# This runs simplest as the Postgres shell user (e.g. 'sudo -u postgres $0').

psql -U postgres -f 00_load_diskprintdb.sql
psql -U postgres -d diskprints -f 01_load_enumerated.sql
psql -U postgres -d diskprints -f 02-load-first-os-slice.sql
