# Epic 126321 - Database Tests (pgTAP)

These tests assert presence of tables, columns, constraints, and auth-related functions.

Files:
- 001_users_schema.sql
- 002_otp_table.sql
- 003_functions_auth.sql

Running locally:
1. Install pgTAP in your PostgreSQL instance.
2. Ensure psql can connect to the target database (env variables like PGHOST, PGUSER, PGPASSWORD, PGDATABASE).
3. Run:
   psql -v "ON_ERROR_STOP=1" -f tests/pg_tap/run_all.sql

CI guidance:
- Use a PostgreSQL service container.
- Load pgTAP extension.
- Execute the same psql command as above; fail the pipeline on non-zero exit.

Note:
These are initial failing tests to drive schema and function implementation aligned with:
kavia-docs/TestCases_Epic_126321_User_Registration_and_Authentication.md
