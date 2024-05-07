CREATE TABLE IF NOT EXISTS Conversations (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  main_agent_id INTEGER NOT NULL,
  title TEXT NOT NULL DEFAULT 'Untitled',
  token_count INTEGER NOT NULL DEFAULT 0,
  messages_count INTEGER NOT NULL DEFAULT 0,
  users_count INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (main_agent_id) REFERENCES Users(id)
);

-- Push an event to the _event_log table when a new conversation is created
CREATE TRIGGER IF NOT EXISTS conversations_event_log_insert_trigger AFTER INSERT ON Conversations
BEGIN
  INSERT INTO _event_log (event, table_name, old_data, new_data)
  VALUES ('create', 'Conversations', NULL,  
    json_object(
      'id', new.id, 
      'title', new.title, 
      'token_count', new.token_count, 
      'messages_count', new.messages_count, 
      'users_count', new.users_count, 
      'created_at', new.created_at, 
      'updated_at', new.updated_at
    )
  );
END;

-- Push an event to the _event_log table when a conversation is updated
CREATE TRIGGER IF NOT EXISTS conversations_event_log_update_trigger AFTER UPDATE ON Conversations
BEGIN
  INSERT INTO _event_log (event, table_name, old_data, new_data)
  VALUES ('update', 'Conversations', 
    json_object(
      'id', old.id, 
      'title', old.title, 
      'token_count', old.token_count, 
      'messages_count', old.messages_count, 
      'users_count', old.users_count, 
      'created_at', old.created_at, 
      'updated_at', old.updated_at
    ), 
    json_object(
      'id', new.id, 
      'title', new.title, 
      'token_count', new.token_count, 
      'messages_count', new.messages_count, 
      'users_count', new.users_count, 
      'created_at', new.created_at, 
      'updated_at', new.updated_at
    )
  );
END;

-- Push an event to the _event_log table when a conversation is deleted
CREATE TRIGGER IF NOT EXISTS conversations_event_log_delete_trigger AFTER DELETE ON Conversations
BEGIN
  INSERT INTO _event_log (event, table_name, old_data, new_data)
  VALUES ('delete', 'Conversations', 
    json_object(
      'id', old.id, 
      'title', old.title, 
      'token_count', old.token_count, 
      'messages_count', old.messages_count, 
      'users_count', old.users_count, 
      'created_at', old.created_at, 
      'updated_at', old.updated_at
    ), 
    NULL
  );
END;
