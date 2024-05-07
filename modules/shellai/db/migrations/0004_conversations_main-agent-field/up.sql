BEGIN TRANSACTION;

-- Add `main_agent_id` field to Conversations
ALTER TABLE Conversations 
  ADD COLUMN main_agent_id INTEGER NOT NULL DEFAULT 2 REFERENCES Users(id);

COMMIT;

