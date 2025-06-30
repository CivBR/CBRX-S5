-- Ternate_Functions
-- Author: User
-- DateCreated: 2/21/2019 8:42:43 PM
--------------------------------------------------------------
-- Ternate_Functions
-- Author: User
-- DateCreated: 2/21/2019 8:40:24 PM
--------------------------------------------------------------
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("IconSupport")
include("PlotIterators.lua")
include("AdditionalAchievementsUtility.lua")
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "GT_Ternate";
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetDistance	= Map.GetDistance
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local activeTeamID		= activePlayer:GetTeam()
local activeTeam		= Teams[activeTeamID]
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- CORE UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = Game_IsCPActive()
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if g_IsCPActive then 
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
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
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

-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
-- GT_GetUserSetting
function GT_GetUserSetting(type)
	for row in GameInfo.GT_Ternate_UserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end

-- GT_Print
local printForDebugBabullah = GT_GetUserSetting("GT_TERNATE_DEBUGGING_ON") == 1
function TernatePrint(string)
	if (not printForDebugBabullah) then
		return
	else
		return print(string)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- GetNearestCity
----------------------------------------------------------------------------------------------------------------------------
function GetNearestCity(player, plot)
    local distance = 9999
    for city in player:Cities() do
        local cityPlot = city:Plot()
        local between = Map.PlotDistance(cityPlot:GetX(), cityPlot:GetY(), plot:GetX(), plot:GetY())
        if between < distance then
            distance = between
            closest = city
        end
    end
    return closest
end
-- DMS_GetMajorityReligion
function DMS_GetMajorityReligion(player)
	local ownReligion = nil
	if isCPDLL and (not bUserSettingPiety) then
		if player.GetOriginalReligionCreatedByPlayer then
			ownReligion = player:GetOriginalReligionCreatedByPlayer()
		else
			ownReligion = player:GetReligionCreatedByPlayer()
		end
	elseif isCPDLL and bUserSettingPiety then 
		if player:HasStateReligion() then
			ownReligion = player:GetStateReligion()
		else
			ownReligion = player:GetCapitalCity():GetReligiousMajority()
		end
	elseif (not isCPDLL) then
		if player:HasCreatedReligion() then
			ownReligion = player:GetReligionCreatedByPlayer()
		elseif player:GetCapitalCity() and player:GetCapitalCity():GetReligiousMajority() ~= -1 then
			ownReligion = player:GetCapitalCity():GetReligiousMajority()
		else
			ownReligion = nil
		end
	end
	return ownReligion
end
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
--Game_IsAAActive
function Game_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = Game_IsAAActive()
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
local civilizationID = GameInfoTypes["CIVILIZATION_GT_TERNATE"]
local traitTernateID = GameInfoTypes["TRAIT_GT_SEVENTY_TWO_ISLANDS"]
local unitArumbaiID	= GameInfoTypes["UNIT_GT_ARUMBAI"]
local buildingNgarahLamoID = GameInfoTypes["BUILDING_GT_NGARAH_LAMO"]
local IsTernateActivePlayer = activePlayer:GetCivilizationType() == civilizationID
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
--[USE BRACKETS IF WORKS]
-------------------------------------
-- OVERLORD OF SEVENTY-TWO ISLANDS --
-------------------------------------
--[WORKS]
local unitMissionaryID = GameInfoTypes["UNIT_MISSIONARY"]
local unitProphetID = GameInfoTypes["UNIT_PROPHET"]
local buildingSeventyTwoIslands = GameInfoTypes["BUILDING_GT_SEVENTY_TWO_ISLANDS"]
function GT_Ternate_SeventyTwoIslands_ProphetExpended(unitOwnerID, unitID, unitType, plotX, plotY, isDelay, killingPlayerID)
	local player = Players[unitOwnerID]
	if killingPlayerID == -1 then
		if player then
			TernatePrint("GT_Ternate_SeventyTwoIslands_ProphetExpended: Missionary/Prophet expended")
			local unit = player:GetUnitByID(unitID)
			local plot = unit:GetPlot()
			if HasTrait(player, traitTernateID) then
				TernatePrint("GT_Ternate_SeventyTwoIslands_ProphetExpended: expendee is ternate")
				if Players[plot:GetOwner()] ~= playerID and Players[plot:GetOwner()] ~= -1 then
					TernatePrint("GT_Ternate_SeventyTwoIslands_ProphetExpended: expended in enemy territory")
					local city = plot:GetWorkingCity()
					local cityPlayer = Players[city:GetOwner()]
					TernatePrint("GT_Ternate_SeventyTwoIslands_PlayerDoTurn: detecting city player")
					if cityPlayer ~= player then
						TernatePrint("GT_Ternate_SeventyTwoIslands_ProphetExpended: expended next to city")
						if unitType == unitProphetID or unitType == unitMissionaryID then
							local religionID = DMS_GetMajorityReligion(player)
							city:SetNumRealBuilding(buildingSeventyTwoIslands, g_MathCeil(city:GetNumFollowers(religionID)/2))
							TernatePrint("GT_Ternate_SeventyTwoIslands_ProphetExpended: spread followers tracked")
						end
					end
				end
			end
		end
	end
