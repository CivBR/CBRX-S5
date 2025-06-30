-- Insert SQL Rules Here 
--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('TlingitDecisions.lua');
--==========================================================================================================================

insert into Language_en_US (Tag, Text)
values ('TXT_KEY_DECISIONS_CLTLINGITSLAVERAID_NO_NAME', 'Raid City State for slaves'),
	   ('TXT_KEY_DECISIONS_CLTLINGITSLAVERAID_NO_DESC', 'We require workers to toil under our demense. The people of a nearby city-state have become lazy and well-fed. We will strike swiftly from the seas, without mercy!'),
	   ('TXT_KEY_DECISIONS_CLTLINGITSLAVERAID_NAME', 'Raid {1_City} for slaves'),
	   ('TXT_KEY_DECISIONS_CLTLINGITSLAVERAID_DESC', 'We require workers to toil under our demense. The people of {1_City} have become lazy and well-fed. We will strike swiftly from the seas, without mercy!'),
	   ('TXT_KEY_DECISIONS_CLTLINGITSLAVERAID_ADOPTED', 'Rewards:[NEWLINE][ICON_BULLET]A free Worker appears in your capital.'),
	   ('TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_NO_NAME', 'Raise a Shame Totem Against A Foreign Leader'),
	   ('TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_NO_DESC', 'A foreign leader has done us a great dishonor. In order to shame him into repentance, we will raise a totem with his likeness inscribed on it for all to see.'),
	   ('TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_NAME', 'Raise a Shame Totem Against {1_leader}'),
	   ('TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_DESC', '{1_leader} has done us a great dishonor. In order to shame him into repentance, we will raise a totem with his likeness inscribed on it for all to see.'),
	   ('TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_ENACTED', 'Rewards:[NEWLINE][ICON_BULLET]The next time {2_civ} has a Golden Age, it will end abruptly when the Golden Age has 7 turns left.');

