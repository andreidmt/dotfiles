CREATE TABLE IF NOT EXISTS _migrations (
  -- Name of the migration file, sorting will give us the order of execution
  name TEXT PRIMARY KEY,

  -- Available values: pending, applied
  status TEXT,

  -- Timestamps for when the migration was started and finished
  started_at DATETIME DEFAULT NULL,
  finished_at DATETIME DEFAULT NULL
);

CREATE TRIGGER _migrations_update_started_at
AFTER INSERT ON _migrations 
WHEN NEW.status = 'pending'
BEGIN
    UPDATE _migrations
    SET started_at = CURRENT_TIMESTAMP
    WHERE name = NEW.name;
END;

CREATE TRIGGER _migrations_update_finished_at
AFTER UPDATE OF status ON _migrations
WHEN NEW.status = 'applied'
BEGIN
    UPDATE _migrations
    SET finished_at = CURRENT_TIMESTAMP
    WHERE name = NEW.name;
END;
