CREATE TABLE IF NOT EXISTS Settings (
  key TEXT PRIMARY KEY,
  value TEXT, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Push an event to the _event_log table when a new setting is created
CREATE TRIGGER IF NOT EXISTS settings_event_log_insert_trigger
AFTER INSERT ON Settings
BEGIN
  INSERT INTO _event_log (event, table_name, old_data, new_data) 
  VALUES ('create', 'Settings', null, 
    json_object(
      'key', new.key, 
      'value', new.value, 
      'created_at', new.created_at, 
      'updated_at', new.updated_at
    )
  ); 
END;

-- Push an event to the _event_log table when a setting is updated
CREATE TRIGGER IF NOT EXISTS settings_event_log_update_trigger
AFTER UPDATE ON Settings
BEGIN
  INSERT INTO _event_log (event, table_name, old_data, new_data) 
  VALUES ('update', 'Settings', 
    json_object(
      'key', old.key, 
      'value', old.value, 
      'created_at', old.created_at, 
      'updated_at', old.updated_at
    ), 
    json_object(
      'key', new.key, 
      'value', new.value, 
      'created_at', new.created_at, 
      'updated_at', new.updated_at
    )
  ); 
END;

-- Push an event to the _event_log table when a setting is deleted
CREATE TRIGGER IF NOT EXISTS settings_event_log_delete_trigger
AFTER DELETE ON Settings
BEGIN
  INSERT INTO _event_log (event, table_name, old_data, new_data) 
  VALUES ('delete', 'Settings', 
    json_object(
      'key', old.key, 
      'value', old.value, 
      'created_at', old.created_at, 
      'updated_at', old.updated_at
    ), 
    null
  ); 
END;

