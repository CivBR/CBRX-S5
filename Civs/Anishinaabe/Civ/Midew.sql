--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Class,	Type, 					PrereqTech,		Range, RangedCombat,	Combat,		FaithCost,			RequiresFaithPurchaseEnabled, Cost,		Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 				Civilopedia, 					Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagAtlas, 			UnitFlagIconOffset, PortraitIndex,	IconAtlas,				WorkRate, ReligiousStrength, RemoveHeresy, ProhibitsSpread)
SELECT		Class,	'UNIT_CLMIDEW', 		PrereqTech,		Range, RangedCombat,	Combat,		FaithCost,			RequiresFaithPurchaseEnabled, Cost,		Moves, 	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_CLMIDEW', 	'TXT_KEY_CIV5_CLMIDEW_TEXT',	'TXT_KEY_UNIT_CLMIDEW_STRATEGY',		'TXT_KEY_UNIT_CLMIDEW_HELP',		MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_CLMIDEW',			'CLMIDEW_FLAG',			0,					3, 				'CLANISHINAABE_ATLAS',	WorkRate, ReligiousStrength, RemoveHeresy, ProhibitsSpread
FROM Units WHERE (Type = 'UNIT_INQUISITOR');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 			UnitAIType)
SELECT		'UNIT_CLMIDEW', 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_INQUISITOR');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 			FlavorType, Flavor)
SELECT		'UNIT_CLMIDEW', 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_INQUISITOR');
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 							Description, 						Help, 									Sound, 				CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry,							CityAttack, CityDefense)
VALUES		('PROMOTION_CLFANATICISM',		'TXT_KEY_PROMOTION_CLFANATICISM',	'TXT_KEY_PROMOTION_CLFANATICISM_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CLFANATICISM',	15,			15);
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 			UnitClassType)
SELECT		'UNIT_CLMIDEW',		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_INQUISITOR');

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			 SelectionSound, FirstSelectionSound)
SELECT	'UNIT_CLMIDEW',	 SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_INQUISITOR';

--Midew art
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_CLMIDEW', 1, 'EarlyGreatArtist');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_CLMIDEW', 'ART_DEF_UNIT_MEMBER_CLMIDEW', 1);
-- INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  -- VALUES ('ART_DEF_UNIT_CLMIDEW', 'ART_DEF_UNIT_MEMBER_CLMIDEW_01', 1);
-- INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  -- VALUES ('ART_DEF_UNIT_CLMIDEW', 'ART_DEF_UNIT_MEMBER_CLMIDEW_02', 1);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_CLMIDEW', 0.119999997317791, 'u_anishinaabe_medicine_man.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_CLMIDEW', 'Idle Death BombardDefend Run', 1);
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_CLMIDEW', 	'Unit', 	'SV_Midew.dds');



--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================		
INSERT INTO Language_en_US
			(Tag,												Text)
VALUES		('TXT_KEY_UNIT_CLMIDEW',							'Midew'),
			('TXT_KEY_CIV5_CLMIDEW_TEXT',						'A Midew is a practitioner of Midewiwin, the traditional Anishinaabe religion. While normally a peaceful, secretive religion, during Pontiac''s War the Midew were a catalyst, uniting various nations against the Americans and their ways.'),
			('TXT_KEY_UNIT_CLMIDEW_STRATEGY',					'The Midew can be used to turn City-States that have allied with your enemies against your enemies. You''ll want to keep a steady supply of Midew heading towards the city states in question, to keep them riled up and ready to fight.'),
			('TXT_KEY_UNIT_CLMIDEW_HELP',						'Unlike the Inquisitor it replaces, the Midew can be used to cause City-States to join you in attacking your enemies.'),
			('TXT_KEY_BUILD_CLMIDEWINFLUENCE',					'Call to War!'),
			('TXT_KEY_IMPROVEMENT_CLMIDEWINFLUENCE',			'Call to War!'),
			('TXT_KEY_CIV5_IMPROVEMENTS_CLMIDEWINFLUENCE_TEXT',	'A Midew is a practitioner of Midewiwin, the traditional Anishinaabe religion. While normally a peaceful, secretive religion, during Pontiac''s War the Midew were a catalyst, uniting various nations against the Americans and their ways.'),
			('TXT_KEY_BUILD_CLMIDEWINFLUENCE_HELP',				'Convince this City-State to declare war on your enemies!'),
			('TXT_KEY_PROMOTION_CLFANATICISM',					'Fanatic'),
			('TXT_KEY_PROMOTION_CLFANATICISM_HELP',				'Deal 15% extra damage when attacking or defending a city.'),
			('TXT_KEY_CLMIDEW_DIALOG',							'Choose an enemy for {1_CS} to attack.'),
			('TXT_KEY_CLMIDEW_NO',								'No'),
			('TXT_KEY_CLMIDEW_NONE',							'No enemies.'),
			('TXT_KEY_CHOOSE_WAR_TARGET',						'Choose a target for this City-State to attack.'),
			('TXT_KEY_CLMIDEW_NEVER',							'Never'),
			('TXT_KEY_CLMIDEW_NO_TOOLTIP',						'Do not use this Midew to incite this City-State to war.'),
			('TXT_KEY_CLMIDEW_NEVER_TOOLTIP',					'Never coerce this City-State to start wars. It is best kept in a state of peace.'),
			('TXT_KEY_CLMIDEW_ENEMY_TOOLTIP',					'Cause this City-State to attack this civilization.');