--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
--==========================================================================================================================	
-- USER SETTINGS
--==========================================================================================================================	
-- Modular Features that can be toggled on and off and then back on.
--------------------------------------------------------------------------
/*CORE SETTINGS
---------------
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																		Value)
VALUES	('JFD_CIVILIZATIONS_KALMAR_UNION_CORE_NOTIFICATION_FIRST_JOIN_TURNS',		10), --Turns before a Notification is sent about a City State's joinage to the Kalmar Union (first time). 0 to disable.
		('JFD_CIVILIZATIONS_KALMAR_UNION_CORE_NOTIFICATION_SECOND_JOIN_TURNS',		5);  --Turns before a Notification is sent about a City State's joinage to the Kalmar Union (second time). 0 to disable.
--==========================================================================================================================	
--==========================================================================================================================	