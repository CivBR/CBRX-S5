--==========================================================================================================================
-- CBRX TERRAIN CHANGES
--==========================================================================================================================
--IMPORTANT: 
----Define new IconAtlas and new PortraitIndex (indexes start at 0) if applicable.
----RGB values must be divided by 255.
----Use https://www.easyrgb.com/en/convert.php#inputFORM to convert HTML to sRGB   0-1.0
----Add/Remove -- before the ( to comment out an entry. Be careful that the last entry uncommented out has ; to close )
----IsBackground = 1 for Background colours; IsIcon = 1 for Icon colours.
----------------------------------------------------------------------------------------------------------------------------
-- Civilization_CBRX_Colours
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_CBRX_Colours 
		(CivilizationType,								NewIconAtlas,		NewPortraitIndex,	Red,		Green,		Blue,		IsBackground,	IsIcon)
VALUES	--('CIVILIZATION_BABYLON',						'CIV_ATLAS_MOO',	1,					0,			0,			0,			1,				0), 
		--('CIVILIZATION_BABYLON',						null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_AGLA_ESTONIA',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_AGLA_ESTONIA',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_AGLA_ZELENY_KLYN',				null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_AGLA_ZELENY_KLYN',				null,				-1,					0,			0,			0,			0,				1),
		('CIVILIZATION_AGLA_SCYTHIA',					null,				-1,					0.60000,	0.16078,	0.03922,	1,				0),
		('CIVILIZATION_AGLA_SCYTHIA',					null,				-1,					0.98824,	0.83137,	0.65882,	0,				1),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',			null,				-1,					0.94118,	0.89804,	0.86667,	1,				0),
		--('CIVILIZATION_AGLA_HANSE_WULLENWEVER',		null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_SAS_AURES',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_SAS_AURES',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_SENSHI_BANGLADESH',			null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_SENSHI_BANGLADESH',			null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_RHO_BJARMIA',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_RHO_BJARMIA',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_SENSHI_BUNUBA',				null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_SENSHI_BUNUBA',				null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_SAS_BERZEG',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_SAS_BERZEG',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_DMS_ETHIOPIA_YAQOB',			null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_DMS_ETHIOPIA_YAQOB',			null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_URDNOT_REV_FRANCE',			null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_URDNOT_REV_FRANCE',			null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_GT_ROURAN',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_GT_ROURAN',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_GT_TERNATE',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_GT_TERNATE',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_THP_HERERO',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_THP_HERERO',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_TCM_HYKSOS',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_TCM_HYKSOS',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_RHO_ITELMEN',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_RHO_ITELMEN',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_SENSHI_HIDEYOSHI',				null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_SENSHI_HIDEYOSHI',				null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_JFD_KALMAR_UNION',				null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_JFD_KALMAR_UNION',				null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_LUNG_KIPCHAKS',				null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_LUNG_KIPCHAKS',				null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_PB_LANFANG',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_PB_LANFANG',					null,				-1,					0,			0,			0,			0,				1),
		('CIVILIZATION_THP_LUBA',						null,				-1,					0.32157,	0.22745,	0.39608,	1,				0),
		--('CIVILIZATION_THP_LUBA',						null,				-1,					0,			0,			0,			0,				1),
		('CIVILIZATION_DMS_MINAEANS',					null,				-1,					0.23529,	0.12157,	0.02745,	1,				0),
		--('CIVILIZATION_DMS_MINAEANS',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_JWW_MARAVI',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_JWW_MARAVI',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_MC_RAPA_NUI',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_MC_RAPA_NUI',					null,				-1,					0,			0,			0,			0,				1),
		('CIVILIZATION_MC_MYSORE',						null,				-1,					0.41961,	0.03137,	0.05882,	1,				0),
		('CIVILIZATION_MC_MYSORE',						null,				-1,					0.94118,	0.48627,	0.30588,	0,				1),
		--('CIVILIZATION_SENSHI_NEW_SOUTH_WALES',		null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_SENSHI_NEW_SOUTH_WALES',		null,				-1,					0,			0,			0,			0,				1),
		('CIVILIZATION_SENSHI_PAKISTAN',				null,				-1,					0.26275,	0.45490,	0.08235,	1,				0),
		('CIVILIZATION_SENSHI_PAKISTAN',				null,				-1,					0.83137,	0.85098,	0.70980,	0,				1),
		--('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II',	null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II',	null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_ER_PEGU',						null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_ER_PEGU',						null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_MC_PHOENICIA',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_MC_PHOENICIA',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_TCM_AVIS_PORTUGAL',			null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_TCM_AVIS_PORTUGAL',			null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_JWW_QARA_KHITAI',				null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_JWW_QARA_KHITAI',				null,				-1,					0,			0,			0,			0,				1),
		('CIVILIZATION_SAS_RYUKYU',						null,				-1,					0.68235,	0.60392,	0.78039,	1,				0),
		('CIVILIZATION_SAS_RYUKYU',						null,				-1,					0.15686,	0.15686,	0.15686,	0,				1),
		--('CIVILIZATION_ASQ_SCOTLAND_MARY',			null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_ASQ_SCOTLAND_MARY',			null,				-1,					0,			0,			0,			0,				1),
		('CIVILIZATION_JWW_SEYCHELLES',					null,				-1,					0.22745,	0.80000,	0.78039,	1,				0),
		('CIVILIZATION_JWW_SEYCHELLES',					null,				-1,					0.04706,	0.21961,	0.33725,	0,				1),
		--('CIVILIZATION_AKKADIAN_MOD',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_AKKADIAN_MOD',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_THP_TANG',						null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_THP_TANG',						null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_ASQ_UMHAILL',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_ASQ_UMHAILL',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_NC_CEBU',						null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_NC_CEBU',						null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_RHO_VYATKA',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_RHO_VYATKA',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_JFD_WALLACHIA',				null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_JFD_WALLACHIA',				null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_SENSHI_YUNNAN',				null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_SENSHI_YUNNAN',				null,				-1,					0,			0,			0,			0,				1),
		('CIVILIZATION_THP_KET',						null,				-1,					0.49020,	0.59216,	0.57255,	1,				0),
		('CIVILIZATION_THP_KET',						null,				-1,					0.36471,	0.07059,	0.07059,	0,				1),
		('CIVILIZATION_TCM_BACTRIA',					null,				-1,					0.61569,	0.70980,	0.89020,	1,				0),
		('CIVILIZATION_TCM_BACTRIA',					null,				-1,					0.04706,	0.05098,	0.49020,	0,				1),
		('CIVILIZATION_NC_ZAZZAU',						null,				-1,					0.81961,	0.90588,	0.82353,	1,				0),
		('CIVILIZATION_NC_ZAZZAU',						null,				-1,					0.08627,	0.36863,	0.26667,	0,				1),
		--('CIVILIZATION_NC_WASSOULOU',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_NC_WASSOULOU',					null,				-1,					0,			0,			0,			0,				1),
		('CIVILIZATION_CL_TLINGIT',						null,				-1,					0.25098,	0.29020,	0.30588,	1,				0),
		('CIVILIZATION_CL_TLINGIT',						null,				-1,					0.87843,	0.83137,	0.70588,	0,				1),
		--('CIVILIZATION_CLANISHINAABE',				null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_CLANISHINAABE',				null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_JWW_KARANKAWA',				null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_JWW_KARANKAWA',				null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_LEU_ONONDAGA_TADODAHO',		null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_LEU_ONONDAGA_TADODAHO',		null,				-1,					0,			0,			0,			0,				1),
		('CIVILIZATION_NC_PONCA',						null,				-1,					0.89020,	0.77255,	0.39608,	1,				0),
		('CIVILIZATION_NC_PONCA',						null,				-1,					0.51765,	0.27059,	0.01961,	0,				1),
		--('CIVILIZATION_ORG_COIOT_POMO',				null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_ORG_COIOT_POMO',				null,				-1,					0,			0,			0,			0,				1),
		('CIVILIZATION_TG_SUSQUEHANNOCK',				null,				-1,					0.85098,	0.69412,	0.89412,	1,				0),
		--('CIVILIZATION_TG_SUSQUEHANNOCK',				null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_NORTE_CHICO_MOD',				null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_NORTE_CHICO_MOD',				null,				-1,					0,			0,			0,			0,				1),
		('CIVILIZATION_MC_YANOMAMI',					null,				-1,					0.64314,	0.26275,	0.27059,	1,				0),
		('CIVILIZATION_MC_YANOMAMI',					null,				-1,					0.89412,	0.81961,	0.76863,	0,				1),
		--('CIVILIZATION_ZRQ_TEO_SPEAROWL',				null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_ZRQ_TEO_SPEAROWL',				null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_ASQ_XARAGUA',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_ASQ_XARAGUA',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_RHO_CHONO',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_RHO_CHONO',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_THP_GUAYCURU',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_THP_GUAYCURU',					null,				-1,					0,			0,			0,			0,				1),
		--('CIVILIZATION_SAS_XAVANTE',					null,				-1,					0,			0,			0,			1,				0),
		--('CIVILIZATION_SAS_XAVANTE',					null,				-1,					0,			0,			0,			0,				1),
		('CIVILIZATION_RHO_POTIGUARA',					null,				-1,					0.05490,	0.21569,	0.200000,	1,				0); 
		--('CIVILIZATION_RHO_POTIGUARA',				null,				-1,					0,			0,			0,			0,				1), --If making additions, make sure the LAST ) ends with a ;
----------------------------------------------------------------------------------------------------------------------------
-- Colors
----------------------------------------------------------------------------------------------------------------------------
-- DONT TOUCH BELOW THIS POINT. HOOP IS WATCHING YOU!
----------------------------------------------------------------------------------------------------------------------------
UPDATE Civilization_CBRX_Colours
SET PrimaryColor = (SELECT PrimaryColor FROM PlayerColors WHERE Type IN (SELECT DefaultPlayerColor FROM Civilizations WHERE Type = CivilizationType))
WHERE IsIcon = 1;

UPDATE Civilization_CBRX_Colours
SET SecondaryColor = (SELECT SecondaryColor FROM PlayerColors WHERE Type IN (SELECT DefaultPlayerColor FROM Civilizations WHERE Type = CivilizationType))
WHERE IsBackground = 1;

UPDATE Colors
SET Red = (SELECT Red FROM Civilization_CBRX_Colours WHERE PrimaryColor = Type),
Green = (SELECT Green FROM Civilization_CBRX_Colours WHERE PrimaryColor = Type),
Blue = (SELECT Blue FROM Civilization_CBRX_Colours WHERE PrimaryColor = Type)
WHERE Type IN (SELECT PrimaryColor FROM Civilization_CBRX_Colours WHERE IsIcon = 1);

UPDATE Colors
SET Red = (SELECT Red FROM Civilization_CBRX_Colours WHERE SecondaryColor = Type),
Green = (SELECT Green FROM Civilization_CBRX_Colours WHERE SecondaryColor = Type),
Blue = (SELECT Blue FROM Civilization_CBRX_Colours WHERE SecondaryColor = Type)
WHERE Type IN (SELECT SecondaryColor FROM Civilization_CBRX_Colours WHERE IsBackground = 1);

UPDATE Civilizations
SET IconAtlas = (CASE WHEN EXISTS (SELECT NewIconAtlas FROM Civilization_CBRX_Colours WHERE NewIconAtlas IS NOT NULL AND CivilizationType = Type) THEN (SELECT NewIconAtlas FROM Civilization_CBRX_Colours WHERE NewIconAtlas IS NOT NULL AND CivilizationType = Type) ELSE (SELECT IconAtlas FROM Civilizations WHERE Type = Type) END),
PortraitIndex = (CASE WHEN EXISTS (SELECT NewPortraitIndex FROM Civilization_CBRX_Colours WHERE NewPortraitIndex <> -1 AND CivilizationType = Type) THEN (SELECT NewPortraitIndex FROM Civilization_CBRX_Colours WHERE NewPortraitIndex <> -1 AND CivilizationType = Type) ELSE (SELECT PortraitIndex FROM Civilizations WHERE Type = Type) END)
WHERE Type IN (SELECT CivilizationType FROM Civilization_CBRX_Colours);

CREATE TRIGGER JFD_Civilization_CBRX_Colours_Civilizations
AFTER INSERT ON Civilizations
WHEN NEW.Type IN (SELECT CivilizationType FROM Civilization_CBRX_Colours)
BEGIN
	UPDATE Civilization_CBRX_Colours
	SET PrimaryColor = (SELECT PrimaryColor FROM PlayerColors WHERE Type IN (SELECT DefaultPlayerColor FROM Civilizations WHERE Type = CivilizationType))
	WHERE IsIcon = 1 AND CivilizationType = NEW.Type;
	
	UPDATE Civilization_CBRX_Colours
	SET SecondaryColor = (SELECT SecondaryColor FROM PlayerColors WHERE Type IN (SELECT DefaultPlayerColor FROM Civilizations WHERE Type = CivilizationType))
	WHERE IsBackground = 1 AND CivilizationType = NEW.Type;
	
	UPDATE Colors
	SET Red = (SELECT Red FROM Civilization_CBRX_Colours WHERE PrimaryColor = Type),
	Green = (SELECT Green FROM Civilization_CBRX_Colours WHERE PrimaryColor = Type),
	Blue = (SELECT Blue FROM Civilization_CBRX_Colours WHERE PrimaryColor = Type)
	WHERE Type IN (SELECT PrimaryColor FROM Civilization_CBRX_Colours WHERE IsIcon = 1 AND CivilizationType = NEW.Type);
	
	UPDATE Colors
	SET Red = (SELECT Red FROM Civilization_CBRX_Colours WHERE SecondaryColor = Type),
	Green = (SELECT Green FROM Civilization_CBRX_Colours WHERE SecondaryColor = Type),
	Blue = (SELECT Blue FROM Civilization_CBRX_Colours WHERE SecondaryColor = Type)
	WHERE Type IN (SELECT SecondaryColor FROM Civilization_CBRX_Colours WHERE IsBackground = 1 AND CivilizationType = NEW.Type);

	UPDATE Civilizations
	SET IconAtlas = (CASE WHEN EXISTS (SELECT NewIconAtlas FROM Civilization_CBRX_Colours WHERE NewIconAtlas IS NOT NULL AND CivilizationType = Type) THEN (SELECT NewIconAtlas FROM Civilization_CBRX_Colours WHERE NewIconAtlas IS NOT NULL AND CivilizationType = Type) ELSE (SELECT IconAtlas FROM Civilizations WHERE Type = Type) END),
	PortraitIndex = (CASE WHEN EXISTS (SELECT NewPortraitIndex FROM Civilization_CBRX_Colours WHERE NewPortraitIndex <> -1 AND CivilizationType = Type) THEN (SELECT NewPortraitIndex FROM Civilization_CBRX_Colours WHERE NewPortraitIndex <> -1 AND CivilizationType = Type) ELSE (SELECT PortraitIndex FROM Civilizations WHERE Type = Type) END)
	WHERE Type IN (SELECT CivilizationType FROM Civilization_CBRX_Colours WHERE CivilizationType = NEW.Type);
END;
--==========================================================================================================================

--==========================================================================================================================


