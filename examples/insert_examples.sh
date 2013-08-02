#!/bin/sh

# Run all example SQL scripts to insert test data

psql -U postgres -d diskprints -f storage.sql
psql -U postgres -d diskprints -f slice.sql
