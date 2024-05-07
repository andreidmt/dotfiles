CREATE TABLE IF NOT EXISTS _event_log (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  -- The event that occurred: create, update, delete
  event TEXT,
  -- The table that the event occurred on
  table_name TEXT,
  -- The old and new data for the row
  old_data TEXT,
  new_data TEXT,
  -- The date and time the event occurred
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
