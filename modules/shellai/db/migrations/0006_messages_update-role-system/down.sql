BEGIN TRANSACTION;

UPDATE Messages
SET role = 'system'
WHERE role = 'system_main-agent-mission';

COMMIT;

