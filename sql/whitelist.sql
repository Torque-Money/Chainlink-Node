-- Whitelist requesters
UPDATE direct_request_specs SET requesters='0x291252c3A4D5cF22D9089389dfd4bE0B583C03F4' WHERE type ='runlog';

SELECT * FROM direct_request_specs;