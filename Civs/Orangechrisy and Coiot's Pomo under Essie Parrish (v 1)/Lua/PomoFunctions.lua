--------------------------------------------------------------
-- Globals
--------------------------------------------------------------
local iPomo = GameInfoTypes["CIVILIZATION_ORG_COIOT_POMO"]

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

local bIsActive = JFD_IsCivilisationActive(iPomo)

include("PlotIterators.lua")
--------------------------------------------------------------
-- Spirits of the Four Directions (UA)
--------------------------------------------------------------
local lastConvertedX, lastConvertedY = nil, nil
local tDirections = {"East", "North", "West", "South"}
local iMarkerDummy = GameInfoTypes["BUILDING_POMO_CONVERT_MARKER_DUMMY"]
local iSouthPromo = GameInfoTypes["PROMOTION_ORG_COIOT_SOUTH"]
local iNorthPromo = GameInfoTypes["PROMOTION_ORG_COIOT_NORTH"]
local iEastBuilding = GameInfoTypes["BUILDING_ORG_COIOT_EAST"]
local iWestBuilding = GameInfoTypes["BUILDING_ORG_COIOT_WEST"]
local iProphetClass = GameInfoTypes["UNITCLASS_PROPHET"]
local iMissionaryClass = GameInfoTypes["UNITCLASS_MISSIONARY"]
local iInquisitorClass = GameInfoTypes["UNITCLASS_INQUISITOR"]

-- stolen from TopHat to set up religions
local tReligions = {}
function TabulateReligionsAtGameStart()
	for i = 0, (GameDefines.MAX_MAJOR_CIVS - 1), 1 do
		local pPlayer = Players[i]
		if pPlayer:HasCreatedReligion() then
			local iReligion = pPlayer:GetReligionCreatedByPlayer()
			tReligions[iReligion] = pPlayer
		end
	end
end

function AddNewReligionToTable(playerID, cityID, religionID)
	local pPlayer = Players[playerID]
	tReligions[religionID] = pPlayer
end

-- base code from my northern paiute code
function Pomo_LastCityConverted(playerID, religionID, iX, iY)
	local pPlot = Map.GetPlot(iX, iY)
	local pConvertedCity = pPlot:GetPlotCity()
	local pReligionOwner = tReligions[religionID] -- check against religion table
	if pReligionOwner and pReligionOwner:GetCivilizationType() == iPomo then
		if not pConvertedCity:GetReligiousMajority() == religionID then return end
		-- marker dummy indicates the city was already pomo religion majority
		if pConvertedCity:IsHasBuilding(iMarkerDummy) then return end
		pConvertedCity:SetNumRealBuilding(iMarkerDummy, 1)
		lastConvertedX, lastConvertedY = iX, iY
	else -- if religion is not pomo's and changes majority/continues to be majority (so turn off marker)
		if pConvertedCity:GetReligiousMajority() == religionID then
			pConvertedCity:SetNumRealBuilding(iMarkerDummy, 0)
		end
	end
end

-- ty coiot for the math bits of this
function Pomo_GetDirection(dy, dx)
	local angle = math.deg(math.atan2(dy, dx))
	if angle < 0 then angle = angle + 360 end
	local index = math.floor((angle + 45) / 90) % 4 + 1
	local direction = tDirections[index]
	return direction
end

