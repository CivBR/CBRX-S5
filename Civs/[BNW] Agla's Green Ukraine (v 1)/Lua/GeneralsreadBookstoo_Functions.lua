-- JFD_Civs_GreatSeljuqsMulk_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
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
--==========================================================================================================================
-- MOD USE
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------

local civilizationGreatSeljuqsMulkID = GameInfoTypes["CIVILIZATION_AGLA_ZELENY_KLYN"]
local traitGreatSeljuqsMulkID = GameInfoTypes["TRAIT_AGLA_ZELENY_KLYN"]
local unitAtabegID = GameInfoTypes["UNIT_AGLA_YESAUL"]
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------

--JFD_GreatSeljuqsMulk_PlayerDoTurn

local promotionAtabegID = GameInfoTypes["PROMOTION_AGLA_YESAUL"]
local buildingDummyGreenUkraineID = GameInfoTypes["BUILDING_DUMMY_AGLA_YESAUL"]
local specialistScientistID = GameInfoTypes["SPECIALIST_WRITER"]
local specialistScientistGPP = GameInfo.Specialists["SPECIALIST_WRITER"].GreatPeopleRateChange
local function JFD_GreatSeljuqsMulk_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end

	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
		
	local hasTrait = HasTrait(player, traitGreatSeljuqsMulkID)
	if hasTrait then

			
		--BOOK OF GOVERNMENT
		local numGPRMod = player:GetGreatPeopleRateModifier()
		for city in player:Cities() do
			local numScientists = city:GetSpecialistCount(specialistScientistID)
			
			local numCityGPRMod = (city:GetGreatPeopleRateModifier()+numGPRMod)
			if (not city:IsCapital()) then
					local numThisGSP = (numScientists*specialistScientistGPP)
					numThisGSP = numThisGSP + ((numThisGSP*numCityGPRMod)/100)
					numThisGSP = ((numThisGSP*numGPRMod)/100)*100
					city:ChangeSpecialistGreatPersonProgressTimes100(specialistScientistID, -numThisGSP)
					playerCapital:ChangeSpecialistGreatPersonProgressTimes100(specialistScientistID, numThisGSP)
				
			end

			local numThisGSP = 0
			numThisGSP = numThisGSP + (numScientists*specialistScientistGPP)
			numThisGSP = numThisGSP + ((numThisGSP*numCityGPRMod)/100)
			if numThisGSP ~= 0 then
				player:ChangeCombatExperience(numThisGSP)
			end
		end
	end
	for unit in player:Units() do
		--ATABEG
		if unit:IsHasPromotion(promotionAtabegID) then
			local plotX, plotY = unit:GetX(), unit:GetY()
			local unitPlot = g_MapGetPlot(plotX, plotY)
			
			local city = unitPlot:GetPlotCity()
			if city then
				if city:SetNumRealBuilding(buildingDummyGreenUkraineID, 1) then
				end
			end
			
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_GreatSeljuqsMulk_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
--==========================================================================================================================