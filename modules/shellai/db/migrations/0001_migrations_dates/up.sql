-- 0001_migrations_dates
--
-- Add triggets to the "migration" table to update "started_at" and
-- "finished_at" columns when a migration is started (created) and finished
-- (updated) respectively

BEGIN TRANSACTION;

DROP TRIGGER IF EXISTS _migrations_update_started_at; 
CREATE TRIGGER _migrations_update_started_at
AFTER INSERT ON _migrations 
WHEN NEW.status = 'pending'
BEGIN
    UPDATE _migrations
    SET started_at = CURRENT_TIMESTAMP
    WHERE name = NEW.name;
END;

DROP TRIGGER IF EXISTS _migrations_update_finished_at;
CREATE TRIGGER _migrations_update_finished_at
AFTER UPDATE OF status ON _migrations
WHEN NEW.status = 'applied'
BEGIN
    UPDATE _migrations
    SET finished_at = CURRENT_TIMESTAMP
    WHERE name = NEW.name;
END;

COMMIT;

