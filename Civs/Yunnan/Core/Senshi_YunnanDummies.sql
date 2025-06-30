------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding, 							Description)
VALUES	('BUILDINGCLASS_DUMMY_SENSHI_YUNNAN',		'BUILDING_DUMMY_SENSHI_YUNNAN_STRENGTH',	'TXT_KEY_SENSHI_DUMMY_YUNNAN');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
		(Type, 										BuildingClass, 							Defense,    GreatWorkCount,		Cost, FaithCost,   PrereqTech,   NeverCapture,	Description)
VALUES	('BUILDING_DUMMY_SENSHI_YUNNAN_STRENGTH', 	'BUILDINGCLASS_DUMMY_SENSHI_YUNNAN', 	100,		-1, 				-1,   -1, 		   null, 		 1,				'TXT_KEY_SENSHI_DUMMY_YUNNAN'),
		('BUILDING_DUMMY_SENSHI_AIRBASE_STRENGTH', 	'BUILDINGCLASS_DUMMY_SENSHI_YUNNAN', 	200,		-1, 				-1,   -1, 		   null, 		 1,				'TXT_KEY_SENSHI_DUMMY_HUMP_AIRBASE');
