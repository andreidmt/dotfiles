BEGIN TRANSACTION;

UPDATE Messages
SET role = 'system_main-agent-mission'
WHERE role = 'system';

COMMIT;

