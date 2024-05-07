-- 0002_triggers_updated-at
--
-- Add "updated_at" trigger to all tables. Whenever any field is updated inside
-- a record, the "updated_at" date column is updated. This unburdens the
-- application from having update the timestamp manually.

BEGIN TRANSACTION;

-- Conversations
DROP TRIGGER IF EXISTS conversations_updated_at_trigger;
CREATE TRIGGER conversations_updated_at_trigger AFTER UPDATE ON Conversations
BEGIN
  UPDATE Conversations SET updated_at = CURRENT_TIMESTAMP WHERE id = new.id;
END;

-- Messages
DROP TRIGGER IF EXISTS messages_updated_at_trigger;
CREATE TRIGGER messages_updated_at_trigger AFTER UPDATE ON Messages
BEGIN
  UPDATE Messages SET updated_at = CURRENT_TIMESTAMP WHERE id = new.id;
END;

-- Users
DROP TRIGGER IF EXISTS users_updated_at_trigger;
CREATE TRIGGER users_updated_at_trigger AFTER UPDATE ON Users
BEGIN
  UPDATE Users SET updated_at = CURRENT_TIMESTAMP WHERE id = new.id;
END;

-- Settings
DROP TRIGGER IF EXISTS settings_updated_at_trigger;
CREATE TRIGGER settings_updated_at_trigger AFTER UPDATE ON Settings
BEGIN
  UPDATE Settings SET updated_at = CURRENT_TIMESTAMP WHERE key = new.key;
END;

COMMIT;

