BEGIN TRANSACTION;

-- Remove the column
ALTER TABLE Conversations 
DROP COLUMN main_agent_id;

COMMIT;

