--=======================================================================================================================
-- PorkBean's Lanfang Republic
--=======================================================================================================================
include("PlotIterators")
include("C15_IteratorPack_v4")
include("FLuaVector.lua")
include("IconSupport.lua")
include("InstanceManager.lua")

local bAI = true --if true, extra coding to help the AI use the unique unit

local iLanfangCiv = GameInfoTypes.CIVILIZATION_PB_LANFANG;
local iNotificationDummy = GameInfoTypes.UNIT_PB_LANFANG_NOTIFICATION;

local tPolicyOpeners = {}

for row in DB.Query("SELECT a.ID id, a.Description desc, b.ID branchid FROM Policies a, PolicyBranchTypes b WHERE a.Type = b.FreePolicy") do
	table.insert(tPolicyOpeners, {iPolicy = row.id, sName = row.desc, iBranch = row.branchid})
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

local isLanfangCivActive = JFD_IsCivilisationActive(iLanfangCiv);

--========================================================================================================================
-- UNIQUE ABILITY: Kongsi Federation
--========================================================================================================================
local iMine = GameInfoTypes.IMPROVEMENT_MINE;
local iMineDummy = GameInfoTypes.IMPROVEMENT_PB_LANFANG_MINE;
local iPolicyDummy = GameInfoTypes.BUILDING_PB_LANFANG_UA_MARKER;
local iWorker = GameInfoTypes.UNIT_WORKER;

local tMines = { [GameInfoTypes.IMPROVEMENT_MINE] = true,
	[GameInfoTypes.IMPROVEMENT_PB_LANFANG_MINE] = true
}

