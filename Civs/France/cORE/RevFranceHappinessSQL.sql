CREATE TABLE IF NOT EXISTS US_Robespierre_HappinessDummy_Building_Linkage (DummyBuildingType TEXT, NormalBuildingType TEXT, PRIMARY KEY (DummyBuildingType, NormalBuildingType)); 

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description) 
SELECT 'BUILDINGCLASS_US_ROBESPIERRE_HAPPINESS_DUMMY_'||Type, 'BUILDING_US_ROBESPIERRE_HAPPINESS_DUMMY_'||Type, Description 
FROM Buildings WHERE Type IN (SELECT DefaultBuilding FROM BuildingClasses WHERE MaxPlayerInstances = -1 AND MaxGlobalInstances = -1 AND Type NOT LIKE 'BUILDINGCLASS_US_ROBESPIERRE_HAPPINESS_DUMMY_%');

INSERT INTO Buildings (Type, BuildingClass, Cost, FaithCost, GreatWorkCount, PrereqTech, Description, IconAtlas, PortraitIndex, NukeImmune, NeverCapture, Happiness)
SELECT 'BUILDING_US_ROBESPIERRE_HAPPINESS_DUMMY_'||Type, 'BUILDINGCLASS_US_ROBESPIERRE_HAPPINESS_DUMMY_'||Type, -1, -1, -1, NULL, Description, IconAtlas, PortraitIndex, 1, 1, 2
FROM Buildings WHERE Type IN (SELECT DefaultBuilding FROM BuildingClasses WHERE MaxPlayerInstances = -1 AND MaxGlobalInstances = -1 AND Type NOT LIKE 'BUILDINGCLASS_US_ROBESPIERRE_HAPPINESS_DUMMY_%');

INSERT INTO US_Robespierre_HappinessDummy_Building_Linkage (DummyBuildingType, NormalBuildingType)
SELECT 'BUILDING_US_ROBESPIERRE_HAPPINESS_DUMMY_'||Type, Type
FROM Buildings WHERE Type IN (SELECT DefaultBuilding FROM BuildingClasses WHERE MaxPlayerInstances = -1 AND MaxGlobalInstances = -1 AND Type NOT LIKE 'BUILDINGCLASS_US_ROBESPIERRE_HAPPINESS_DUMMY_%');

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description) 
SELECT 'BUILDINGCLASS_US_ROBESPIERRE_HAPPINESS_DUMMY_'||Type, 'BUILDING_US_ROBESPIERRE_HAPPINESS_DUMMY_'||Type, Description
FROM Buildings WHERE Type = 'BUILDING_US_ROBESPIERRE_GUILLOTINE';

INSERT INTO Buildings (Type, BuildingClass, Cost, FaithCost, GreatWorkCount, PrereqTech, Description, IconAtlas, PortraitIndex, NukeImmune, NeverCapture, Happiness)
SELECT 'BUILDING_US_ROBESPIERRE_HAPPINESS_DUMMY_'||Type, 'BUILDINGCLASS_US_ROBESPIERRE_HAPPINESS_DUMMY_'||Type, -1, -1, -1, NULL, Description, IconAtlas, PortraitIndex, 1, 1, 2
FROM Buildings WHERE Type = 'BUILDING_US_ROBESPIERRE_GUILLOTINE';

UPDATE US_Robespierre_HappinessDummy_Building_Linkage
SET DummyBuildingType = 'BUILDING_US_ROBESPIERRE_HAPPINESS_DUMMY_BUILDING_US_ROBESPIERRE_GUILLOTINE', NormalBuildingType = 'BUILDING_US_ROBESPIERRE_GUILLOTINE'
WHERE NormalBuildingType = (SELECT DefaultBuilding FROM BuildingClasses WHERE Type = (SELECT BuildingClass FROM Buildings WHERE Type = 'BUILDING_US_ROBESPIERRE_GUILLOTINE'));

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description) 
SELECT 'BUILDINGCLASS_US_ROBESPIERRE_HAPPINESS_DUMMY_SPECIAL', 'BUILDING_US_ROBESPIERRE_HAPPINESS_DUMMY_SPECIAL', Description
FROM Buildings WHERE Type = 'BUILDING_US_ROBESPIERRE_GUILLOTINE';

INSERT INTO Buildings (Type, BuildingClass, Cost, FaithCost, GreatWorkCount, PrereqTech, Description, IconAtlas, PortraitIndex, NukeImmune, NeverCapture, Happiness)
SELECT 'BUILDING_US_ROBESPIERRE_HAPPINESS_DUMMY_SPECIAL', 'BUILDINGCLASS_US_ROBESPIERRE_HAPPINESS_DUMMY_SPECIAL', -1, -1, -1, NULL, Description, IconAtlas, PortraitIndex, 1, 1, 1
FROM Buildings WHERE Type = 'BUILDING_US_ROBESPIERRE_GUILLOTINE';

CREATE TRIGGER US_Robespierre_NewBuildingToGiveDummyTo
AFTER INSERT ON Buildings
WHEN NEW.Type IN (SELECT DefaultBuilding FROM BuildingClasses WHERE MaxPlayerInstances = -1 AND MaxGlobalInstances = -1 AND Type NOT LIKE 'BUILDINGCLASS_US_ROBESPIERRE_HAPPINESS_DUMMY_%')
BEGIN
	INSERT INTO BuildingClasses 
			(Type, 														DefaultBuilding, 										Description)
	VALUES	('BUILDINGCLASS_US_ROBESPIERRE_HAPPINESS_DUMMY_'||NEW.Type, 'BUILDING_US_ROBESPIERRE_HAPPINESS_DUMMY_'||NEW.Type, 	NEW.Description);
	
	INSERT INTO Buildings 
			(Type, 													BuildingClass, 												Cost, 	FaithCost, GreatWorkCount, PrereqTech, Description, 		IconAtlas, PortraitIndex, NukeImmune, NeverCapture, Happiness)
	VALUES	('BUILDING_US_ROBESPIERRE_HAPPINESS_DUMMY_'||NEW.Type,	'BUILDINGCLASS_US_ROBESPIERRE_HAPPINESS_DUMMY_'||NEW.Type,	-1,		-1,			-1,				NULL,		NEW.Description,	NEW.IconAtlas,	NEW.PortraitIndex,	1,	1,			2);
	
	INSERT INTO US_Robespierre_HappinessDummy_Building_Linkage 
			(DummyBuildingType, 									NormalBuildingType)
	VALUES	('BUILDING_US_ROBESPIERRE_HAPPINESS_DUMMY_'||NEW.Type, 	NEW.Type);
END;