function Pomo_GetDirectionFromCapital(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() ~= iPomo then return end
	local pCapital = pPlayer:GetCapitalCity()
	if not pCapital then return end -- no capital :(
	if not lastConvertedX then return end -- no cities converted yet

	local dx = lastConvertedX - pCapital:GetX()
	local dy = lastConvertedY - pCapital:GetY()
	local direction = Pomo_GetDirection(dy, dx)
	if (pPlayer:IsHuman()) then
		Events.GameplayAlertMessage("Last coverted city was to the [COLOR_YIELD_FOOD]" .. direction .. "[ENDCOLOR]!")
	end
	-- reset directional abilities (maybe do a check to see if same direction to see if not needing to reset (at least for south and east which dont change turn to turn)
	local tReligiousUnits = {}
	for pUnit in pPlayer:Units() do
		pUnit:SetHasPromotion(iSouthPromo, false)
		pUnit:SetHasPromotion(iNorthPromo, false)
		if (pUnit:GetUnitClassType() == iProphetClass) or (pUnit:GetUnitClassType() == iMissionaryClass) or (pUnit:GetUnitClassType() == iInquisitorClass) then
			table.insert(tReligiousUnits, pUnit)
		end
	end
	for pCity in pPlayer:Cities() do
		pCity:SetNumRealBuilding(iWestBuilding, 0)
	end
	pCapital:SetNumRealBuilding(iEastBuilding, 0)

	-- abilities for the four directions
	if direction == "North" then
        for k, v in pairs(tReligiousUnits) do
			local pPlot = v:GetPlot()
			for pPlot in PlotAreaSpiralIterator(pPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				local pUnit = pPlot:GetUnit()
				if pUnit and pUnit:GetCivilizationType() == iPomo then
					pUnit:SetHasPromotion(iNorthPromo, true)
					pUnit:SetMoves(pUnit:MaxMoves())
				end
			end
		end
	elseif direction == "South" then
		for pUnit in pPlayer:Units() do
			pUnit:SetHasPromotion(iSouthPromo, true)
		end
	elseif direction == "East" then
		pCapital:SetNumRealBuilding(iEastBuilding, 1)
	elseif direction == "West" then
		-- trade routes from you count on originating city
        for k, v in pairs(pPlayer:GetTradeRoutes()) do
			local pCity = v.FromCity
			local existing = pCity:GetNumRealBuilding(iWestBuilding)
			pCity:SetNumRealBuilding(iWestBuilding, existing + 1)
		end
		-- trade routes to you count on destination city
		for k, v in pairs(pPlayer:GetTradeRoutesToYou()) do
			local pCity = v.ToCity
			local existing = pCity:GetNumRealBuilding(iWestBuilding)
			pCity:SetNumRealBuilding(iWestBuilding, existing + 1)
		end
	end
end

if bIsActive then
	GameEvents.CityConvertsReligion.Add(Pomo_LastCityConverted)
	GameEvents.PlayerDoTurn.Add(Pomo_GetDirectionFromCapital)
	Events.SequenceGameInitComplete.Add(TabulateReligionsAtGameStart)
	GameEvents.ReligionFounded.Add(AddNewReligionToTable)
end
--------------------------------------------------------------
-- Roundhouse (UB)
--------------------------------------------------------------
local iDanceCave = GameInfoTypes["BUILDING_ORG_COIOT_ROUNDHOUSE"]
local iDanceCaveFaith = GameInfoTypes["BUILDING_ORG_COIOT_RH_FAITH"]
local iDanceCavePressure = GameInfoTypes["BUILDING_ORG_COIOT_RH_PRESSURE"]

function Pomo_DanceCaveDoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() ~= iPomo then return end
	for pCity in pPlayer:Cities() do
		pCity:SetNumRealBuilding(iDanceCaveFaith, 0)
		pCity:SetNumRealBuilding(iDanceCavePressure, 0)
		if pCity:IsHasBuilding(iDanceCave) then
			local iPop = math.floor(pCity:GetPopulation() / 4)
			pCity:SetNumRealBuilding(iDanceCaveFaith, iPop)
			local iGreatWorks = pCity:GetNumGreatWorks()
			pCity:SetNumRealBuilding(iDanceCavePressure, iGreatWorks)
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Pomo_DanceCaveDoTurn)
end
--------------------------------------------------------------
-- Basket Weaver (UU) -- adapted from Chrisy15 and Vice Virtuoso's code in Emerald's Thayae Khittaya (the two Pomo_ functions are my own)
--------------------------------------------------------------
local iBasketWeaver = GameInfoTypes["UNIT_ORG_COIOT_BASKET_WEAVER"]
local iBWDummyN = GameInfoTypes["BUILDING_ORG_COIOT_BW_NORTH"]
local iBWDummyS = GameInfoTypes["BUILDING_ORG_COIOT_BW_SOUTH"]
local iBWDummyE = GameInfoTypes["BUILDING_ORG_COIOT_BW_EAST"]
local iBWDummyW = GameInfoTypes["BUILDING_ORG_COIOT_BW_WEST"]
local bPopup

local tGreatBaskets = {}
for row in DB.Query("SELECT ID FROM GreatWorks WHERE Type LIKE 'GREAT_WORK_ORG_COIOT_BASKET_%'") do
	tGreatBaskets[row.ID] = true
end

local tGreatWorkBuildings = {}
for row in DB.Query("SELECT ID, BuildingClass, GreatWorkCount FROM Buildings WHERE GreatWorkCount > 0 AND GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT'") do
	tGreatWorkBuildings[row.ID] = {Class = GameInfoTypes[row.BuildingClass], SlotCount = row.GreatWorkCount}
end
-----------------------------------
--C15_CountNumGreatBasketsInCity
--Credit to Vice Virtuouso 
-----------------------------------
function C15_CountNumGreatBasketsInCity(pCity) 
	local iCount = 0
	for k, v in pairs(tGreatWorkBuildings) do
		if pCity:IsHasBuilding(k) then
			for i = 0, v.SlotCount - 1 do
				local iWork = pCity:GetBuildingGreatWork(v.Class, i)
				-- if empty great work slots then iWork ends up being -1, which causes
				-- Game.GetGreatWorkType to return a large negative number, either that
				-- being given a -1 or the table being given a large negative number
				-- causes a crash on mac, but is fine on windows. so the iWork >= 0 is necessary
				if (iWork >= 0) and (tGreatBaskets[Game.GetGreatWorkType(iWork)]) then
					iCount = iCount + 1
				end
			end
		end
	end
	return iCount
end
-----------------------------------
--Pomo_GiveBonusBasedOnDirection
-----------------------------------
function Pomo_GiveBonusBasedOnDirection(pCity, iNumBaskets, direction)
	if direction == "North" then
		pCity:SetNumRealBuilding(iBWDummyN, pCity:GetNumRealBuilding(iBWDummyN) + iNumBaskets)
	elseif direction == "South" then
		pCity:SetNumRealBuilding(iBWDummyS, pCity:GetNumRealBuilding(iBWDummyS) + iNumBaskets)
	elseif direction == "East" then
		pCity:SetNumRealBuilding(iBWDummyE, pCity:GetNumRealBuilding(iBWDummyE) + iNumBaskets)
	elseif direction == "West" then
		pCity:SetNumRealBuilding(iBWDummyW, pCity:GetNumRealBuilding(iBWDummyW) + iNumBaskets)
	end
end
-----------------------------------
--Pomo_GreatBasketPlayerCheck
-----------------------------------
function Pomo_GreatBasketPlayerCheck(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() ~= iPomo then return end
	local pCapital = pPlayer:GetCapitalCity()
	if not pCapital then return end

	pCapital:SetNumRealBuilding(iBWDummyN, 0)
	pCapital:SetNumRealBuilding(iBWDummyS, 0)
	pCapital:SetNumRealBuilding(iBWDummyE, 0)
	pCapital:SetNumRealBuilding(iBWDummyW, 0)

	for i = 0, iPracticalNumCivs, 1 do
		local pOtherPlayer = Players[i]
		if pOtherPlayer and not pOtherPlayer:IsMinorCiv() and not pOtherPlayer:IsBarbarian() then
			for pCity in pOtherPlayer:Cities() do
				local iNumBaskets = C15_CountNumGreatBasketsInCity(pCity)
				local dy = pCity:GetY() - pCapital:GetY()
				local dx = pCity:GetX() - pCapital:GetX()
				local direction = Pomo_GetDirection(dy, dx)
				Pomo_GiveBonusBasedOnDirection(pCapital, iNumBaskets, direction)
			end
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(C15_GreatBasketPlayerCheck)
end

-- UI Popup events all ~~stolen~~ inspired by Vice Virtuouso
-----------------------------------
-- C15_GreatBasketUI
--Check all of a player's buildings when CultureOverview is updated (swapping Great Works around), and update the ~~Logia~~ ~~Emerlad~~ Orange bonus buildings accordingly
-----------------------------------
function C15_GreatBasketUI()
	if not bPopup then
		return
	end
	local iPlayer = Game.GetActivePlayer()
	Pomo_GreatBasketPlayerCheck(iPlayer)
end

if bIsActive then
	Events.SerialEventCityInfoDirty.Add(C15_GreatBasketUI)	
end
-----------------------------------
--C15_GreatBasket_SetCurrentPopup
--When a popup screen appears, check if it is CultureOverview. If so, set bPopup to true, which lets ~~UpdateLostLogiaBuildingsUI()~~ ~~C15_GreatCraftsPlayerCheck~~ Pomo_GreatBasketPlayerCheck fire
-----------------------------------
function C15_GreatBasket_SetCurrentPopup(popupInfo)
	local popupType = popupInfo.Type
	if popupType == ButtonPopupTypes.BUTTONPOPUP_CULTURE_OVERVIEW then
		bPopup = true
	end
end

if bIsActive then
	Events.SerialEventGameMessagePopup.Add(C15_GreatBasket_SetCurrentPopup)
end
-----------------------------------
--C15_GreatCraft_Popup
-----------------------------------
function C15_GreatBasket_Popup( popupInfo )
	if( popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_GREAT_WORK_COMPLETED_ACTIVE_PLAYER ) then
		return;
	end
	local iPlayer = Game.GetActivePlayer()
	Pomo_GreatBasketPlayerCheck(iPlayer)
end

if bIsActive then
	Events.SerialEventGameMessagePopup.Add(C15_GreatBasket_Popup)
end
-----------------------------------
--C15_GreatCraft_ClearCurrentPopup
--When a popup is closed, delete bPopup so it doesn't keep refreshing ~~Logia~~ ~~Emerlad~~ Orange buildings when CultureOverview isn't open
-----------------------------------
function C15_GreatBasket_ClearCurrentPopup()
	bPopup = nil;
end

if bIsActive then
	Events.SerialEventGameMessagePopupProcessed.Add(C15_Greatbasket_ClearCurrentPopup)
end