end
GameEvents.UnitPrekill.Add(GT_Ternate_SeventyTwoIslands_ProphetExpended)

--[WORKS]
function GT_Ternate_SeventyTwoIslands_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local tRoutes = {player:GetTradeRoutes(), player:GetTradeRoutesToYou()}
	for k, tTable in pairs(tRoutes) do
		TernatePrint("GT_Ternate_SeventyTwoIslands_PlayerDoTurn: Iterating routes")
		for _,v in pairs(tTable) do
			if v.FromID ~= v.ToID then
				TernatePrint("GT_Ternate_SeventyTwoIslands_PlayerDoTurn: Iterating ITRs")
				local fromCity = v.FromCity
				local toCity = v.ToCity
				TernatePrint("GT_Ternate_SeventyTwoIslands_PlayerDoTurn: detecting from and to cities")
				if fromCity:GetOwner() == playerID then
					TernatePrint("GT_Ternate_SeventyTwoIslands_PlayerDoTurn: origin city is ternaten")
					if HasTrait(player, traitTernateID) and v.Domain == DomainTypes["DOMAIN_SEA"] then
						TernatePrint("GT_Ternate_SeventyTwoIslands_PlayerDoTurn: Iterating ITRs coming from Ternate")
						local religionID = DMS_GetMajorityReligion(player)
						if toCity:GetPressurePerTurn(religionID) > 0 and (v.FromPressure > 0 and v.FromReligion == religionID) then
							TernatePrint("GT_Ternate_SeventyTwoIslands_PlayerDoTurn: ITR has religious pressure")
							local numSpreadFollowers = toCity:GetNumRealBuilding(buildingSeventyTwoIslands)
							if numSpreadFollowers < v.FromPressure + g_MathCeil(toCity:GetNumFollowers(religionID)/4) then
								player:ChangeGoldenAgeProgressMeter(5 * (v.FromPressure - numSpreadFollowers))
								TernatePrint("GT_Ternate_SeventyTwoIslands_PlayerDoTurn: adding GAP from followers")
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(GT_Ternate_SeventyTwoIslands_PlayerDoTurn)

--[WORKS]
local buildingSeventyTwoSlots = GameInfoTypes["BUILDING_GT_SEVENTY_TWO_SLOTS"]
local buildingSeventyTwoMosques = GameInfoTypes["BUILDING_GT_SEVENTY_TWO_MOSQUES"]
function GT_Ternate_SeventyTwoIslands_CityConverted(playerID)
	local player = Players[playerID]
	local numSlots = 0
	for ID = 0, defineMaxMajorCivs -1, 1 do
		TernatePrint("GT_Ternate_SeventyTwoIslands_CityConverted: Iterating civs")
		local coastalPlayer = Players[ID]
		if HasTrait(player, traitTernateID) and coastalPlayer ~= player then
			TernatePrint("GT_Ternate_SeventyTwoIslands_CityConverted: converting player to Ternate's religion")
			for city in coastalPlayer:Cities() do
				if city:IsCoastal()and not city:IsHasBuilding(buildingSeventyTwoMosques) then
					TernatePrint("GT_Ternate_SeventyTwoIslands_CityConverted: city is coastal")
					local ownReligion = DMS_GetMajorityReligion(player)
					if ownReligion == city:GetReligiousMajority() then						
						numSlots = numSlots + 1
						city:SetNumRealBuilding(buildingSeventyTwoMosques, 1)
						TernatePrint("GT_Ternate_SeventyTwoIslands_CityConverted: adding conversion dummy")
					end
				end
			end
		end
	end
	local capital = player:GetCapitalCity()
	if capital then
		capital:SetNumRealBuilding(buildingSeventyTwoSlots, numSlots)
		TernatePrint("GT_Ternate_SeventyTwoIslands_CityConverted: adding tr dummy")
	end
