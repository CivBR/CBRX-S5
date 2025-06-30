--Age of Imperialism - The Dervish State
--Maara-weyn
--Civitar, Zantonius Hamm, DMS
--==========================================================================================================================
-- includes
--==========================================================================================================================
include("PlotIterators.lua");
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- DMS_GetUserSetting (adapted from JFD's JFD_GetUserSetting - credit goes there!)
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetUserSetting(type)
	for row in GameInfo.DMS_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================

----------------------------------------------------------------------------------------------------------------------------
--HasTrait
----------------------------------------------------------------------------------------------------------------------------
function HasTrait(player, traitID)
	if isCPDLL then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
----------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendNotification
------------------------------------------------------------------------------------------------------------------------
function JFD_SendNotification(playerID, notificationType, description, descriptionShort, global, iX, iY)
	local player = Players[playerID]
	if global then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
	else
		if player:IsHuman() then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
		end
	end
end
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
-- Globals
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 					= Game.GetActivePlayer()
local activePlayer 						= Players[activePlayerID]
local activePlayerTeam 					= Teams[Game.GetActiveTeam()]
local civilisationDervishStateID		= GameInfoTypes["CIVILIZATION_AGLA_SCYTHIA"]
local isDervishStateCivActive 			= JFD_IsCivilisationActive(civilisationDervishStateID)
local isDervishStateActivePlayer 		= activePlayer:GetCivilizationType() == civilisationDervishStateID

local traitHornResistanceID				= GameInfoTypes["TRAIT_AGLA_SCYTHIA"]

local unitCavalry						= GameInfoTypes["UNIT_CAVALRY"]


local unitCombatMounted					= GameInfoTypes["UNITCOMBAT_MOUNTED"]
local promotionSharia					= GameInfoTypes["PROMOTION_AGLA_STEPPE_PROMO_1"]
local promotionDefendersOfFreedom		= GameInfoTypes["PROMOTION_AGLA_STEPPE_PROMO_2"]







--==========================================================================================================================
-- MAIN FUNCTIONS	
--==========================================================================================================================
-- AoI_FirstDervishMountedPromotion
----------------------------------------------------------------------------------------------------------------------------
function AoI_FirstDervishMountedPromotion(PlayerID, CityID, UnitID)

	local pPlayer = Players[PlayerID]
	if HasTrait(pPlayer, traitHornResistanceID) then
		
		local pUnit = pPlayer:GetUnitByID(UnitID)
		if pUnit and pUnit:GetUnitCombatType() == unitCombatMounted then
			
			pUnit:SetHasPromotion(promotionSharia, true)
			
		end
	end
end

GameEvents.CityTrained.Add(AoI_FirstDervishMountedPromotion)
----------------------------------------------------------------------------------------------------------------------------
-- AoI_DervishMountedPromotions
----------------------------------------------------------------------------------------------------------------------------
function AoI_DervishMountedPromotions(PlayerID, UnitID)
	
	local pPlayer = Players[PlayerID]
	if HasTrait(pPlayer, traitHornResistanceID) then
	
		local pUnit = pPlayer:GetUnitByID(UnitID);
		if pUnit and pUnit:GetUnitCombatType() == unitCombatMounted then
	
			-- LEVEL 2
			if (pUnit:GetLevel() == 2) then
				pUnit:SetHasPromotion(promotionDefendersOfFreedom, true)
				if not pUnit:IsHasPromotion(promotionSharia) then
					pUnit:SetHasPromotion(promotionSharia, true)
				end
			-- LEVEL 3
			elseif (pUnit:GetLevel() == 4) then
					pUnit:SetHasPromotion(promotionTheDervishes, true)
	
				if not pUnit:IsHasPromotion(promotionSharia) then
					pUnit:SetHasPromotion(promotionSharia, true)
					end
				if not pUnit:IsHasPromotion(promotionDefendersOfFreedom) then
					pUnit:SetHasPromotion(promotionDefendersOfFreedom, true)
				end
			end
		end
	end
end

GameEvents.UnitPromoted.Add(AoI_DervishMountedPromotions)
------------------------------------------------------------------------------------------------------------------