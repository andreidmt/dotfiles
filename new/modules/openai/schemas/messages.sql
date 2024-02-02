-- sqlite3 schema.sql

CREATE TABLE IF NOT EXISTS Messages (
  id INTEGER PRIMARY KEY,
  conversations_id INTEGER NOT NULL,
  users_id INTEGER NOT NULL,
  embeddings_id INTEGER,
  content TEXT NOT NULL,
  model TEXT,
  temperature REAL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (conversations_id) REFERENCES Conversations(id),
  FOREIGN KEY (users_id) REFERENCES Users(id),
  FOREIGN KEY (embeddings_id) REFERENCES Embeddings(id)
);

CREATE INDEX idx_conversations_id ON Messages (conversations_id);
CREATE INDEX idx_users_id ON Messages (users_id);
CREATE INDEX idx_embeddings_id ON Messages (embeddings_id);

CREATE TABLE IF NOT EXISTS Embeddings (
  id INTEGER PRIMARY KEY,
  model TEXT NOT NULL,
  data TEXT NOT NULL,
  token_count INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Cache the number of messages in a Conversation
CREATE TRIGGER increment_message_count
AFTER INSERT ON messages
BEGIN
    UPDATE Conversations
    SET messages_count = messages_count + 1
    WHERE id = NEW.conversations_id;
END;

-- Trigger to decrement count on message delete
CREATE TRIGGER decrement_message_count
AFTER DELETE ON messages
BEGIN
    UPDATE Conversations
    SET messages_count = messages_count - 1
    WHERE id = OLD.conversations_id;
END;
