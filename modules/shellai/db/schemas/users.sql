CREATE TABLE IF NOT EXISTS Users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  is_ai BOOLEAN NOT NULL,

  -- Information abou the user/agent that will be set as system metadata
  -- in OpenAI's API conversation calls.
  mission TEXT,

  model TEXT, 
  temperature REAL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Push an event to the _event_log table when a new user is created. 
CREATE TRIGGER IF NOT EXISTS users_event_log_insert_trigger AFTER INSERT ON Users
BEGIN
  INSERT INTO _event_log (event, table_name, old_data, new_data)
  VALUES ('create', 'Users', NULL,  
    json_object(
      'id', new.id, 
      'slug', new.slug, 
      'name', new.name, 
      'is_ai', new.is_ai, 
      'mission', new.mission, 
      'model', new.model, 
      'temperature', new.temperature, 
      'created_at', new.created_at, 
      'updated_at', new.updated_at
    )
  );
END;

-- Push an event to the _event_log table when a user is updated
CREATE TRIGGER IF NOT EXISTS users_event_log_update_trigger AFTER UPDATE ON Users
BEGIN
  INSERT INTO _event_log (event, table_name, old_data, new_data)
  VALUES ('update', 'Users', 
    json_object(
      'id', old.id, 
      'slug', old.slug, 
      'name', old.name, 
      'is_ai', old.is_ai, 
      'mission', old.mission, 
      'model', old.model, 
      'temperature', old.temperature, 
      'created_at', old.created_at, 
      'updated_at', old.updated_at
    ), 
    json_object(
      'id', new.id, 
      'slug', new.slug, 
      'name', new.name, 
      'is_ai', new.is_ai, 
      'mission', new.mission, 
      'model', new.model, 
      'temperature', new.temperature, 
      'created_at', new.created_at, 
      'updated_at', new.updated_at
    )
  );
END;

-- Push an event to the _event_log table when a user is deleted
CREATE TRIGGER IF NOT EXISTS users_event_log_delete_trigger AFTER DELETE ON Users
BEGIN
  INSERT INTO _event_log (event, table_name, old_data, new_data)
  VALUES ('delete', 'Users', 
    json_object(
      'id', old.id, 
      'slug', old.slug, 
      'name', old.name, 
      'is_ai', old.is_ai, 
      'mission', old.mission, 
      'model', old.model, 
      'temperature', old.temperature, 
      'created_at', old.created_at, 
      'updated_at', old.updated_at
    ), 
    NULL
  );
END;

