-- ========= --
-- UTILITIES --
-- ========= --

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)

function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, iPracticalNumCivs, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end

function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end

-- ======= --
-- DEFINES --
-- ======= --

local iCiv = GameInfoTypes["CIVILIZATION_AGLA_HANSE_WULLENWEVER"]
local bIsActive = JFD_IsCivilisationActive(iCiv)


-- ========================================== --
-- UU: LIKEDEELER HAS BAD PROMO PRE-ASTRONOMY --
-- ========================================== --
local iLikedeeler = GameInfoTypes["UNIT_AGLA_HANSE_COG"]
local iAstronomy = GameInfoTypes["TECH_ASTRONOMY"]
local iNoAstro = GameInfoTypes["PROMOTION_HANSE_NO_ASTRONOMY"]
local iPrivateerClass = GameInfoTypes["UNITCLASS_CARAVEL"]

function Pomerania_NewLikedeelerNoAstro(playerID, cityID, unitID)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	-- C15 --
	--if pUnit:GetUnitType() == iLikedeeler then
	if pUnit:GetUnitType() == iLikedeeler and pUnit:GetUnitClassType() == iPrivateerClass then
	-- /C15 --
		if not Teams[pPlayer:GetTeam()]:IsHasTech(iAstronomy) then
			pUnit:SetHasPromotion(iNoAstro, true)
		end
	end
end

-- C15 --
-- Idk why this Lua is required when the Promotion is given through the database anyway but the steam comments make it sound like it's necessary and that an Upgrade event needs to be added too
function C15_Agla_UU_Upgrade(playerID, iUnit, iNewUnit)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(iNewUnit)
	if pUnit:GetUnitType() == iLikedeeler and pUnit:GetUnitClassType() == iPrivateerClass then
		if not Teams[pPlayer:GetTeam()]:IsHasTech(iAstronomy) then
			pUnit:SetHasPromotion(iNoAstro, true)
		end
	end
end

GameEvents.UnitUpgraded.Add(C15_Agla_UU_Upgrade)
-- /C15 --

function Pomerania_GetAstronomy(teamID, techID, bHas)
	if (not bHas) then return end
	if techID == iAstronomy then
		for kID, vPlayer in ipairs(Players) do
			if (vPlayer:GetTeam() == teamID) and (vPlayer:GetCivilizationType() == iCiv) and (vPlayer:HasUnitOfClassType(iPrivateerClass)) then
				for pUnit in vPlayer:Units() do
					if pUnit:GetUnitType() == iLikedeeler then
						pUnit:SetHasPromotion(iNoAstro, false)
					end
				end
			end
		end
	end
end

-- C15 --
--if bIsActive then
if true then -- CP lets CSs gift naval UUs and the efficiency difference is literally irrelevant
-- /C15 --
	GameEvents.CityTrained.Add(Pomerania_NewLikedeelerNoAstro)
	GameEvents.TeamSetHasTech.Add(Pomerania_GetAstronomy)
end

