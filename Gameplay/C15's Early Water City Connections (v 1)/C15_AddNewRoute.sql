
UPDATE Routes
SET Value = Value + 1;

INSERT INTO Routes
		(Type,					Description,			AdvancedStartCost,		Value,		Movement,	FlatMovement,	GoldMaintenance,	Industrial,	PortraitIndex,	IconAtlas,	Civilopedia)
SELECT	'ROUTE_C15_FAKEROUTE',	'TXT_KEY_ROUTE_ROAD',	AdvancedStartCost,		Value - 1,	Movement,	FlatMovement,	GoldMaintenance,	Industrial,	PortraitIndex,	IconAtlas,	Civilopedia
FROM Routes WHERE Type = 'ROUTE_ROAD';

INSERT INTO Builds
		(Type,					Description,	Help,	Recommendation,		OrderPriority,			RouteType,				EntityEvent,	IconIndex,		IconAtlas)
SELECT	'BUILD_C15_FAKEROUTE',	a.Description,	a.Help,	a.Recommendation,	a.OrderPriority,				'ROUTE_C15_FAKEROUTE',	a.EntityEvent,	a.IconIndex,	a.IconAtlas
FROM Builds a WHERE a.Type = 'BUILD_ROAD'; 

-- Idk if these actually  matter, but y'know

UPDATE Defines
SET Value = (SELECT ID FROM Routes WHERE Type = 'ROUTE_C15_FAKEROUTE')
WHERE Name = 'INITIAL_CITY_ROUTE_TYPE';

UPDATE PostDefines
SET Key = 'ROUTE_C15_FAKEROUTE'
WHERE Name = 'INITIAL_CITY_ROUTE_TYPE';

-- Deadfile data (for no DLC)

UPDATE Builds
SET ShowInPedia = 0, ShowInTechTree = 0
WHERE Type = 'ROUTE_C15_FAKEROUTE';