end
GameEvents.PlayerDoTurn.Add(GT_Ternate_SeventyTwoIslands_CityConverted)				
-------------
-- ARUMBAI --
-------------
--[WORKS]
function GT_GetNumAlliedCS(player)
	local numAlliedCS = 0
	for ID = 0, defineMaxMinorCivs -1, 1 do
		local minor = Players[ID]
		if minor:GetMinorCivFriendshipLevelWithMajor(player) > 2 then
			numAlliedCS = numAlliedCS + 1
			TernatePrint("GT_GetNumAlliedCS: Ternate has CS allies")
			break
		end
	end
	return numAlliedCS
end

--[WORKS]
local buildingArumbaiPressureID = GameInfoTypes["BUILDING_GT_ARUMBAI_PRESSURE"]
function GT_Arumbai_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local tRoutes = {player:GetTradeRoutes(), player:GetTradeRoutesToYou()}
	for k, tTable in pairs(tRoutes) do
		TernatePrint("GT_Arumbai_PlayerDoTurn: Iterating routes")
		for _,v in pairs(tTable) do
			local numAlliedCS = GT_GetNumAlliedCS(player)
			TernatePrint("GT_Arumbai_PlayerDoTurn: detecting allied city-states")
			if Players[v.fromID] == player and HasTrait(player, traitTernateID) then
				if v.Domain == DomainTypes.DOMAIN_SEA then
					TernatePrint("GT_Arumbai_PlayerDoTurn: Ternate has sea trade route")
					if numAlliedCS < 8 then
						toCity:SetNumRealBuilding(buildingArumbaiPressureID, numAlliedCS)
						TernatePrint("GT_Arumbai_PlayerDoTurn: adding pressure dummies")
					else
						toCity:SetNumRealBuilding(buildingArumbaiPressureID, 8)
					end
				end
			end
		end
	end	
end
GameEvents.PlayerDoTurn.Add(GT_Arumbai_PlayerDoTurn)			

local unitMusicianID = GameInfoTypes["UNIT_MUSICIAN"]
local unitWriterID = GameInfoTypes["UNIT_WRITER"]
local unitPerfomerID = GameInfoTypes["UNIT_JFD_PERFORMER"]
local unitFilmmakerID = GameInfoTypes["UNIT_JFD_GREAT_FILMMAKER"]
local unitArtistID = GameInfoTypes["UNIT_ARTIST"]
local unitEntertainerID = GameInfoTypes["UNIT_JFD_GREAT_ENTERTAINER"]
local unitGeneralID = GameInfoTypes["UNIT_GREAT_GENERAL"]
local unitGreatAdmiralID = GameInfoTypes["UNIT_GREAT_ADMIRAL"]
local unitEngineerID = GameInfoTypes["UNIT_ENGINEER"]
local unitGreatMerchantID = GameInfoTypes["UNIT_MERCHANT"]
local unitUtusanID = GameInfoTypes["UNIT_GT_UTUSAN"]
local unitGreatMagistrateID = GameInfoTypes["UNIT_JFD_GREAT_MAGISTRATE"]
local unitGreatScientistID = GameInfoTypes["UNIT_SCIENTIST"]
local unitDoctorID = GameInfoTypes["UNIT_JFD_DOCTOR"]
local unitGreatPhilosopherID = GameInfoTypes["UNIT_JFD_GREAT_PHILOSOPHER"]
local buildingArumbaiCultureID = GameInfoTypes["BUILDING_GT_ARUMBAI_CULTURE"]
local buildingArumbaiFaithID = GameInfoTypes["BUILDING_GT_ARUMBAI_FAITH"]
local buildingArumbaiGoldID = GameInfoTypes["BUILDING_GT_ARUMBAI_GOLD"]
local buildingArumbaiProductionID = GameInfoTypes["BUILDING_GT_ARUMBAI_PRODUCTION"]
local buildingArumbaiScienceID = GameInfoTypes["BUILDING_GT_ARUMBAI_SCIENCE"]

