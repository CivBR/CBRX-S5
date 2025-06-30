-- EC_Civs_Leu_OnondagaTadodaho_Functions
-- Author: EC
-- DateCreated: 2/15/2014 6:33:36 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
print("Tadodaho Scripts Loaded!")
include("FLuaVector.lua")
include("PlotIterators.lua")
--include("UniqueDiplomacyUtilsV2.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
------------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = (Game_IsCPActive() and Player.HasStateReligion)
------------------------------------------------------------------------------------------------------------------------
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
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxPlayers = GameDefines["MAX_PLAYERS"]
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local buildinUBID = GameInfoTypes["BUILDING_LEU_WAMPUM_HOUSE"]
local buildinDumUB1ID = GameInfoTypes["BUILDING_DUMMY_LEU_WAMPUM_HOUSE_1"]
local buildinDumUB2ID = GameInfoTypes["BUILDING_DUMMY_LEU_WAMPUM_HOUSE_2"]

local nFaithPromotions = 10
local nGoldenAgePromotions = 5

local unitFireKeeperID = GameInfoTypes["UNIT_LEU_FIREKEEPER"]
local nFireKeeperGATurns = 5

local traitLeuOnondagaTadodahoID = GameInfoTypes["TRAIT_LEU_ONONDAGA_TADODAHO"]

local promoTraitID = GameInfoTypes["PROMOTION_LEU_ONONDAGA_TADODAHO"]
local promoTraitAID = GameInfoTypes["PROMOTION_LEU_ONONDAGA_TADODAHO_A"]
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--Leu_OnondagaTadodaho_PlayerDoTurn

local function Leu_OnondagaTadodaho_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local playerTeamTechs = playerTeam:GetTeamTechs()
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end

	--UNIQUE ABILITY
	if (not HasTrait(player, traitLeuOnondagaTadodahoID)) then return end

	local numAllies = 0 
	for otherPlayerID = 0, defineMaxPlayers - 1 do
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayer:IsMinorCiv() and otherPlayer:IsAlive()) then
			if otherPlayer:IsAllies(playerID) then
				numAllies = numAllies + 1
			end
		end
	end
	if player:IsGoldenAge() then
		numAllies = numAllies*2

	end
	playerCapital:SetNumRealBuilding(buildinDumUB1ID, numAllies)
	if player:CountNumBuildings(buildinUBID) == player:GetNumCities() then
		playerCapital:SetNumRealBuilding(buildinDumUB2ID, 1)
	else
		playerCapital:SetNumRealBuilding(buildinDumUB2ID, 0)
	end
	
	for unit in player:Units() do
		if unit:IsHasPromotion(promoTraitAID) or unit:IsHasPromotion(promoTraitID) then
			local plot = unit:GetPlot()
			local isPromoValid = plot:IsHills()
			unit:SetHasPromotion(promoTraitID, (not isPromoValid))
			unit:SetHasPromotion(promoTraitAID, isPromoValid)
		end
	end
end
GameEvents.PlayerDoTurn.Add(Leu_OnondagaTadodaho_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
--Leu_OnondagaTadodaho_UnitPrekill
local function Leu_OnondagaTadodaho_UnitPrekill(unitOwnerID, unitID, unitType, plotX, plotY, isDelay, killingPlayerID)
	local player = Players[unitOwnerID]
	if killingPlayerID ~= -1 then return end
	if (not isDelay) then return end
	if (not player) then return end
	if (not player:IsAlive()) then return end

	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	--UU
	if unitType == unitFireKeeperID then
		--if player:IsGoldenAge() then
		--	player:ChangeGoldenAgeTurns(math.ceil(nFireKeeperGATurns*iMod))
		--	if player:IsHuman() and player:IsTurnActive() then 
		--		Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_STATUS_FIREKEEPER_GOLDENAGE_TURNS",  math.ceil(nFireKeeperGATurns*iMod)))
		--	end   
		--end
		--
		local plot = Map.GetPlot(plotX, plotY)
		if plot:GetOwner() > -1 and Players[plot:GetOwner()]:IsMinorCiv() then
			local numFaith = math.ceil(player:GetJONSCulturePerTurnFromCities()*5*iMod)
			if player:IsGoldenAge() then numFaith = numFaith*2 end
			player:ChangeJONSCulture(numFaith)
			--if player:IsHuman() and player:IsTurnActive() then
			--	local unit = player:GetUnitByID(unitID)
			--	local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
			--	Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_PEACE]", numFaith), true)
			--end
			if player:IsHuman() and player:IsTurnActive() then 
				if player:IsGoldenAge() then
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_STATUS_FIREKEEPER_FAITH_GOLDEN_AGE",  numFaith))
				else
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_STATUS_FIREKEEPER_FAITH",  numFaith))
				end
			end  

		end
	end
end
GameEvents.UnitPrekill.Add(Leu_OnondagaTadodaho_UnitPrekill)
----------------------------------------------------------------------------------------------------------------------------
--Leu_OnondagaTadodaho_MakePeace
local function Leu_OnondagaTadodaho_MakePeace(teamID, otherTeamID)
	local playerTeam = Teams[teamID]
	local playerID = playerTeam:GetLeaderID()
	local player = Players[playerID]
	
	local otherTeam = Teams[otherTeamID]
	local otherPlayerID = otherTeam:GetLeaderID()
	local otherPlayer = Players[otherPlayerID]
	if otherPlayer:IsMinorCiv() then return end
	if player:IsMinorCiv() then return end

	--UA
	if HasTrait(player, traitLeuOnondagaTadodahoID) then
		print("Tadodaho is player and made peace")
	elseif HasTrait(otherPlayer, traitLeuOnondagaTadodahoID) then
		print("Tadodaho is otherPlayer and made peace")
		player = otherPlayer
	else
		return
	end
	--
		if (not player:IsAlive()) then return end
		--print("Tadodaho made peace")
		totalFaith = 0
		totalGAP = 0
		for unit in player:Units() do
			if not unit:IsGreatPerson() then
			local numPromos = 0
			--local numFaith = player:GetTotalFaithPerTurn()
			--local numGAP = player:GetExcessHappiness()
			local numFaith = math.ceil(nFaithPromotions*iMod)
			local numGAP = math.ceil(nGoldenAgePromotions*iMod)
			for row in GameInfo.UnitPromotions() do
				if unit:IsHasPromotion(row.ID) then
					if row.CannotBeChosen == false and row.LostWithUpgrade == false then
						numPromos = numPromos + 1
						print(row.Type)
					end
				end
			end
			--if unit:GetLevel() > 1 then numPromos = unit:GetLevel - 1 end
			print("Total promotions found:" .. numPromos .. "")
			numFaith = (numFaith*numPromos)
			numGAP = (numGAP*numPromos)
			totalFaith = totalFaith + numFaith
			totalGAP = totalGAP + numGAP
			if numGAP > 0 then
				player:ChangeGoldenAgeProgressMeter(numGAP)
				player:ChangeFaith(numFaith)
				if player:IsHuman() and player:IsTurnActive() then
					local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
					Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_PEACE] [COLOR_POSITIVE_TEXT]+{2_Num}[ENDCOLOR] [ICON_GOLDEN_AGE]", numFaith, numGAP), true)
				end
			end
			end
		end
		if totalFaith > 0 then
			if player:IsHuman() and player:IsTurnActive() then 
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_STATUS_PEACE_TADODAHO", totalFaith, totalGAP))
			end    
		end
end
GameEvents.MakePeace.Add(Leu_OnondagaTadodaho_MakePeace);
--=======================================================================================================================
--=======================================================================================================================
