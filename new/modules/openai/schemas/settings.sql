CREATE TABLE IF NOT EXISTS Settings (
  key TEXT PRIMARY KEY,
  value TEXT, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Settings (key, value) VALUES
  ('active-conversation-id', NULL);

INSERT INTO Settings (key, value) VALUES
  ('main-agent-id', 2);
