-- Epic 126321 - Database tests: auth functions/triggers existence
-- These are placeholders to guide implementation and will fail until created.

BEGIN;

SELECT plan(9);

-- Password hashing trigger on users
SELECT has_function('public', 'set_password_hash(text)', 'function set_password_hash exists');
SELECT has_function('public', 'check_password_strength(text)', 'function check_password_strength exists');
SELECT has_trigger('public', 'users', 'users_password_hash_trg', 'trigger to hash password on insert/update exists');

-- OTP cleanup routine
SELECT has_function('public', 'cleanup_expired_otps()', 'function to cleanup expired OTPs exists');
SELECT has_schedule IS NOT NULL FROM (VALUES (1)) AS t(dummy); -- Placeholder for scheduler existence in CI

-- Audit logging
SELECT has_table('public', 'audit_logs', 'audit_logs table exists for compliance');
SELECT col_type_is('public', 'audit_logs', 'id', 'uuid', 'audit_logs.id is uuid');
SELECT has_function('public', 'log_consent_event(uuid, text)', 'function to log consent events exists');

SELECT finish();

ROLLBACK;
