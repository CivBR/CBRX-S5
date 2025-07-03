--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
UPDATE Defines
SET Value = 2
WHERE Name = 'MIN_CITY_RANGE';

CREATE TRIGGER JFD_CBRX5Helper_Defines
AFTER UPDATE ON Defines
WHEN NEW.Name = 'MIN_CITY_RANGE' AND NEW.Value <> 2
BEGIN
	UPDATE Defines
	SET Value = 2
	WHERE Name = 'MIN_CITY_RANGE';	
END; 
--==========================================================================================================================
-- TECHNOLOGIES
--==========================================================================================================================
INSERT INTO Technologies
		(Type,					Cost,	Description,							Era,			GridX,	GridY,	PortraitIndex,	IconAtlas,				Disable,	Civilopedia,						Help,								Quote)
VALUES  ('TECH_CBR_OBSERVER',	-1,		'TXT_KEY_TECH_CBR_OBSERVER_TITLE',		'ERA_ANCIENT',	-1,		-1,		0,				'NEB_CIV_COLOR_ATLAS',	1,			'TXT_KEY_TECH_CBR_OBSERVER_DESC',	'TXT_KEY_TECH_CBR_OBSERVER_HELP',	'TXT_KEY_TECH_CBR_OBSERVER_QUOTE'),
		('TECH_CBR_OBSERVER_2',	-1,		'TXT_KEY_TECH_CBR_OBSERVER_2_TITLE',	'ERA_ANCIENT',	-1,		-1,		0,				'NEB_CIV_COLOR_ATLAS',	1,			'TXT_KEY_TECH_CBR_OBSERVER_2_DESC',	'TXT_KEY_TECH_CBR_OBSERVER_2_HELP',	'TXT_KEY_TECH_CBR_OBSERVER_2_QUOTE');
--==========================================================================================================================
--==========================================================================================================================