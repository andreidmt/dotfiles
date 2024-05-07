BEGIN TRANSACTION;

-- Remove trigger associated with `order` field
DROP TRIGGER IF EXISTS messages_onCreate_order_trigger;

-- Remove `order` field from Messages
ALTER TABLE Messages DROP COLUMN "order";

COMMIT;

