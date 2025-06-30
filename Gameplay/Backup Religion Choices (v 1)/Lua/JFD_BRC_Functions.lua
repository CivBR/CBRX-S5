-- JFD_BRC_Functions
-- Author: Deo-e + Coiot
-- DateCreated: 1/28/2020 8:52:57 AM
-- Edited: 3/21/2025 (Coiot)
--------------------------------------------------------------

-- g_Civilization_Religions_Table
local g_Civilization_Religions_Table = {}
local g_Civilization_Religions_Count = 1

local query = DB.Query("SELECT * FROM Civilization_Religions;")
if query then
	for row in query do
		g_Civilization_Religions_Table[g_Civilization_Religions_Count] = row
		g_Civilization_Religions_Count = g_Civilization_Religions_Count + 1
	end
else
	print("Failed to load Civilization_Religions")
end

function Player_GetReligionToFound(playerID, religionID, religionIsAlreadyFounded)
	if not religionID then return religionID end
	if not religionIsAlreadyFounded then return religionID end

	local player = Players[playerID]
	local civInfo = GameInfo.Civilizations[player:GetCivilizationType()]
	if not civInfo then return religionID end

	local civType = civInfo.Type
	local religionsTable = g_Civilization_Religions_Table
	local numReligions = g_Civilization_Religions_Count - 1

	for index = 1, numReligions do
		local row = religionsTable[index]
		local thisReligionID = GameInfoTypes[row.ReligionType]

		if thisReligionID and civType == row.CivilizationType and thisReligionID ~= religionID then
			if Game.AnyoneHasReligion and not Game.AnyoneHasReligion(thisReligionID) then
				religionID = thisReligionID
				break
			end
		end
	end

	return religionID
end

GameEvents.GetReligionToFound.Add(Player_GetReligionToFound)
