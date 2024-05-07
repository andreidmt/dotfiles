CREATE TABLE IF NOT EXISTS Messages (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  conversations_id INTEGER NOT NULL,
  users_id INTEGER NOT NULL,
  embeddings_id INTEGER,
  content TEXT NOT NULL,
  role TEXT NOT NULL,
  weight INTEGER NOT NULL DEFAULT 0,
  model TEXT,
  temperature REAL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (conversations_id, weight),
  FOREIGN KEY (conversations_id) REFERENCES Conversations(id),
  FOREIGN KEY (users_id) REFERENCES Users(id),
  FOREIGN KEY (embeddings_id) REFERENCES Embeddings(id)
);

CREATE INDEX idx_conversations_id ON Messages (conversations_id);
CREATE INDEX idx_users_id ON Messages (users_id);
CREATE INDEX idx_embeddings_id ON Messages (embeddings_id);

-- Increment "messages_count" on message INSERT
CREATE TRIGGER increment_message_count
AFTER INSERT ON Messages
BEGIN
    UPDATE Conversations
    SET messages_count = messages_count + 1
    WHERE id = NEW.conversations_id;
END;

-- Decrement "messages_count" on message DELETE
CREATE TRIGGER decrement_message_count
AFTER DELETE ON Messages
BEGIN
    UPDATE Conversations
    SET messages_count = messages_count - 1
    WHERE id = OLD.conversations_id;
END;

-- Push an event to the _event_log table when a new message is created
CREATE TRIGGER IF NOT EXISTS messages_event_log_insert_trigger AFTER INSERT ON Messages
BEGIN
  INSERT INTO _event_log (event, table_name, old_data, new_data)
  VALUES ('create', 'Messages', NULL,  
    json_object(
      'id', new.id, 
      'conversations_id', new.conversations_id, 
      'users_id', new.users_id, 
      'embeddings_id', new.embeddings_id, 
      'content', new.content, 
      'model', new.model, 
      'temperature', new.temperature, 
      'created_at', new.created_at, 
      'updated_at', new.updated_at
    )
  );
END;

-- Push an event to the _event_log table when a message is updated
CREATE TRIGGER IF NOT EXISTS messages_event_log_update_trigger AFTER UPDATE ON Messages
BEGIN
  INSERT INTO _event_log (event, table_name, old_data, new_data)
  VALUES ('update', 'Messages', 
    json_object(
      'id', old.id, 
      'conversations_id', old.conversations_id, 
      'users_id', old.users_id, 
      'embeddings_id', old.embeddings_id, 
      'content', old.content, 
      'model', old.model, 
      'temperature', old.temperature, 
      'created_at', old.created_at, 
      'updated_at', old.updated_at
    ), 
    json_object(
      'id', new.id, 
      'conversations_id', new.conversations_id, 
      'users_id', new.users_id, 
      'embeddings_id', new.embeddings_id, 
      'content', new.content, 
      'model', new.model, 
      'temperature', new.temperature, 
      'created_at', new.created_at, 
      'updated_at', new.updated_at
    )
  );
END;

-- Push an event to the _event_log table when a message is deleted
CREATE TRIGGER IF NOT EXISTS messages_event_log_delete_trigger AFTER DELETE ON Messages
BEGIN
  INSERT INTO _event_log (event, table_name, old_data, new_data)
  VALUES ('delete', 'Messages', 
    json_object(
      'id', old.id, 
      'conversations_id', old.conversations_id, 
      'users_id', old.users_id, 
      'embeddings_id', old.embeddings_id, 
      'content', old.content, 
      'model', old.model, 
      'temperature', old.temperature, 
      'created_at', old.created_at, 
      'updated_at', old.updated_at
    ), 
    NULL
  );
END;

