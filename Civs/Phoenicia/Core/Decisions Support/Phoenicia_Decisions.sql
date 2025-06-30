--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('Phoenicia_Decisions.lua');
--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================
INSERT INTO BuildingClasses
			(Type,														DefaultBuilding,								Description,									MaxGlobalInstances)
VALUES		('BUILDINGCLASS_DECISIONS_PHOENICIANSOLOMON',				'BUILDING_DECISIONS_PHOENICIANSOLOMON',			'TXT_KEY_DECISIONS_PHOENICIANSOLOMON',			-1);
--==========================================================================================================================
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings
			(Type, 													Cost, 	FaithCost, 	GreatWorkCount, PrereqTech, Description,							BuildingClass, 									NeverCapture)
VALUES		('BUILDING_DECISIONS_PHOENICIANSOLOMON',				-1,		-1,			-1,				null,		'TXT_KEY_DECISIONS_PHOENICIANSOLOMON',	'BUILDINGCLASS_DECISIONS_PHOENICIANSOLOMON',	1);
--==========================================================================================================================
-- Building_FreeUnits
--==========================================================================================================================
INSERT INTO Building_FreeUnits 
			(BuildingType, 								UnitType, 		NumUnits)
VALUES		('BUILDING_DECISIONS_PHOENICIANSOLOMON', 	'UNIT_PROPHET', 1);
--==========================================================================================================================
--==========================================================================================================================