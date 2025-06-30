--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
------------------------------------------------------------------------------------------------------------------------	
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 	
		(Type, 						 			DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_DUMMY_SAS_AURES',		'BUILDING_DUMMY_SAS_AURES',		'TXT_KEY_BUILDINGCLASS_DUMMY_SAS_AURES');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 		
		(Type, 								BuildingClass,						GreatWorkCount,	Cost, FaithCost, PrereqTech, Description, 			 NeverCapture)
VALUES	('BUILDING_DUMMY_SAS_AURES',		'BUILDINGCLASS_DUMMY_SAS_AURES',	-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDINGCLASS_DUMMY_SAS_AURES',		1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 						YieldType,			Yield)
VALUES	('BUILDING_DUMMY_SAS_AURES',		'YIELD_FAITH',		1);
------------------------------------------------------------------------------------------------------------------------	
-- Building_CityToolTipYieldFromOther
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Building_CityToolTipYieldFromOther(BuildingType, YieldType, Yield integer);
INSERT INTO Building_CityToolTipYieldFromOther
		(BuildingType, 						YieldType,			Yield)
VALUES	('BUILDING_DUMMY_SAS_AURES',		'YIELD_FAITH',		1);

------------------------------------------------------------------------------------------------------------------------	
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 	
		(Type, 						 			DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_DUMMY_SAS_KSOUR',		'BUILDING_DUMMY_SAS_KSOUR',		'TXT_KEY_BUILDINGCLASS_DUMMY_SAS_KSOUR');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 		
		(Type, 								BuildingClass,						Defense, ExtraCityHitPoints, GreatWorkCount,	Cost, FaithCost, PrereqTech, Description, 			 NeverCapture)
VALUES	('BUILDING_DUMMY_SAS_KSOUR',		'BUILDINGCLASS_DUMMY_SAS_KSOUR',	200,		15,				-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDINGCLASS_DUMMY_SAS_KSOUR',		1);


------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 						IgnoreZOC,	HeavyCharge,  Description, 					Help, 																			Sound, 				CannotBeChosen, LostWithUpgrade,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_SAS_AURES',		0,			1,			  'TXT_KEY_PROMOTION_SAS_AURES',	'TXT_KEY_PROMOTION_SAS_AURES_HELP', 	'AS2D_IF_LEVELUP', 	1, 				1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_AURES'),
		('PROMOTION_SAS_ZENATA_IGNORE_ZOC',		1,			0,			  'TXT_KEY_PROMOTION_SAS_ZENATA_IGNORE_ZOC',	'TXT_KEY_PROMOTION_SAS_ZENATA_IGNORE_ZOC_HELP', 	'AS2D_IF_LEVELUP', 	1, 				0, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_ZENATA_IGNORE_ZOC');