--[WORKS]
function GT_Arumbai_GreatPersonExpendCheck(playerID, unitID)
	local player = Players[playerID]
	local capital = player:GetCapitalCity()
	if (not unitTypeID) then unitTypeID = unitID end
	if HasTrait(player, traitTernateID) then
		TernatePrint("GT_Arumbai_GreatPersonExpendCheck: player is Ternate")
		if (unitTypeID == unitMusicianID or unitTypeID == unitWriterID or unitTypeID == unitFilmmakerID or unitTypeID == unitPerfomerID or unitTypeID == unitArtistID) then
			TernatePrint("GT_Arumbai_GreatPersonExpendCheck: cultural unit expended, setting dummy")
			capital:SetNumRealBuilding(buildingArumbaiCultureID, 1)
			capital:SetNumRealBuilding(buildingArumbaiProductionID, 0)
			capital:SetNumRealBuilding(buildingArumbaiGoldID, 0)
			capital:SetNumRealBuilding(buildingArumbaiScienceID, 0)
			capital:SetNumRealBuilding(buildingArumbaiFaithID, 0)
		elseif (unitTypeID == unitGeneralID or unitTypeID == unitGreatAdmiralID or unitTypeID == unitEngineerID) then
			capital:SetNumRealBuilding(buildingArumbaiProductionID, 1)
			capital:SetNumRealBuilding(buildingArumbaiCultureID, 0)
			capital:SetNumRealBuilding(buildingArumbaiGoldID, 0)
			capital:SetNumRealBuilding(buildingArumbaiScienceID, 0)
			capital:SetNumRealBuilding(buildingArumbaiFaithID, 0)
		elseif (unitTypeID == unitGreatMerchantID or unitTypeID == unitUtusanID or unitTypeID == unitGreatMagistrateID) then
			capital:SetNumRealBuilding(buildingArumbaiGoldID, 1)
			capital:SetNumRealBuilding(buildingArumbaiCultureID, 0)
			capital:SetNumRealBuilding(buildingArumbaiScienceID, 0)
			capital:SetNumRealBuilding(buildingArumbaiFaithID, 0)
			capital:SetNumRealBuilding(buildingArumbaiProductionID, 0)
		elseif (unitTypeID == unitGreatScientistID or unitTypeID == unitDoctorID) then
			capital:SetNumRealBuilding(buildingArumbaiScienceID, 1)
			capital:SetNumRealBuilding(buildingArumbaiCultureID, 0)
			capital:SetNumRealBuilding(buildingArumbaiFaithID, 0)
			capital:SetNumRealBuilding(buildingArumbaiProductionID, 0)
			capital:SetNumRealBuilding(buildingArumbaiGoldID, 0)
		elseif (unitTypeID == unitProphetID or unitTypeID == unitGreatPhilosopherID) then
			capital:SetNumRealBuilding(buildingArumbaiFaithID, 1)
			capital:SetNumRealBuilding(buildingArumbaiCultureID, 0)
			capital:SetNumRealBuilding(buildingArumbaiGoldID, 0)
			capital:SetNumRealBuilding(buildingArumbaiProductionID, 0)
			capital:SetNumRealBuilding(buildingArumbaiScienceID, 0)
		end
		TernatePrint("GT_Arumbai_GreatPersonExpendCheck: cycled through gps")
	end
end
GameEvents.GreatPersonExpended.Add(GT_Arumbai_GreatPersonExpendCheck)

--[WORKS]
function GT_Arumbai_TradeRouteEndsYield(playerID)
	local player = Players[playerID]
	local tRoutes = {player:GetTradeRoutes(), player:GetTradeRoutesToYou()}
	for k, tTable in pairs(tRoutes) do
		TernatePrint("GT_Arumbai_TradeRouteEndsYield: Iterating routes")
		for _,v in pairs(tTable) do
			local fromCity = v.FromCity
			local toCity = v.ToCity
			if HasTrait(player, traitTernateID) then
				if v.TurnsLeft < 2 and v.Domain == DomainTypes.DOMAIN_SEA then
					TernatePrint("GT_Arumbai_TradeRouteEndsYield: trade route is maritime")
					local capital = player:GetCapitalCity()
					local numAlliedCS = GT_GetNumAlliedCS(player)
					if capital:IsHasBuilding(buildingArumbaiCultureID) then
						if fromCity:GetOwner() == playerID then
							fromCity:ChangeJONSCultureStored(15 + numAlliedCS)
							if (player:IsHuman()) then
								local hex = ToHexFromGrid(Vector2(fromCity:GetX(), fromCity:GetY()))
								Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_PRODUCTION]", (15 + numAlliedCS), true))
							end
						end
					elseif capital:IsHasBuilding(buildingArumbaiFaithID) then
						player:ChangeFaith(15 + numAlliedCS)
						if (player:IsHuman()) then
							local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
							Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_PEACE]", (15 + numAlliedCS), true))
						end
					elseif capital:IsHasBuilding(buildingArumbaiGoldID) then
						player:ChangeGold(15 + numAlliedCS)
						if (player:IsHuman()) then
							local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
							Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_GOLD]", (15 + numAlliedCS), true))
						end
					elseif capital:IsHasBuilding(buildingArumbaiProductionID) then
						if fromCity:GetOwner() == playerID then
							fromCity:ChangeProduction(15 + numAlliedCS)
							if (player:IsHuman()) then
								local hex = ToHexFromGrid(Vector2(fromCity:GetX(), fromCity:GetY()))
								Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_PRODUCTION]", (15 + numAlliedCS), true))
							end
						end
					elseif capital:IsHasBuilding(buildingArumbaiScienceID) then
						local playerTeam = Players[player:GetTeam()]
						local teamTech = playerTeam:GetTeamTechs()
						teamTech:ChangeResearchProgress(10 + numAlliedCS)
						if (player:IsHuman()) then
							local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
							Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_SCIENCE]", (10 + numAlliedCS), true))
						end
						TernatePrint("GT_Arumbai_TradeRouteEndsYield: cycled through dummies")
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(GT_Arumbai_TradeRouteEndsYield)

