--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_TYRE', 'MINOR_CIV_SIDON', 'MINOR_CIV_BYBLOS');

CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_MC_PHOENICIA',					36,		52,		null,	null);
			
INSERT INTO MinorCiv_YagemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_TYRE',							27,		50,		null,	null), -- Cyrene
			('MINOR_CIV_SIDON',							33,		57,		null,	null), -- Galatia
			('MINOR_CIV_BYBLOS',						21,		53,		null,	null); -- Syracuse
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_TYRE', 'MINOR_CIV_SIDON', 'MINOR_CIV_BYBLOS');

CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_MC_PHOENICIA',					72,		49,		null,	null);
			
INSERT INTO MinorCiv_YahemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_TYRE',							66,		48,		null,	null), -- Cyrene
			('MINOR_CIV_SIDON',							70,		52,		null,	null), -- Galatia
			('MINOR_CIV_BYBLOS',						61,		51,		null,	null); -- Syracuse
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_TYRE', 'MINOR_CIV_SIDON', 'MINOR_CIV_BYBLOS');

CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_MC_PHOENICIA',					47,		21,		null,	null);
			
INSERT INTO MinorCiv_CordiformStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_TYRE',							41,		19,		null,	null), -- Cyrene
			('MINOR_CIV_SIDON',							46,		23,		null,	null), -- Galatia
			('MINOR_CIV_BYBLOS',						37,		21,		null,	null); -- Syracuse
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_TYRE', 'MINOR_CIV_SIDON', 'MINOR_CIV_BYBLOS');

CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_MC_PHOENICIA',					62,		39,		null,	null);
			
INSERT INTO MinorCiv_GreatestEarthStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_TYRE',							53,		35,		null,	null), -- Cyrene
			('MINOR_CIV_SIDON',							60,		43,		null,	null), -- Galatia
			('MINOR_CIV_BYBLOS',						50,		38,		null,	null); -- Syracuse
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_MC_PHOENICIA'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ASSYRIA';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_MC_PHOENICIA'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ASSYRIA';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_MC_PHOENICIA'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ASSYRIA';
--==========================================================================================================================
--==========================================================================================================================