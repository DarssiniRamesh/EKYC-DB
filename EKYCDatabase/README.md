# EKYC Database

pgTAP tests for Epic 126321 are in tests/pg_tap.

Run:
- psql -v "ON_ERROR_STOP=1" -f tests/pg_tap/run_all.sql

Tests will fail until required schema and functions exist.
