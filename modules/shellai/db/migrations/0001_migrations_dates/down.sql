BEGIN TRANSACTION;

DROP TRIGGER IF EXISTS _migrations_update_started_at;
DROP TRIGGER IF EXISTS _migrations_update_finished_at;

COMMIT;

