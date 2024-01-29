CREATE TABLE IF NOT EXISTS Settings (
  id INTEGER PRIMARY KEY,
  key TEXT NOT NULL UNIQUE,
  value TEXT, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Settings (key, value) VALUES
  ('current-conversation-id', NULL);

INSERT INTO Settings (key, value) VALUES
  ('default-agent-id', 2);
