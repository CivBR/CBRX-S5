--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 					Description, 					ShortDescription)
VALUES		('TRAIT_CLANISHINAABE', 	'TXT_KEY_TRAIT_CLANISHINAABE', 	'TXT_KEY_TRAIT_CLANISHINAABE_SHORT');	
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================			
INSERT OR REPLACE INTO BuildingClasses 
			(DefaultBuilding, 					Type, 									Description)
VALUES		('BUILDING_CLANISHINAABESPY', 		'BUILDINGCLASS_CLANISHINAABESPY', 		'TXT_KEY_BUILDING_CLANISHINAABESPY'),
			('BUILDING_CLANISHINAABEREL', 		'BUILDINGCLASS_CLANISHINAABEREL', 		'TXT_KEY_BUILDING_CLANISHINAABEREL');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT OR REPLACE INTO Buildings 
			(Type, 								BuildingClass, 						GreatWorkCount,	Cost, 	FaithCost,	GoldMaintenance,	PrereqTech, NeverCapture,	Description, 								Help,										Defense,	ExtraCityHitPoints,	ExtraSpies)
VALUES		('BUILDING_CLANISHINAABESPY', 		'BUILDINGCLASS_CLANISHINAABESPY',	-1,				-1, 	-1,			0,					NULL, 		1,				'TXT_KEY_BUILDING_CLANISHINAABESPY',		'TXT_KEY_BUILDING_CLANISHINAABESPY_HELP',	-100,		-2,					0),
			('BUILDING_CLANISHINAABEREL', 		'BUILDINGCLASS_CLANISHINAABEREL',	-1,				-1, 	-1,			0,					NULL, 		1,				'TXT_KEY_BUILDING_CLANISHINAABEREL',		'TXT_KEY_BUILDING_CLANISHINAABEREL_HELP',	0,			0,					1);
--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================		
INSERT INTO Language_en_US
			(Tag,											Text)
VALUES		('TXT_KEY_TRAIT_CLANISHINAABE',					'Wars trigger a Call to War, during which your spies compromise defenses in enemy cities. The Call to War lasts 10 turns on Standard Speed. When you found a religion, gain a Spy.'),
			('TXT_KEY_TRAIT_CLANISHINAABE_SHORT',			'Pontiac''s Conspiracy'),
			('TXT_KEY_BUILDING_CLANISHINAABESPY',			'Anishinaabe Spy Effect'),
			('TXT_KEY_BUILDING_CLANISHINAABESPY_HELP',		'Negates the effect of Walls on the city.'),
			('TXT_KEY_BUILDING_CLANISHINAABEREL',			'Anishinaabe Free Spy'),
			('TXT_KEY_BUILDING_CLANISHINAABEREL_HELP',		'Founding a religion gives you a free spy.');