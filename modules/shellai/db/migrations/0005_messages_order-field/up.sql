BEGIN TRANSACTION;

-- Add `order` field to Messages
ALTER TABLE Messages 
  ADD COLUMN "order" INTEGER NOT NULL DEFAULT 0;

-- Update `order` field to Messages based on created_at and conversations_id
WITH RankedMessages AS (
  SELECT
    id,
    ROW_NUMBER() OVER(PARTITION BY conversations_id ORDER BY created_at ASC) - 1 AS new_order
  FROM Messages
)
UPDATE Messages
SET "order" = (
  SELECT new_order
  FROM RankedMessages
  WHERE Messages.id = RankedMessages.id
);

-- Auto increment `order` field to Messages based on conversations_id
DROP TRIGGER IF EXISTS messages_onCreate_order_trigger;
CREATE TRIGGER messages_onCreate_order_trigger AFTER INSERT ON Messages
BEGIN
  UPDATE Messages
  SET "order" = (SELECT IFNULL(MAX("order"), -1) + 1 FROM Messages WHERE conversations_id = NEW.conversations_id)
  WHERE id = NEW.id;
END;

COMMIT;

