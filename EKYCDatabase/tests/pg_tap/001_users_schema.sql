-- Epic 126321 - Database tests: users schema
-- Reference: kavia-docs/TestCases_Epic_126321_User_Registration_and_Authentication.md
-- These tests will fail until schema exists.

BEGIN;

SELECT plan(15);

-- Users table existence
SELECT has_table('public', 'users', 'users table exists');

-- Column types
SELECT col_type_is('public', 'users', 'id', 'uuid', 'users.id is uuid');
SELECT col_type_is('public', 'users', 'mobile', 'text', 'users.mobile is text');
SELECT col_type_is('public', 'users', 'email', 'text', 'users.email is text');
SELECT col_type_is('public', 'users', 'password_hash', 'text', 'users.password_hash is text');
SELECT col_type_is('public', 'users', 'verified_mobile', 'boolean', 'users.verified_mobile is boolean');
SELECT col_type_is('public', 'users', 'verified_email', 'boolean', 'users.verified_email is boolean');
SELECT col_type_is('public', 'users', 'created_at', 'timestamp with time zone', 'users.created_at is timestamptz');
SELECT col_type_is('public', 'users', 'updated_at', 'timestamp with time zone', 'users.updated_at is timestamptz');

-- Constraints
SELECT has_constraint('public', 'users', 'users_mobile_unique', 'unique mobile');
SELECT has_constraint('public', 'users', 'users_email_unique', 'unique email');

-- Indexes
SELECT has_index('public', 'users', 'users_mobile_idx', 'index on mobile');
SELECT has_index('public', 'users', 'users_email_idx', 'index on email');

SELECT finish();

ROLLBACK;
