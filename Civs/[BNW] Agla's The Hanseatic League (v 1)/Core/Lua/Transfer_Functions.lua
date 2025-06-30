--=======================================================================================================================
-- PorkBean's Republic of Libertatia
--=======================================================================================================================
include("FLuaVector.lua")
include("PlotIterators")
include("C15_IteratorPack_v3.lua")

local iLiberiCiv = GameInfoTypes.CIVILIZATION_AGLA_HANSE_WULLENWEVER;


------------------------------------------------------------------------------------------------------------------------
-- GetPlayerByCivilization
------------------------------------------------------------------------------------------------------------------------
function GetPlayerByCivilization(civilizationType)
	for _, pPlayer in pairs(Players) do
		if pPlayer:GetCivilizationType() == civilizationType then 
			return pPlayer
		end
	end
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
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

local isLiberiCivActive = JFD_IsCivilisationActive(iLiberiCiv);
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--=======================================================================================================================

--=======================================================================================================================
-- UNIQUE UNIT: Man-of-war
--=======================================================================================================================

-- C15 --
local iMOWGivePromotion = GameInfoTypes.PROMOTION_AGLA_TRANSFER_MOVEMENT
local iMOW = GameInfoTypes.UNIT_AGLA_HANSE_COG
local iOcean = TerrainTypes["TERRAIN_COAST"];
------------------------------------------------------------------------------------------------------------------------
-- ManofwarGiveMovement
------------------------------------------------------------------------------------------------------------------------
function ManofwarGiveMovement(iPlayer)
	local pPlayer = Players[iPlayer]	
	for pUnit in pPlayer:Units() do
		-- C15 --
		--if pUnit:IsHasPromotion(iMOWGivePromotion) then
		if pUnit:GetUnitType() == iMOW then
		-- /C15 --
			local pPlot = pUnit:GetPlot()
			-- C15 --
			local iMovement = pUnit:GetMoves()
			-- /C15 --
			for unit in C15_PlotUnitsIterator(pPlot) do
				-- C15 --
				--local iMovement = unit:GetMoves()
				iMovement = math.max(unit:GetMoves(), iMovement)
				--if (not unit:IsCombatUnit()) then
				if unit:IsEmbarked() and (not unit:IsCombatUnit()) then
					--unit:SetMoves(iMovement*2)
					unit:SetMoves(iMovement)
					-- /C15 --
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(ManofwarGiveMovement);
------------------------------------------------------------------------------------------------------------------------
