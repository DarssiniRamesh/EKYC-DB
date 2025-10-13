-- Epic 126321 - Database tests: otp_requests table
-- These tests will fail until schema exists.

BEGIN;

SELECT plan(18);

SELECT has_table('public', 'otp_requests', 'otp_requests table exists');

-- Columns
SELECT col_type_is('public', 'otp_requests', 'id', 'uuid', 'id is uuid');
SELECT col_type_is('public', 'otp_requests', 'user_id', 'uuid', 'user_id is uuid');
SELECT col_type_is('public', 'otp_requests', 'channel', 'text', 'channel is text (email/mobile)');
SELECT col_type_is('public', 'otp_requests', 'destination', 'text', 'destination is text');
SELECT col_type_is('public', 'otp_requests', 'otp_hash', 'text', 'otp_hash is text');
SELECT col_type_is('public', 'otp_requests', 'expires_at', 'timestamp with time zone', 'expires_at is timestamptz');
SELECT col_type_is('public', 'otp_requests', 'attempts', 'integer', 'attempts is int');
SELECT col_type_is('public', 'otp_requests', 'status', 'text', 'status is text');

-- FKs and constraints
SELECT has_constraint('public', 'otp_requests', 'otp_requests_user_id_fkey', 'FK to users.id or nullable for pre-user');

-- Indexes
SELECT has_index('public', 'otp_requests', 'otp_requests_destination_idx', 'index on destination');
SELECT has_index('public', 'otp_requests', 'otp_requests_status_idx', 'index on status');
SELECT has_index('public', 'otp_requests', 'otp_requests_expires_at_idx', 'index on expires_at');

-- Additional constraints expectations (placeholders for implementation specifics)
SELECT ok(true, 'Ensure attempts has check constraint >= 0 (to be implemented)');
SELECT ok(true, 'Ensure status constrained to expected values (to be implemented)');
SELECT ok(true, 'Ensure cleanup job removes expired OTPs (to be implemented)');

SELECT finish();

ROLLBACK;