------------------------------------------------------------------------------------------------------------------------
-- FreePolicyTreeOnFourMines
------------------------------------------------------------------------------------------------------------------------
function FreePolicyTreeOnFourMines(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iLanfangCiv then
		for pCity in pPlayer:Cities() do
			if not pCity:IsHasBuilding(iPolicyDummy) then
				local pPlot = Map.GetPlot(pCity:GetX(), pCity:GetY())
				local iMineCounter = 0
				for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if tMines[pAdjacentPlot:GetImprovementType()] then
						if pAdjacentPlot:IsBeingWorked() and pAdjacentPlot:GetWorkingCity() == pCity then
							iMineCounter = iMineCounter+1
						end
					end
				end
				if iMineCounter >= 4 then
					pCity:SetNumRealBuilding(iPolicyDummy, 1)
					for i, v in pairs(tPolicyOpeners) do
						if not pPlayer:HasPolicy(v.iPolicy) then							
							pPlayer:SetNumFreePolicies(1)
							pPlayer:SetNumFreePolicies(0)
							pPlayer:SetPolicyBranchUnlocked(v.iBranch, true)
							pPlayer:SetHasPolicy(v.iPolicy, true)
							--print("lanfang unlocked", Locale.ConvertTextKey(v.sName), "in", pCity:GetName(), "from mines")
							if pPlayer:IsHuman() then
								local sPolicy = Locale.ConvertTextKey(v.sName)
								pPlayer:AddNotification(NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"], Locale.ConvertTextKey("TXT_KEY_TRAIT_PB_KONGSI_FEDERATION_NOTIFICATION", pCity:GetName(), sPolicy), Locale.ConvertTextKey("TXT_KEY_TRAIT_PB_KONGSI_FEDERATION_NOTIFICATION_SHORT", sPolicy), nil, nil, iNotificationDummy, -1)
							end
							break;
						end
					end
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- ChangeDummyMinesOnCapture -- when a city is captured, changes the dummy mines to regular mines (or vice versa if lanfang captures it)
------------------------------------------------------------------------------------------------------------------------
function ChangeDummyMinesOnCapture(iPlayer, bCapital, iX, iY, iNewPlayer)
	local pAttacker = Players[iNewPlayer]
	local iChangeFrom = iMineDummy
	local iChangeTo = iMine
	if pAttacker:GetCivilizationType() == iLanfangCiv then
		--print("lanfang captured a city")
		iChangeFrom = iMine
		iChangeTo = iMineDummy
	end
	local pPlot = Map.GetPlot(iX, iY)
	for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 5, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		local bIsPillaged = false
		if pAdjacentPlot and pAdjacentPlot:GetImprovementType() == iChangeFrom then
			if pAdjacentPlot:IsFlatlands() then
				if pAdjacentPlot:GetOwner() == iNewPlayer then
					if pAdjacentPlot:IsImprovementPillaged() then
						if pAdjacentPlot:GetResourceType() == -1 then
							bIsPillaged = true
						end
					end
					--print("changed a mine dummy after capture")
					pAdjacentPlot:SetImprovementType(iChangeTo)
					pAdjacentPlot:SetImprovementPillaged(bIsPillaged)
				end
			end
		end
	end
end

if isLanfangCivActive then
	GameEvents.CityCaptureComplete.Add(ChangeDummyMinesOnCapture)
	GameEvents.PlayerDoTurn.Add(FreePolicyTreeOnFourMines)
end

--========================================================================================================================
-- UNIQUE BUILDING: Zongting
--========================================================================================================================
local iZongting = GameInfoTypes.BUILDING_PB_ZONGTING
local iZongtingDummy = GameInfoTypes.BUILDING_PB_ZONGTING_GOLD_DUMMY
------------------------------------------------------------------------------------------------------------------------
-- GetNumPolicyBranches
------------------------------------------------------------------------------------------------------------------------
function GetNumPolicyBranches(pPlayer)
	local iNumBranches = 0
	for row in GameInfo.PolicyBranchTypes() do
		if pPlayer:IsPolicyBranchUnlocked(row.ID) then
			iNumBranches = iNumBranches+1
		end
	end
	return iNumBranches
end

------------------------------------------------------------------------------------------------------------------------
-- SetNumZongtingDummies
------------------------------------------------------------------------------------------------------------------------
function SetNumZongtingDummies(iPlayer)
	local pPlayer = Players[iPlayer]
	local iNumBranches = math.floor(GetNumPolicyBranches(pPlayer)/2)
	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(iZongting) then
			pCity:SetNumRealBuilding(iZongtingDummy, iNumBranches)
		else
			pCity:SetNumRealBuilding(iZongtingDummy, 0)
		end
	end
end

if isLanfangCivActive then
	GameEvents.PlayerDoTurn.Add(SetNumZongtingDummies)
end

--========================================================================================================================
-- UNIQUE UNIT: Lansaai
--========================================================================================================================
local iLansaaiPromotion = GameInfoTypes.PROMOTION_PB_LANSAAI
local iGoldRes = GameInfoTypes.RESOURCE_GOLD
local iSettler = GameInfoTypes.UNIT_SETTLER
local iAncientRuins = GameInfoTypes.IMPROVEMENT_GOODY_HUT
local iBarbarianCamp = GameInfoTypes.IMPROVEMENT_BARBARIAN_CAMP
local tGoodyHuts = {}
local tBarbCamps = {}

------------------------------------------------------------------------------------------------------------------------
-- RefreshGoodyHutLocations -- this function rechecks all ancient ruins locations on game load
------------------------------------------------------------------------------------------------------------------------
function RefreshGoodyHutLocations()
	for iPlot = 0, Map:GetNumPlots() - 1 do
	local pPlot = Map.GetPlotByIndex(iPlot)
		if pPlot:GetImprovementType() == iAncientRuins then
			tGoodyHuts[#tGoodyHuts + 1] = {
				["X"] = pPlot:GetX(),
				["Y"] = pPlot:GetY()
			}
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- RefreshBarbCampLocations -- this function rechecks all barb camp locations on game load
------------------------------------------------------------------------------------------------------------------------
function RefreshBarbCampLocations()
	for iPlot = 0, Map:GetNumPlots() - 1 do
	local pPlot = Map.GetPlotByIndex(iPlot)
		if pPlot:GetImprovementType() == iBarbarianCamp then
			tBarbCamps[#tBarbCamps + 1] = {
				["X"] = pPlot:GetX(),
				["Y"] = pPlot:GetY()
			}
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- TrackNewBarbCamps -- this function checks for new barb camps spawned during the game
------------------------------------------------------------------------------------------------------------------------
function TrackNewBarbCamps(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsBarbarian() then
		for pUnit in pPlayer:Units() do
			local pPlot = pUnit:GetPlot()
			if pPlot then
				if pPlot:GetImprovementType() == iBarbarianCamp then
					local bInsert = true
					local iX = pPlot:GetX()
					local iY = pPlot:GetY()
					for i, v in pairs(tBarbCamps) do
						if v.X == iX and v.Y == iY then
							bInsert = false
							break;
						end
					end
					if bInsert then
						tBarbCamps[#tBarbCamps + 1] = {
							["X"] = iX,
							["Y"] = iY
						}
					end
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- TrackAndCaptureGoodies --whenever ancient ruins are removed by a unit, remove it from the table
------------------------------------------------------------------------------------------------------------------------
function TrackAndCaptureGoodies(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	if iX > 0 and iY >0 then
		if (not pPlayer:IsBarbarian()) and (not pPlayer:IsMinorCiv()) then
			local iToRemove
			for i, v in pairs(tGoodyHuts) do
				if v.X == iX and v.Y == iY then
					local pUnit = pPlayer:GetUnitByID(iUnit)
					if pUnit:IsHasPromotion(iLansaaiPromotion) then
						--print("lansaai cleared ruins")
						DoSpawnGold(pPlayer, iX, iY)
					end
					iToRemove = i
				end
			end
			if iToRemove then
				table.remove(tGoodyHuts, iToRemove)
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- TrackAndCaptureBarbCamps -- whenever barb camps are removed by a unit, remove it from the table
------------------------------------------------------------------------------------------------------------------------
function TrackAndCaptureBarbCamps(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	if iX > 0 and iY >0 then
		if (not pPlayer:IsBarbarian()) then
			local iToRemove
			for i, v in pairs(tBarbCamps) do
				if v.X == iX and v.Y == iY then
					local pUnit = pPlayer:GetUnitByID(iUnit)
					if pUnit:IsHasPromotion(iLansaaiPromotion) then
						--print("lansaai cleared barb camp")
						DoSpawnGold(pPlayer, iX, iY)
					end
					iToRemove = i
				end
			end
			if iToRemove then
				table.remove(tBarbCamps, iToRemove)
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- RemoveGoodiesAndBarbsExpandedTiles -- whenever ruins or barb camps are removed by a city expanding, remove it from the table
------------------------------------------------------------------------------------------------------------------------
function RemoveGoodiesAndBarbsExpandedTiles(iPlayer, iCity, iX, iY, bGold, bFaithOrCulture)
	if bGold == false then
		CheckAndRemove(iX, iY)
	else
		local pPlot = Map.GetPlot(iX, iY)
		for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 5, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			if pAdjacentPlot and pAdjacentPlot:GetOwner() ~= -1 then
				CheckAndRemove(pAdjacentPlot:GetX(), pAdjacentPlot:GetY())
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- RemoveGoodiesAndBarbsSettledCity --whenever ruins or barb camps are removed by a city being settled, remove it from the table
------------------------------------------------------------------------------------------------------------------------
function RemoveGoodiesAndBarbsSettledCity(iPlayer, iX, iY)
	local pPlot = Map.GetPlot(iX, iY)
	for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		if pAdjacentPlot then
			CheckAndRemove(pAdjacentPlot:GetX(), pAdjacentPlot:GetY())
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- CheckAndRemove -- used by the previous functions
------------------------------------------------------------------------------------------------------------------------
function CheckAndRemove(iX, iY)
	local iToRemoveGoody
	local iToRemoveBarbCamp
	for i, v in pairs(tGoodyHuts) do
		if v.X == iX and v.Y == iY then
			iToRemoveGoody = i
			break;
		end
	end
	for i, v in pairs(tBarbCamps) do
		if v.X == iX and v.Y == iY then
			iToRemoveBarbCamp = i
			break;
		end
	end
	if iToRemoveGoody then
		table.remove(tGoodyHuts, iToRemoveGoody)
	end
	if iToRemoveBarbCamp then
		table.remove(tBarbCamps, iToRemoveBarbCamp)
	end
end

------------------------------------------------------------------------------------------------------------------------
-- TrackDefeatedEnemies -- detect when UU defeats an enemy
------------------------------------------------------------------------------------------------------------------------
function TrackDefeatedEnemies(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)
	if not bDelay then
		local pPlot = Map.GetPlot(iX, iY)
		if pPlot:GetOwner() == -1 then
			local pPlayer = Players[iPlayer]
			local pUnit = pPlayer:GetUnitByID(iUnit)
			if pUnit:IsCombatUnit() then
				for pByUnit in C15_PlotUnitsIterator(pPlot) do
					if pByUnit:IsHasPromotion(iLansaaiPromotion) and pByUnit ~= pUnit then
						local pByPlayer = Players[pByUnit:GetOwner()]
						--print("lansaai defeated an enemy")
						DoSpawnGold(pByPlayer, iX, iY)
					end
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- DoSpawnGold -- when UU destroys ancient ruins, barb camps, or an enemy unit, this is called
------------------------------------------------------------------------------------------------------------------------
function DoSpawnGold(pPlayer, iX, iY)
	local pPlot = Map.GetPlot(iX, iY)
	if pPlot:GetResourceType() ~= iGoldRes then --because this will probably fire twice on killing a barbarian inside a camp
		pPlot:SetResourceType(iGoldRes, 1)
		--print("gold spawned")
		if pPlayer:IsHuman() then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), Locale.ConvertTextKey("[ICON_RES_GOLD] Gold Struck!"), 0)
		end
	end
	for pCity in pPlayer:Cities() do
		if pCity:GetProductionUnit() == iSettler then
			local iProd = pCity:ProductionLeft()/2
			pCity:ChangeProduction(iProd)
			--print("settler boosted")
			if pPlayer:IsHuman() then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pCity:GetX(), pCity:GetY()))), Locale.ConvertTextKey("[ICON_PRODUCTION]"), 0)
			end
		end
	end