--[WORKS]
local unitCargoShip = GameInfoTypes["UNIT_CARGO_SHIP"]
function GT_Arumbai_CargoShipCheck(playerID)
	local player = Players[playerID]
	if HasTrait(player, traitTernateID) then
		for city in player:Cities() do
			local plot = city:Plot()
			local unit = plot:GetUnit()
			if unit and plot:GetNumUnits() < 2 then
				if unit:GetUnitType() == unitCargoShip then
					unit:Kill()
					player:InitUnit(unitArumbaiID, plot:GetX(), plot:GetY())
				end
			elseif unit and plot:GetNumUnits() > 1 then
				for ID = 0,(plot:GetNumUnits() - 1) do
					local stackedUnit = plot:GetUnit(ID)
					if stackedUnit:GetUnitType() == unitCargoShip then
						stackedUnit:Kill()
						player:InitUnit(unitArumbaiID, plot:GetX(), plot:GetY())
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(GT_Arumbai_CargoShipCheck)
-----------------
-- NGARAH LAMO --
-----------------
--[WORKS]
local buildingNgarahHappinessID = GameInfoTypes["BUILDING_GT_NGARAH_LAMO_HAPPINESS"]
function GT_NgarahLamo_PlayerDoTurn(playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		local religionID = DMS_GetMajorityReligion(player)
		local numPressure = city:GetPressurePerTurn(religionID)
		if city:IsHasBuilding(buildingNgarahLamoID) then
			TernatePrint("GT_NgarahLamo_PlayerDoTurn: city has ub")
			city:SetNumRealBuilding(buildingNgarahHappinessID, (numPressure/3))
			TernatePrint("GT_NgarahLamo_PlayerDoTurn: setting happiness")
		end
	end
end
GameEvents.PlayerDoTurn.Add(GT_NgarahLamo_PlayerDoTurn)

--[WORKS]
local buildingTempleID = GameInfoTypes["BUILDING_TEMPLE"]
function GT_NgarahLamo_CityCanConstruct(playerID, cityID, buildingID)
	if buildingID == buildingNgarahLamoID then 
		local returnValue = false
		local player = Players[playerID]
		local city = player:GetCityByID(cityID)
		if city then
			if player:IsGoldenAge() or city:IsHasBuilding(buildingTempleID) then
				TernatePrint("GT_NgarahLamo_CityCanConstruct: can be built without temple")
				return true
			else
				return returnValue
			end
		end
	end
	return true
end
GameEvents.CityCanConstruct.Add(GT_NgarahLamo_CityCanConstruct)
----------------------------------------------------------------------------------------------------------------------------
-- MCIS
----------------------------------------------------------------------------------------------------------------------------
--[WORKS]
g_Ternate_MCIS_TipControls = {}
TTManager:GetTypeControlTable("Ternate_MCIS_Tooltip", g_Ternate_MCIS_TipControls)

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "Ternate_MCIS", ["SortOrder"] = 1})
end
if IsTernateActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end

function CityInfoStackDirty(key, instance)
	if key ~= "Ternate_MCIS" then return end
	ProcessCityScreen(instance)
end
if IsTernateActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
----------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	print("city == true")
	instance.IconFrame:SetToolTipType("Ternate_MCIS_Tooltip")
	IconHookup(3, 64, "GT_TERNATE_ATLAS", instance.IconImage)
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_BUILDING_GT_NGARAH_LAMO")) .. "[ENDCOLOR]" -- Header
	local textHelp = Locale.ConvertTextKey("TXT_KEY_BUILDING_GT_NGARAH_LAMO_TOOLTIP") -- Text
	g_Ternate_MCIS_TipControls.Heading:SetText(textDescription)
	g_Ternate_MCIS_TipControls.Body:SetText(textHelp)
	g_Ternate_MCIS_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end		
--==========================================================================================================================
--==========================================================================================================================				
					
