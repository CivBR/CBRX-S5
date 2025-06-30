--------------------------------------------------------------
-- Included Files
--------------------------------------------------------------
include("AdditionalAchievementsUtility.lua")
--------------------------------------------------------------
-- Utility Functions
--------------------------------------------------------------
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus.SS_TAKEN or slotStatus == SlotStatus.SS_COMPUTER) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end

	return false
end

function Game_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = Game_IsAAActive()

--------------------------------------------------------------
-- Localized Variables
--------------------------------------------------------------
local civilizationID = GameInfoTypes.CIVILIZATION_MC_MYSORE

local achievementID = GameInfoTypes.AA_MC_MYSORE_SPECIAL
local resourceID = GameInfoTypes.RESOURCE_SHEEP
--------------------------------------------------------------
-- MC_SecretSanta_OnPlayerDoTurn
--------------------------------------------------------------
function MC_SecretSanta_OnPlayerDoTurn(playerID)
	local player = Players[playerID]
	if not isAAActive then return end
	if not player:IsAlive() then return end
	if player:IsBarbarian() or player:IsMinorCiv() then return end
	-- ADDITIONAL ACHIEVEMENTS
	if player:GetCivilizationType() == civilizationID and not IsAAUnlocked(achievementID) then
		if player:GetNumResourceTotal(resourceID, true) > 5 then
			UnlockAA(achievementID)
		end
	end
end

GameEvents.PlayerDoTurn.Add(MC_SecretSanta_OnPlayerDoTurn)