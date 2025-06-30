-- JFD_Civs_PapalStatesJuliusII_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Player.HasTrait then 
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
-- MATH UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game.GetRandom
function Game.GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
local g_GetRandom = Game.GetRandom
----------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game_IsVMCActive
function Game_IsVMCActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsVMCActive = Game_IsVMCActive()
------------------------------------------------------------------------------------------------------------------------
--GetStrongestMilitaryUnit
function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxPlayers = GameDefines["MAX_CIV_PLAYERS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
--UA
local traitPapalStatesJuliusIIID = GameInfoTypes["TRAIT_JFD_PAPAL_STATES_JULIUS_II"]
local specialistArtistID = GameInfoTypes["SPECIALIST_ARTIST"]
local specialistDirectorID = GameInfoTypes["SPECIALIST_JFD_DIRECTOR"]
local specialistMusicianID = GameInfoTypes["SPECIALIST_MUSICIAN"]
local specialistPerformerID = GameInfoTypes["SPECIALIST_JFD_PERFORMER"]
local specialistWriterID = GameInfoTypes["SPECIALIST_WRITER"]
local promotionPapalStatesJuliusII1ID = GameInfoTypes["PROMOTION_JFD_PAPAL_STATES_JULIUS_II_1"]
local promotionPapalStatesJuliusII1OtherID = GameInfoTypes["PROMOTION_JFD_PAPAL_STATES_JULIUS_II_1_OTHER"]
local promotionPapalStatesJuliusII2ID = GameInfoTypes["PROMOTION_JFD_PAPAL_STATES_JULIUS_II_2"]
local promotionPapalStatesJuliusII3ID = GameInfoTypes["PROMOTION_JFD_PAPAL_STATES_JULIUS_II_3"]
local promotionPapalStatesJuliusII4ID = GameInfoTypes["PROMOTION_JFD_PAPAL_STATES_JULIUS_II_4"]
local promotionPapalStatesJuliusII4OtherID = GameInfoTypes["PROMOTION_JFD_PAPAL_STATES_JULIUS_II_4_OTHER"]
local unitInquisitorID = GameInfoTypes["UNIT_INQUISITOR"]
local unitMissionaryID = GameInfoTypes["UNIT_MISSIONARY"]
local unitProphetID = GameInfoTypes["UNIT_PROPHET"]
local unitClassInquisitorID = GameInfoTypes["UNITCLASS_INQUISITOR"]
local unitClassMissionaryID = GameInfoTypes["UNITCLASS_MISSIONARY"]
local unitClassProphetID = GameInfoTypes["UNITCLASS_PROPHET"]

--UU
local unitSwissGuardID = GameInfoTypes["UNIT_JFD_SWISS_GUARD"]
local unitAntiTankGunID = GameInfoTypes["UNIT_ANTI_TANK_GUN"]
local numUnitAntiTankGunCS = GameInfo.Units[unitAntiTankGunID].Combat
local techUnitAntiTankGunID = GameInfoTypes[GameInfo.Units[unitAntiTankGunID].PrereqTech]
local unitHelicopterGunshipID = GameInfoTypes["UNIT_HELICOPTER_GUNSHIP"]
local numUnitHelicopterGunshipCS = GameInfo.Units[unitHelicopterGunshipID].Combat
local techUnitHelicopterGunshipID = GameInfoTypes[GameInfo.Units[unitHelicopterGunshipID].PrereqTech]
local unitLancerID = GameInfoTypes["UNIT_LANCER"]
local numUnitLancerCS = GameInfo.Units[unitLancerID].Combat
local techUnitLancerID = GameInfoTypes[GameInfo.Units[unitLancerID].PrereqTech]
local unitUhlanID = GameInfoTypes["UNIT_EE_UHLAN"]
local numUnitUhlanCS = 0
local techUnitUhlanID = nil
if unitUhlanID then
	numUnitUhlanCS = GameInfo.Units[unitUhlanID].Combat
	techUnitUhlanID = GameInfoTypes[GameInfo.Units[unitUhlanID].PrereqTech]
end
local promotionSwissGuardActiveID = GameInfoTypes["PROMOTION_JFD_SWISS_GUARD_ACTIVE"]
local promotionSwissGuardInactiveID = GameInfoTypes["PROMOTION_JFD_SWISS_GUARD_INACTIVE"]

--UB
local buildingChapelID = GameInfoTypes["BUILDING_JFD_CHAPEL"]
local buildingChapel1ID = GameInfoTypes["BUILDING_JFD_CHAPEL_1"]
local buildingChapel2ID = GameInfoTypes["BUILDING_JFD_CHAPEL_2"]
local techBuildingChapelID = GameInfoTypes[GameInfo.Buildings[buildingChapelID].PrereqTech]
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------
--JFD_PapalStatesJuliusII_PlayerDoTurn
local function JFD_PapalStatesJuliusII_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	
	--UA
	if HasTrait(player, traitPapalStatesJuliusIIID) and (player:GetUnitClassCount(unitClassProphetID) > 0 or player:GetUnitClassCount(unitClassMissionaryID) > 0 or player:GetUnitClassCount(unitClassInquisitorID) > 0) then
		for unit in player:Units() do
			if unit:IsCombatUnit() then
				local plot = unit:GetPlot()
				local isValid = false
				local numValidUnits = 0
				for adjacentPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
					for numIndex = 0,(adjacentPlot:GetNumUnits() - 1) do
						local plotUnit = adjacentPlot:GetUnit(numIndex)
						if plotUnit:IsHasPromotion(promotionPapalStatesJuliusII1ID) then
							isValid = true
							numValidUnits = numValidUnits + 1
						end
						if plotUnit:IsHasPromotion(promotionPapalStatesJuliusII2ID) then
							numValidUnits = numValidUnits + 1
						end
						if plotUnit:IsHasPromotion(promotionPapalStatesJuliusII3ID) then
							numValidUnits = numValidUnits + 1
						end
					end
				end
				if isValid then
					if (not unit:IsHasPromotion(promotionPapalStatesJuliusII1OtherID)) then
						unit:SetHasPromotion(promotionPapalStatesJuliusII1OtherID, true)
					end
				else
					if unit:IsHasPromotion(promotionPapalStatesJuliusII1OtherID) then
						unit:SetHasPromotion(promotionPapalStatesJuliusII1OtherID, false)
					end
				end
				if numValidUnits >= 3 then
					if (not unit:IsHasPromotion(promotionPapalStatesJuliusII4OtherID)) then
						unit:SetHasPromotion(promotionPapalStatesJuliusII4OtherID, true)
					end
				else
					if unit:IsHasPromotion(promotionPapalStatesJuliusII4OtherID) then
						unit:SetHasPromotion(promotionPapalStatesJuliusII4OtherID, false)
					end
				end
			end
		end	
	end

	--UU
	for unit in player:Units() do
		if unit:IsHasPromotion(promotionSwissGuardActiveID) or unit:IsHasPromotion(promotionSwissGuardInactiveID) then
			local unitPlot = g_MapGetPlot(unit:GetX(), unit:GetY())
			local isValid = false
			for adjacentPlot in PlotAreaSweepIterator(unitPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				local adjacentPlotCity = adjacentPlot:GetPlotCity()
				if adjacentPlotCity and (adjacentPlotCity:GetOwner() == playerID) and adjacentPlotCity:IsCapital() then
					isValid = true
					break
				end
			end
			if isValid then
				if (not unit:IsHasPromotion(promotionSwissGuardActiveID)) then
					unit:SetHasPromotion(promotionSwissGuardActiveID, true)
					unit:SetHasPromotion(promotionSwissGuardInactiveID, false)
				end
			else
				if unit:IsHasPromotion(promotionSwissGuardInactiveID) then
					unit:SetHasPromotion(promotionSwissGuardActiveID, false)
					unit:SetHasPromotion(promotionSwissGuardInactiveID, true)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_PapalStatesJuliusII_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
--JFD_PapalStatesJuliusII_CityCaptureComplete
local function JFD_PapalStatesJuliusII_CityCaptureComplete(oldOwnerID, isCapital, plotX, plotY, newOwnerID, numPop, isConquest)
	local player = Players[newOwnerID]
	if oldOwnerID == newOwnerID then return end
	if (not isConquest) then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	--UA
	if HasTrait(player, traitPapalStatesJuliusIIID) then
		local mainReligionID = player:GetReligionCreatedByPlayer()
		if Player.HasStateReligion then
			if mainReligionID == -1 then
				mainReligionID = player:GetStateReligion()
			end
		end
		if mainReligionID == -1 then
			mainReligionID = player:GetCapitalCity():GetReligiousMajority() 
		end
		if mainReligionID <= 0 then return end

		local city = g_MapGetPlot(plotX, plotY):GetPlotCity()
		local numFollowers = city:GetNumFollowers(mainReligionID)
		if numFollowers > 0 then
			city:ChangeResistanceTurns(-numFollowers)
			if player:IsHuman() and player:IsTurnActive() then
				local strReligion = Game.GetReligionName(mainReligionID)
				local strReligionIcon = GameInfo.Religions[mainReligionID].IconString
				player:AddNotification(NotificationTypes["NOTIFICATION_WAR_ACTIVE_PLAYER"], g_ConvertTextKey("TXT_KEY_TRAIT_JFD_PAPAL_STATES_JULIUS_II_NOTIFICATION_DESC_1", strReligionIcon, strReligion, city:GetName()), g_ConvertTextKey("TXT_KEY_TRAIT_JFD_PAPAL_STATES_JULIUS_II_NOTIFICATION_SHORT_DESC_1"), playerCapital:GetX(), playerCapital:GetY(), oldOwnerID, -1)
			end
	
			local numGPP = (numFollowers*2)
			if numGPP > 0 then
				playerCapital:ChangeSpecialistGreatPersonProgressTimes100(specialistArtistID, numGPP*100)
				if specialistDirectorID then
					playerCapital:ChangeSpecialistGreatPersonProgressTimes100(specialistDirectorID, numGPP*100)
				end
				playerCapital:ChangeSpecialistGreatPersonProgressTimes100(specialistMusicianID, numGPP*100)
				if specialistPerformerID then
					playerCapital:ChangeSpecialistGreatPersonProgressTimes100(specialistPerformerID, numGPP*100)
				end
				playerCapital:ChangeSpecialistGreatPersonProgressTimes100(specialistWriterID, numGPP*100)
				if player:IsHuman() and player:IsTurnActive() then
					player:AddNotification(NotificationTypes["NOTIFICATION_WAR_ACTIVE_PLAYER"], g_ConvertTextKey("TXT_KEY_TRAIT_JFD_PAPAL_STATES_JULIUS_II_NOTIFICATION_DESC_2", city:GetName()), g_ConvertTextKey("TXT_KEY_TRAIT_JFD_PAPAL_STATES_JULIUS_II_NOTIFICATION_SHORT_DESC_2"), playerCapital:GetX(), playerCapital:GetY(), oldOwnerID, -1)
				end
			end
		end
	end
end
GameEvents.CityCaptureComplete.Add(JFD_PapalStatesJuliusII_CityCaptureComplete)
----------------------------------------------------------------------------------------------------------------------------
--JFD_PapalStatesJuliusII_SerialEventUnitCreated
local function JFD_PapalStatesJuliusII_SerialEventUnitCreated(playerID, unitID)
    local player = Players[playerID]	

	--UA
    if HasTrait(player, traitPapalStatesJuliusIIID) then
		local unit = player:GetUnitByID(unitID)
	   	if unit and (unit:GetUnitType() == unitProphetID) and (not unit:IsHasPromotion(promotionPapalStatesJuliusII1ID)) then
			unit:SetHasPromotion(promotionPapalStatesJuliusII1ID, true)
			unit:SetHasPromotion(promotionPapalStatesJuliusII4ID, true)
		end
		if unit and (unit:GetUnitType() == unitMissionaryID) and (not unit:IsHasPromotion(promotionPapalStatesJuliusII2ID)) then
			unit:SetHasPromotion(promotionPapalStatesJuliusII2ID, true)
			unit:SetHasPromotion(promotionPapalStatesJuliusII4ID, true)
		end
		if unit and (unit:GetUnitType() == unitInquisitorID) and (not unit:IsHasPromotion(promotionPapalStatesJuliusII3ID)) then
			unit:SetHasPromotion(promotionPapalStatesJuliusII3ID, true)
			unit:SetHasPromotion(promotionPapalStatesJuliusII4ID, true)
		end
    end
end
Events.SerialEventUnitCreated.Add(JFD_PapalStatesJuliusII_SerialEventUnitCreated)
----------------------------------------------------------------------------------------------------------------------------
--JFD_PapalStatesJuliusII_CityTrained
local function JFD_PapalStatesJuliusII_CityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	local playerTeamTechs = playerTeam:GetTeamTechs()
	if (not player:IsAlive()) then return end

	--UU
	if HasTrait(player, traitPapalStatesJuliusIIID) then
		local unit = player:GetUnitByID(unitID)
		if unit:GetUnitType() == unitSwissGuardID then
			local numCS = 0
			if playerTeamTechs:HasTech(techUnitHelicopterGunshipID) then 
				numCS = numUnitHelicopterGunshipCS
			elseif playerTeamTechs:HasTech(techUnitAntiTankGunID) then  
				numCS = numUnitAntiTankGunCS
			elseif unitUhlanID and playerTeamTechs:HasTech(techUnitUhlanID) then  
				numCS = numUnitUhlanCS
			elseif playerTeamTechs:HasTech(techUnitLancerID) then  
				numCS = numUnitLancerCS
			end
			if numCS > 0 then
				if unit:GetBaseCombatStrength() < numCS then
					unit:SetBaseCombatStrength(numCS)
				end
			end
		end
	end
end
GameEvents.CityTrained.Add(JFD_PapalStatesJuliusII_CityTrained)
----------------------------------------------------------------------------------------------------------------------------
--JFD_PapalStatesJuliusII_CityCanTrain
local function JFD_PapalStatesJuliusII_CityCanTrain(playerID, cityID, unitID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end

	--UU
	if unitID == unitSwissGuardID then
		local city = player:GetCityByID(cityID)
		if (not city:IsCapital()) then
			return false
		end
	end
	return true
end
GameEvents.CityCanTrain.Add(JFD_PapalStatesJuliusII_CityCanTrain)
----------------------------------------------------------------------------------------------------------------------------
--JFD_PapalStatesJuliusII_CityCanConstruct
local function JFD_PapalStatesJuliusII_CityCanConstruct(playerID, cityID, buildingID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	local playerTeamTechs = playerTeam:GetTeamTechs()
	if (not player:IsAlive()) then return end

	--UB
	if buildingID == buildingChapelID or buildingID == buildingChapel1ID or buildingID == buildingChapel2ID then
		if HasTrait(player, traitPapalStatesJuliusIIID) and playerTeamTechs:HasTech(techBuildingChapelID) then
			local city = player:GetCityByID(cityID)
			local numChapels = 0
			if city:IsHasBuilding(buildingChapelID) then
				numChapels = numChapels + 1
			end
			if city:IsHasBuilding(buildingChapel1ID) then
				numChapels = numChapels + 1
			end
			if city:IsHasBuilding(buildingChapel2ID) then
				numChapels = numChapels + 1
			end
			if numChapels == 0 then
				return true
			elseif numChapels == 1 or numChapels == 2 then
				local mainReligionID = player:GetReligionCreatedByPlayer()
				if Player.HasStateReligion then
					if mainReligionID == -1 then
						mainReligionID = player:GetStateReligion()
					end
				end
				if mainReligionID == -1 then
					mainReligionID = player:GetCapitalCity():GetReligiousMajority() 
				end
				if mainReligionID <= 0 then return false end
		
				local numFollowersReq = 7
				if numChapels == 2 then
					numFollowersReq = 14
				end
				local mainReligionID = player:GetReligionCreatedByPlayer()
				if Player.HasStateReligion then
					if mainReligionID == -1 then
						mainReligionID = player:GetStateReligion()
					end
				end
				if mainReligionID == -1 then
					mainReligionID = player:GetCapitalCity():GetReligiousMajority() 
				end
				if mainReligionID <= 0 then 
					return false 
				end

				if city:GetNumFollowers(mainReligionID) < numFollowersReq then
					return false
				end
				return true
			end
		else
			return false
		end
	end
	return true
end
GameEvents.CityCanConstruct.Add(JFD_PapalStatesJuliusII_CityCanConstruct)
----------------------------------------------------------------------------------------------------------------------------
--JFD_PapalStatesJuliusII_UnitPromoted
local function JFD_PapalStatesJuliusII_UnitPromoted(playerID, unitID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	local playerTeamTechs = playerTeam:GetTeamTechs()
	if (not player:IsAlive()) then return end

	--UU
	if HasTrait(player, traitPapalStatesJuliusIIID) then
		local unit = player:GetUnitByID(unitID)
		if unit:GetUnitType() == unitSwissGuardID then
			local numCS = 0
			if playerTeamTechs:HasTech(techUnitHelicopterGunshipID) then 
				numCS = numUnitHelicopterGunshipCS
			elseif playerTeamTechs:HasTech(techUnitAntiTankGunID) then  
				numCS = numUnitAntiTankGunCS
			elseif unitUhlanID and playerTeamTechs:HasTech(techUnitUhlanID) then  
				numCS = numUnitUhlanCS
			elseif playerTeamTechs:HasTech(techUnitLancerID) then  
				numCS = numUnitLancerCS
			end
			if numCS > 0 then
				if unit:GetBaseCombatStrength() < numCS then
					unit:SetBaseCombatStrength(numCS)
				end
			end
		end
	end
end
GameEvents.UnitPromoted.Add(JFD_PapalStatesJuliusII_UnitPromoted)
--=======================================================================================================================
--=======================================================================================================================