end

GameEvents.UnitPrekill.Add(TrackDefeatedEnemies)
GameEvents.UnitSetXY.Add(TrackAndCaptureGoodies)
Events.LoadScreenClose.Add(RefreshGoodyHutLocations)
GameEvents.UnitSetXY.Add(TrackAndCaptureBarbCamps)
GameEvents.PlayerDoTurn.Add(TrackNewBarbCamps)
Events.LoadScreenClose.Add(RefreshBarbCampLocations)
GameEvents.CityBoughtPlot.Add(RemoveGoodiesAndBarbsExpandedTiles)
GameEvents.PlayerCityFounded.Add(RemoveGoodiesAndBarbsSettledCity)

--========================================================================================================================
-- AI PLAYER FUNCTIONS
--========================================================================================================================
local iRecon = GameInfoTypes.UNITAI_EXPLORE
local iAttack = GameInfoTypes.UNITAI_ATTACK
local iLansaai = GameInfoTypes.UNIT_PB_LANSAAI
local iSwordsman = GameInfoTypes.UNIT_SWORDSMAN
local iScoutClass = GameInfoTypes.UNITCLASS_SCOUT
local iSwordsmanClass = GameInfoTypes.UNITCLASS_SWORDSMAN
local iMarsh = GameInfoTypes.FEATURE_MARSH

