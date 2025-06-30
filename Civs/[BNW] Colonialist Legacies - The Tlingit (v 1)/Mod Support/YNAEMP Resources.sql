-------------------------------------
-- Civilizations_YagemRequestedResource (Earth Giant)
-------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
                (TYPE,                                                  Req1,						Req2,				Req3,				Yield3)
VALUES	('CIVILIZATION_CL_TLINGIT',			'RESOURCE_WHALE',	'RESOURCE_FISH',	null,	
-------------------------------------
-- Civilizations_YahemRequestedResource (Earth Giant)
-------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
                (TYPE,                                                  Req1,						Req2,				Req3,				Yield3)
VALUES	('CIVILIZATION_CL_TLINGIT',			'RESOURCE_WHALE',	'RESOURCE_FISH',	null,	
-------------------------------------
-- Civilizations_CordiformRequestedResource (Earth Giant)
-------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CordiformRequestedResource
                (TYPE,                                                  Req1,						Req2,				Req3,				Yield3)
VALUES	('CIVILIZATION_CL_TLINGIT',			'RESOURCE_WHALE',	'RESOURCE_FISH',	null,	
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_PacificRequestedResource (Americas Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_PacificRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_PacificRequestedResource
		(Type,							Req1,						Req2,				Req3,				Yield3)
VALUES	('CIVILIZATION_CL_TLINGIT',			'RESOURCE_WHALE',	'RESOURCE_FISH',	null,	
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AmericasRequestedResource (Americas)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
		(Type,							Req1,						Req2,				Req3)
VALUES	('CIVILIZATION_CL_TLINGIT',			'RESOURCE_WHALE',	'RESOURCE_FISH',	null),
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AmericasGiantRequestedResource (Americas Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AmericasGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasGiantRequestedResource
		(Type,							Req1,						Req2,				Req3,				Yield3)
VALUES	('CIVILIZATION_CL_TLINGIT',			'RESOURCE_WHALE',	'RESOURCE_FISH',	null,				0),
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthAmericaGiantRequestedResource (North America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAmericaGiantRequestedResource
		(Type,							Req1,						Req2,				Req3,				Yield3)
VALUES	('CIVILIZATION_CL_TLINGIT',		'RESOURCE_WHALE',			'RESOURCE_FISH',	null,				0),			0);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthAmericaHugeRequestedResource (North America Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaHugeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAmericaHugeRequestedResource
		(Type,							Req1,						Req2,				Req3,				Yield3)
VALUES	('CIVILIZATION_CL_TLINGIT',		'RESOURCE_WHALE',			'RESOURCE_FISH',	null,				0),			0);
--==========================================================================================================================
--==========================================================================================================================