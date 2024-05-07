BEGIN TRANSACTION;

DROP TRIGGER IF EXISTS conversations_updated_at_trigger;
DROP TRIGGER IF EXISTS messages_updated_at_trigger;
DROP TRIGGER IF EXISTS users_updated_at_trigger;
DROP TRIGGER IF EXISTS settings_updated_at_trigger;

COMMIT;

