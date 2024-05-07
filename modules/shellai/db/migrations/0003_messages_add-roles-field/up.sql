-- Add new nullable "role" column to Messages table

BEGIN TRANSACTION;

ALTER TABLE Messages ADD COLUMN role TEXT;

COMMIT;

