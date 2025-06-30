--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 						Description, 						ShortDescription)					
VALUES		('TRAIT_SENSHI_HIDEYOSHI', 	'TXT_KEY_TRAIT_SENSHI_HIDEYOSHI', 	'TXT_KEY_TRAIT_SENSHI_HIDEYOSHI_SHORT');

INSERT INTO BuildingClasses 	
		(Type,										DefaultBuilding,					Description)
VALUES	('BUILDINGCLASS_SENSHI_HIDEYOSHI_DUMMY',	'BUILDING_SENSHI_HIDEYOSHI_DUMMY',	'TXT_KEY_BUILDING_SENSHI_HIDEYOSHI_DUMMY');

INSERT INTO Buildings		
		(Type,								BuildingClass,							Cost, 	FaithCost,	GreatWorkCount,  	NoOccupiedUnhappiness,	Description,								Help,										NeverCapture)
VALUES	('BUILDING_SENSHI_HIDEYOSHI_DUMMY',	'BUILDINGCLASS_SENSHI_HIDEYOSHI_DUMMY',	-1,		-1,			-1,					1,						'TXT_KEY_BUILDING_SENSHI_HIDEYOSHI_DUMMY',	'TXT_KEY_BUILDING_SENSHI_HIDEYOSHI_DUMMY',	1);