local tMineResources = {}

for row in DB.Query("SELECT a.ID resourceid, (SELECT ID FROM Technologies WHERE Type = a.TechReveal) techType FROM Resources a, Improvement_ResourceTypes b WHERE a.Type = b.ResourceType AND b.ImprovementType = 'IMPROVEMENT_PB_LANFANG_MINE'") do
	table.insert(tMineResources, {iResource = row.resourceid, iTech = row.techType})
end

------------------------------------------------------------------------------------------------------------------------
-- LansaaiAI -- Lansaai that may be able to defeat a weak nearby enemy will try to do so
------------------------------------------------------------------------------------------------------------------------
function LansaaiAI(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:HasUnitOfClassType(iScoutClass) then
		if not pPlayer:IsHuman() then
			for pUnit in pPlayer:Units() do
				if pUnit:GetUnitType() == iLansaai then
					local iNewAI = iRecon
					if pUnit:GetCurrHitPoints() == pUnit:GetMaxHitPoints() then
						local pPlot = pUnit:GetPlot()
						for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
							if pAdjacentPlot then
								for pNearbyUnit in C15_PlotUnitsIterator(pAdjacentPlot) do
									if pNearbyUnit and pNearbyUnit:IsCombatUnit() then
										if pNearbyUnit:GetCurrHitPoints() <= 30 then
											local pOtherPlayer = Players[pNearbyUnit:GetOwner()]
											local pOtherTeam = Teams[pOtherPlayer:GetTeam()]
											local iTeam = pPlayer:GetTeam()
											if pOtherTeam:IsAtWar(iTeam) then
												iNewAI = iAttack
												----print("AI lansaai changed to attack")
											end
										end
									end
								end
							end
						end
					end
					pUnit:SetUnitAIType(iNewAI)
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- SwordsmanAI -- Swordsmen that have upgraded from a Lansaai will stop scouting if a major war happens
------------------------------------------------------------------------------------------------------------------------
function SwordsmanAI(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:HasUnitOfClassType(iSwordsmanClass) then
		if not pPlayer:IsHuman() then
			local pTeam = Teams[pPlayer:GetTeam()]
			if pTeam:GetAtWarCount(true) > 0 then
				for pUnit in pPlayer:Units() do
					if pUnit:GetUnitType() == iSwordsman then
						if pUnit:IsHasPromotion(iLansaaiPromotion) then
							pUnit:SetUnitAIType(iAttack)
							----print("AI swordsman (former lansaai) changed to attack")
						end
					end
				end
			end
		end
	end
end
	
if bAI then
	GameEvents.PlayerDoTurn.Add(LansaaiAI)
	GameEvents.PlayerDoTurn.Add(SwordsmanAI)
end