BEGIN TRANSACTION;

ALTER TABLE Messages DROP COLUMN role;

COMMIT;
