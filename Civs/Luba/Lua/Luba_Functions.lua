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

include("AdditionalAchievementsUtility.lua")
include("FLuaVector.lua")

local iCiv = GameInfoTypes["CIVILIZATION_THP_LUBA"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

-- ============================================== --
-- UA: INSTANTLY FILL GW SLOT IN CONQUERED CITIES --
-- ============================================== --

local iWriter, iArtist, iMusician = GameInfoTypes["UNIT_WRITER"], GameInfoTypes["UNIT_ARTIST"], GameInfoTypes["UNIT_MUSICIAN"]
local iGreatWorkMission = GameInfoTypes["MISSION_CREATE_GREAT_WORK"]

local tGWBuildingInfo = {}
for row in DB.Query("SELECT * FROM Buildings WHERE GreatWorkCount > 0") do
	-- art as default case in case of mods that add extra GW types
	local iUnitType = iArtist

	local sSlot = row.GreatWorkSlotType
	if sSlot == "GREAT_WORK_SLOT_LITERATURE" then
		iUnitType = iWriter
	elseif sSlot == "GREAT_WORK_SLOT_MUSIC" then
		iUnitType = iMusician
	end
	tGWBuildingInfo[row.ID] = {Slots=row.GreatWorkCount, Name=Locale.ConvertTextKey(row.Description), Unit=iUnitType, Class=GameInfoTypes[row.BuildingClass]}
end

function Luba_ConquestGivesFreeGW(oldPlayerID, bCap, iX, iY, newPlayerID)
	local pPlayer = Players[newPlayerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local pCity = Map.GetPlot(iX, iY):GetPlotCity()
		if pCity:GetNumGreatWorks() < pCity:GetNumGreatWorkSlots() then
			for k, v in pairs(tGWBuildingInfo) do
				if pCity:IsHasBuilding(k) then
					local iWorksHeld = pCity:GetNumGreatWorksInBuilding(v.Class)
					if iWorksHeld < v.Slots then
						local pGreatPerson = pPlayer:InitUnit(v.Unit, iX, iY)
						pGreatPerson:PushMission(iGreatWorkMission)
						if pPlayer:IsHuman() then
							local sCityName = pCity:GetName()
							Events.GameplayAlertMessage("Your conquest of " .. sCityName .. " allows you to fill the Great Work slot in its " .. v.Name .. "!")
						end
						break
					end
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.CityCaptureComplete.Add(Luba_ConquestGivesFreeGW)
end

-- ====================================== --
-- UA: STARTING XP PER TYPE OF GREAT WORK --
-- ====================================== --

function Luba_StartingExpPerGW(playerID, cityID, unitID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local pCity = pPlayer:GetCityByID(cityID)
		if pCity:GetNumGreatWorks() > 0 then
			local iNumTypes = 0
			local bHasWriting, bHasMusic, bHasArt = false, false, false
			for kBuilding, v in pairs(tGWBuildingInfo) do
				if pCity:IsHasBuilding(kBuilding) then
					if pCity:GetNumGreatWorksInBuilding(v.Class) > 0 then
						if (v.Unit == iWriter) and not bHasWriting then
							iNumTypes = iNumTypes + 1
							bHasWriting = true
						elseif (v.Unit == iMusician) and not bHasMusic then
							iNumTypes = iNumTypes + 1
							bHasMusic = true
						elseif not bHasArt then
							iNumTypes = iNumTypes + 1
							bHasArt = true
						end
					end
				end
				if iNumTypes >= 3 then break end
			end
			
			if iNumTypes > 0 then
				local pUnit = pPlayer:GetUnitByID(unitID)
				pUnit:ChangeExperience(5 * iNumTypes)
			end
		end
	end
end

if bIsActive then
	GameEvents.CityTrained.Add(Luba_StartingExpPerGW)
end

-- ================================== --
-- UU: GREAT ARTIST POINTS FROM KILLS --
-- ================================== --

local iArtistSpec = GameInfoTypes["SPECIALIST_ARTIST"]
local iNzappaZap = GameInfoTypes["UNIT_THP_NZAPPA_ZAP"]

local iSavedKillerID = -1

function Luba_NzappaZapPrekill(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	if bDelay then
		iSavedKillerID = killerID
	elseif (iSavedKillerID > -1) then
		local pPlot = Map.GetPlot(iX, iY)
		local pUnit = pPlot:GetUnit(0)
		if (pUnit:GetUnitType() == iNzappaZap) and (pUnit:GetOwner() == iSavedKillerID) then
			local pPlayer = Players[iSavedKillerID]
			local pCap = pPlayer:GetCapitalCity()
			if pCap then
				local iVictimStrength = GameInfo.Units[unitType].Combat
				local iNumPoints = math.ceil(iVictimStrength / 3)
				pCap:ChangeSpecialistGreatPersonProgressTimes100(iArtistSpec, (iNumPoints * 100))
				if Players[iSavedKillerID]:IsHuman() then
					local sMessage = "+" .. iNumPoints .. " [ICON_GREAT_PEOPLE]"
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
				end
			end
		end
		-- reset this value at end
		iSavedKillerID = -1
	end
end

if bIsActive then
	GameEvents.UnitPrekill.Add(Luba_NzappaZapPrekill)
end

-- =================================== --
-- UU: NO RESISTANCE FROM CITY CAPTURE --
-- =================================== --

function Luba_NzappaZapCityCapture(oldPlayerID, bCap, iX, iY, newPlayerID)
	local bValidForAA = false
	local pPlot = Map.GetPlot(iX, iY)
	local pUnit = pPlot:GetUnit(0)
	if pUnit and pUnit:GetUnitType() == iNzappaZap then
		local pCity = pPlot:GetPlotCity()
		-- for some reason there's no Set method for resistance turns
		local iResistance = pCity:GetResistanceTurns()
		pCity:ChangeResistanceTurns(-iResistance)
		bValidForAA = true
	end
	
	if isAAActive and bValidForAA then
		if IsAAUnlocked('AA_THP_LUBA_SPECIAL') then return end
		local pPlayer = Players[newPlayerID]
		if pPlayer:IsHuman() then
			-- catch potential nil value errors (though there shouldn't be any)
			iNumNzappaZapCaptures = (iNumNzappaZapCaptures + 1) or 1
			if iNumNzappaZapCaptures >= 2 then
				UnlockAA('AA_THP_LUBA_SPECIAL')
			end
		end
	end
end

if bIsActive then
	GameEvents.CityCaptureComplete.Add(Luba_NzappaZapCityCapture)
end

-- ==================================== --
-- UB: GROWTH BONUS FOR FILLED GW SLOTS --
-- ==================================== --

local classCastle = GameInfoTypes["BUILDINGCLASS_CASTLE"]
local iFoodDummy = GameInfoTypes["BUILDING_THP_LUBA_FOOD_DUMMY"]
local iMemoryLodge = GameInfoTypes["BUILDING_THP_MBUDYE_LODGE"]

function Luba_MbudyeGrowthBonus(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:CountNumBuildings(iMemoryLodge) > 0 then
		for pCity in pPlayer:Cities() do
			local iNumDummies = 0
			if pCity:IsHasBuilding(iMemoryLodge) then
				iNumDummies = pCity:GetNumGreatWorksInBuilding(classCastle)
			end
			pCity:SetNumRealBuilding(iFoodDummy, iNumDummies)
		end
	elseif pPlayer:CountNumBuildings(iFoodDummy) > 0 then
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iFoodDummy, 0)
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Luba_MbudyeGrowthBonus)
end

-- ========== --
-- AA SUPPORT --
-- ========== --

if isAAActive then
	-- see NzappaZapCityCapture for main part of this
	local iNumNzappaZapCaptures = 0
	
	function Luba_ResetAACounter(playerID)
		if playerID == 0 then
			iNumNzappaZapCaptures = 0
		end
	end
	
	GameEvents.PlayerDoTurn.Add(Luba_ResetAACounter)
end
