--Major
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_AKKADIAN_MOD',			   45,	   48,		null,	null);	

CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_AKKADIAN_MOD'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_BABYLON';
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_AKKADIAN_MOD',			   77,	   48,		null,	null);	

CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_AKKADIAN_MOD'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_BABYLON';	
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_AKKADIAN_MOD',			   51,	   20,		null,	null);

CREATE TABLE IF NOT EXISTS Civilizations_CordiformRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CordiformRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_AKKADIAN_MOD'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_CordiformRequestedResource WHERE Type = 'CIVILIZATION_BABYLON';
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_AKKADIAN_MOD',			   67,	   38,		null,	null);

CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_AKKADIAN_MOD'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_BABYLON';
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_AKKADIAN_MOD',			   77,	   14,		null,	null);

CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_AKKADIAN_MOD'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_BABYLON';
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type,										 X,		 Y,		AltX,	AltY)
VALUES		('CIVILIZATION_AKKADIAN_MOD',			   164,		10,		null,	null);

CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_AKKADIAN_MOD'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_BABYLON';
--==========================================================================================================================
-- Civilizations_MesopotamiaStartPosition (Mesopotamia)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MesopotamiaStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_AKKADIAN_MOD',		   59,	   21,		null,	null);

CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MesopotamiaRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_AKKADIAN_MOD'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MesopotamiaRequestedResource WHERE Type = 'CIVILIZATION_BABYLON';

--Minor
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);	

DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_UR');		
INSERT INTO MinorCiv_YagemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_UR',						   10,	   81,		null,	null); -- Skara Brae
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);

DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_UR');		
INSERT INTO MinorCiv_YahemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_UR',						   54,	   69,		null,	null); -- Skara Brae
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);

DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_UR');		
INSERT INTO MinorCiv_CordiformStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_UR',						   34,	   38,		null,	null); -- Skara Brae
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);

DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_UR');	
INSERT INTO MinorCiv_GreatestEarthStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_UR',						   38,	   62,		null,	null); -- Skara Brae
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeStartPosition(Type, X, Y, AltX, AltY);

DELETE FROM MinorCiv_EuroLargeStartPosition WHERE Type IN ('MINOR_CIV_UR');		
INSERT INTO MinorCiv_EuroLargeStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_UR',						   24,	   63,		null,	null); -- Skara Brae
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_EuroGiantStartPosition(Type, X, Y, AltX, AltY);

DELETE FROM MinorCiv_EuroGiantStartPosition WHERE Type IN ('MINOR_CIV_UR');		
INSERT INTO MinorCiv_EuroGiantStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_UR',						   43,	   98,		null,	null); -- Skara Brae
--==========================================================================================================================
-- Civilizations_MesopotamiaStartPosition (Mesopotamia)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_MesopotamiaStartPosition(Type, X, Y, AltX, AltY);

DELETE FROM MinorCiv_MesopotamiaStartPosition WHERE Type IN ('MINOR_CIV_UR');
--==========================================================================================================================
-- Civilizations_NorthWestEuropeStartPosition (NW Europe)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);

DELETE FROM MinorCiv_NorthWestEuropeStartPosition WHERE Type IN ('MINOR_CIV_UR');	
INSERT INTO MinorCiv_NorthWestEuropeStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_UR',						   14,	   40,		null,	null); -- Skara Brae
--==========================================================================================================================
-- Civilizations_MediterraneanStartPosition (Mediterranaean)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_MediterraneanStartPosition(Type, X, Y, AltX, AltY);

DELETE FROM MinorCiv_MediterraneanStartPosition WHERE Type IN ('MINOR_CIV_UR');
--==========================================================================================================================
-- Civilizations_BritishIslesStartPosition (British Isles)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_BritishIslesStartPosition(Type, X, Y, AltX, AltY);

DELETE FROM MinorCiv_BritishIslesStartPosition WHERE Type IN ('MINOR_CIV_UR');	
INSERT INTO MinorCiv_BritishIslesStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_UR',						   30,	   77,		null,	null); -- Skara Brae
--==========================================================================================================================
-- Civilizations_AmericaStandardStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_AmericaStandardStartPosition(Type, X, Y, AltX, AltY);	

DELETE FROM MinorCiv_AmericaStandardStartPosition WHERE Type IN ('MINOR_CIV_UR');
--==========================================================================================================================
-- Civilizations_NorthEastAsiaStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_NorthEastAsiaStartPosition(Type, X, Y, AltX, AltY);	

DELETE FROM MinorCiv_NorthEastAsiaStartPosition WHERE Type IN ('MINOR_CIV_UR');
--==========================================================================================================================
-- Civilizations_PacificStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_PacificStartPosition(Type, X, Y, AltX, AltY);	

DELETE FROM MinorCiv_PacificStartPosition WHERE Type IN ('MINOR_CIV_UR');
--==========================================================================================================================
-- Civilizations_EastAsiaStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_EastAsiaStartPosition(Type, X, Y, AltX, AltY);	

DELETE FROM MinorCiv_EastAsiaStartPosition WHERE Type IN ('MINOR_CIV_UR');
--==========================================================================================================================
-- Civilizations_SouthPacificStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_SouthPacificStartPosition(Type, X, Y, AltX, AltY);	

DELETE FROM MinorCiv_SouthPacificStartPosition WHERE Type IN ('MINOR_CIV_UR');
--==========================================================================================================================
-- Civilizations_AegeanStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_AegeanStartPosition(Type, X, Y, AltX, AltY);	

DELETE FROM MinorCiv_AegeanStartPosition WHERE Type IN ('MINOR_CIV_UR');
--==========================================================================================================================
-- Civilizations_AfricaLargeStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);	

DELETE FROM MinorCiv_AfricaLargeStartPosition WHERE Type IN ('MINOR_CIV_UR');
--==========================================================================================================================
-- Civilizations_AmericasStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_AmericasStartPosition(Type, X, Y, AltX, AltY);	

DELETE FROM MinorCiv_AmericasStartPosition WHERE Type IN ('MINOR_CIV_UR');
--==========================================================================================================================
-- Civilizations_ApennineStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_ApennineStartPosition(Type, X, Y, AltX, AltY);	

DELETE FROM MinorCiv_ApennineStartPosition WHERE Type IN ('MINOR_CIV_UR');
--==========================================================================================================================
-- Civilizations_AsiaStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_AsiaStartPosition(Type, X, Y, AltX, AltY);	

DELETE FROM MinorCiv_AsiaStartPosition WHERE Type IN ('MINOR_CIV_UR');
--==========================================================================================================================
-- Civilizations_CaribbeanStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_CaribbeanStartPosition(Type, X, Y, AltX, AltY);	

DELETE FROM MinorCiv_CaribbeanStartPosition WHERE Type IN ('MINOR_CIV_UR');
--==========================================================================================================================
-- Civilizations_NileValleyStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_NileValleyStartPosition(Type, X, Y, AltX, AltY);	

DELETE FROM MinorCiv_NileValleyStartPosition WHERE Type IN ('MINOR_CIV_UR');
--==========================================================================================================================
-- Civilizations_NorthAtlanticStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);	

DELETE FROM MinorCiv_NorthAtlanticStartPosition WHERE Type IN ('MINOR_CIV_UR');		


