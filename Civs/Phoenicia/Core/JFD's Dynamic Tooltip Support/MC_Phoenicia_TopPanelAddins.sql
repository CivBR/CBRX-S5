--==========================================================================================================================	
-- JFD_TopPanelIncludes
--==========================================================================================================================			
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelIncludes (
	FileName				text		default null);
	
INSERT OR REPLACE INTO JFD_TopPanelIncludes
		(FileName)
VALUES	('MC_Phoenicia_DynamicTopPanelSupport.lua');
--==========================================================================================================================		
-- JFD_TopPanelAdditions
--==========================================================================================================================		
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelAdditions (
	CivilizationType		text		REFERENCES Civilizations(Type) 	default null,
	YieldType  				text 										default null,
	YieldSourceFunction 	text										default null,
	YieldSourceToolTip		text										default	null,
	MiscToolTipFunction		text										default	null);
	
INSERT OR REPLACE INTO JFD_TopPanelAdditions
		(CivilizationType,					YieldType,			YieldSourcefunction,		YieldSourceToolTip)
VALUES	('CIVILIZATION_MC_PHOENICIA',		'YIELD_GOLD',		'MC_PhoenicianAlphabet',	'TXT_KEY_MC_PHOENICIA_TOPPANEL_GOLD');
--==========================================================================================================================		
--==========================================================================================================================		
