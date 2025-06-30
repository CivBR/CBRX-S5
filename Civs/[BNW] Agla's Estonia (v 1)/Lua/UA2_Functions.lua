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

function JFDGame_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = JFDGame_IsAAActive()

function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end

-- ======= --
-- DEFINES --
-- ======= --


include("FLuaVector.lua")


local iCiv = GameInfoTypes["CIVILIZATION_AGLA_ESTONIA"]
local bIsActive = JFD_IsCivilisationActive(iCiv)


-- ========================================= --
-- UA: HIGHER GROWTH RATE FROM WRITTEN WORKS --
-- ========================================= --

local iGrowthDummy = GameInfoTypes["BUILDING_AGLA_ESTONIA_MUSIC"]

local tGWWBuildings = {}
tGWWBuildings[0] = iRingfortClass
local iTableVal = 1
for row in DB.Query("SELECT ID, Description FROM BuildingClasses WHERE DefaultBuilding IN (SELECT Type FROM Buildings WHERE GreatWorkCount > 0 AND GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC')") do
	print("Adding " .. tostring(row.Description) .. " to tGWWBuildings")
	tGWWBuildings[iTableVal] = row.ID
	iTableVal = iTableVal + 1
end

function GaelicGrowthFromWriting(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		for pCity in pPlayer:Cities() do
			local iTotalGWHere = pCity:GetNumGreatWorks()
			local iGWCounted = 0
			for k, vClass in pairs(tGWWBuildings) do
				local iGWInBuilding = pCity:GetNumGreatWorksInBuilding(vClass)
				iGWCounted = iGWCounted + iGWInBuilding
				if iGWCounted >= iTotalGWHere then
					break
				end
			end
			pCity:SetNumRealBuilding(iGrowthDummy, iGWCounted)
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(GaelicGrowthFromWriting)
end
