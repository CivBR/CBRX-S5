-- DMS_Ethiopia_Functions
-- Author: DMS
--==========================================================================================================================
-- includes
--==========================================================================================================================
include("FLuaVector.lua")
include("PlotIterators.lua")
include("IconSupport")
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- DMS_GetUserSetting (adapted from JFD's JFD_GetUserSetting - credit goes there!)
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetUserSetting(type)
	for row in GameInfo.DMS_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- Debug
----------------------------------------------------------------------------------------------------------------------------
local bPrintForZaraYaqobDebug		= DMS_GetUserSetting("DMS_ETHIOPIA_ZARA_YAQOB_DEBUGGING_ON") == 0

function DMS_ZYPrint(string)
	if bPrintForZaraYaqobDebug then
		return
	else
		return print(string)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
----------------------------------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SendNotification
----------------------------------------------------------------------------------------------------------------------------
function JFD_SendNotification(playerID, notificationType, description, descriptionShort, global, iX, iY)
	local player = Players[playerID]
	if global then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
	else
		if player:IsHuman() then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
--IsCPDLL
----------------------------------------------------------------------------------------------------------------------------
function IsCPDLL()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPDLL = IsCPDLL()
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
----------------------------------------------------------------------------------------------------------------------------
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
--IsUsingCiD
----------------------------------------------------------------------------------------------------------------------------
function IsUsingCiD()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "10e9728f-d61c-4317-be4f-7d52d6bae6f4" then
			return true
		end
	end
	return false
end
local isUsingCiD = IsUsingCiD()
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_convertUnit
----------------------------------------------------------------------------------------------------------------------------
function DMS_convertUnit(pUnit, pNewUnitType)
	local pPlayer = Players[pUnit:GetOwner()]
	local pNewUnit = pPlayer:InitUnit(pNewUnitType, pUnit:GetX(), pUnit:GetY())
	pNewUnit:SetDamage(pUnit:GetDamage())
	pNewUnit:SetExperience(pUnit:GetExperience())
	pNewUnit:SetLevel(pUnit:GetLevel())
	for unitPromotion in GameInfo.UnitPromotions() do
		local iPromotionID = unitPromotion.ID;
		if (pUnit:IsHasPromotion(iPromotionID)) then
			if (pNewUnit:IsPromotionValid(iPromotionID)) then
				pNewUnit:SetHasPromotion(iPromotionID, true)
			end
		end
	end
	-- kill off the old unit
	pUnit:Kill() 
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_GetWriterCity
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetWriterCity(pPlayer)
	local pWriterCity = nil
	local pCapital = pPlayer:GetCapitalCity()
	if pCapital then 
		pWriterCity = pCapital
	end
	for pCity in pPlayer:Cities() do
		if pCity and pCity ~= pWriterCity then
			local buildingWritersGuildID = GameInfoTypes["BUILDING_WRITERS_GUILD"]
			if pCity:IsHasBuilding(buildingWritersGuildID) then
				pWriterCity = pCity
				
			end
		end
	end

	return pWriterCity
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_GetNearestCity
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetNearestCity(pPlayer, plotX, plotY)
	local iDistance = nil
	local pTargetCity = nil
	for pCity in pPlayer:Cities() do
		if not(iDistance) or iDistance > Map.PlotDistance(plotX, plotY, pCity:GetX(), pCity:GetY()) then
			pTargetCity = pCity
			iDistance = Map.PlotDistance(plotX, plotY, pCity:GetX(), pCity:GetY())
		end
	end
	return(pTargetCity)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetEraAdjustedValue
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return math.ceil(num * eraMod/100)
end
----------------------------------------------------------------------------------------------------------------------------
-- CountDemGreatWorks
----------------------------------------------------------------------------------------------------------------------------
local sGreatWorkClass						= "GREAT_WORK_SLOT_LITERATURE"
local iGreatWorkClass						= GameInfoTypes[sGreatWorkClass]

local tGWBuildings = {}
for row in DB.Query("SELECT ID, BuildingClass, GreatWorkCount FROM Buildings WHERE GreatWorkCount > 0 AND GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE'") do
	tGWBuildings[row.ID] = {BuildingClassID = GameInfoTypes[row.BuildingClass], NumGreatWorksSlots = row.GreatWorkCount}
	--tGWBuildings[row.ID] = {["BuildingClass"] = row.BuildingClass, ["GreatWorkCount"] = row.GreatWorkCount}
	DMS_ZYPrint("tGWBuildings: added building to table..")
end

function CountDemGreatWorks(pCity, gwTable)
	DMS_ZYPrint("CountDemGreatWorks called..")
    local iCount = 0
	DMS_ZYPrint("CountDemGreatWorks: iterate table..")
    for k, v in pairs(tGWBuildings) do
        if pCity:IsHasBuilding(k) then
			DMS_ZYPrint("CountDemGreatWorks: city has great works building..")
            for i = 0, v.NumGreatWorksSlots - 1, 1 do
                local iGreatWorkType = pCity:GetBuildingGreatWork(v.BuildingClassID, i)
				DMS_ZYPrint("CountDemGreatWorks: Game.GetGreatWorkType(iGreatWorkType) = " .. Game.GetGreatWorkType(iGreatWorkType) .. "..")
                if gwTable[Game.GetGreatWorkType(iGreatWorkType)] then
                    iCount = iCount + 1
					DMS_ZYPrint("CountDemGreatWorks: iCount = " .. iCount .. "..")
                end
            end
        end
    end
    return iCount
end
----------------------------------------------------------------------------------------------------------------------------
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID 						= Game.GetActivePlayer()
local activePlayer 							= Players[activePlayerID]
local activePlayerTeam 						= Teams[Game.GetActiveTeam()]

local civilisationEthiopiaZaraYaqobID		= GameInfoTypes["CIVILIZATION_DMS_ETHIOPIA_YAQOB"]
local isEthiopiaZaraYaqobCivActive 			= JFD_IsCivilisationActive(civilisationEthiopiaZaraYaqobID)
local isEthiopiaZaraYaqobActivePlayer 		= activePlayer:GetCivilizationType() == civilisationEthiopiaZaraYaqobID

-- traits
local traitSeedOfJacobID					= GameInfoTypes["TRAIT_DMS_SEED_OF_JACOB"]

-- buildings, units, improvements
local improvementMonolithicChurchID			= GameInfoTypes["IMPROVEMENT_DMS_MONOLITHIC_CHURCH"]
local improvementMonolithicChurch1ID		= GameInfoTypes["IMPROVEMENT_DMS_MONOLITHIC_CHURCH_1"]
local improvementMonolithicChurch2ID		= GameInfoTypes["IMPROVEMENT_DMS_MONOLITHIC_CHURCH_2"]
local improvementMonolithicChurch3ID		= GameInfoTypes["IMPROVEMENT_DMS_MONOLITHIC_CHURCH_3"]
local improvementMonolithicChurch4ID		= GameInfoTypes["IMPROVEMENT_DMS_MONOLITHIC_CHURCH_4"]
local improvementMonolithicChurch5ID		= GameInfoTypes["IMPROVEMENT_DMS_MONOLITHIC_CHURCH_5"]

local unitDebteraID							= GameInfoTypes["UNIT_DMS_DEBTERA"]
local iProphetID							= GameInfo.Units.UNIT_PROPHET.ID
local iProphetOverride						= GameInfo.Units.UNIT_DMS_DEBTERA.ID

local buildingWritersGuildID				= GameInfoTypes["BUILDING_WRITERS_GUILD"]
local specialistWriter						= GameInfoTypes["SPECIALIST_WRITER"]
local unitWriterID							= GameInfoTypes["UNIT_WRITER"]

-- dummy buildings
local buildingZaraYaqobGreatWorksWriting1ID	= GameInfoTypes["BUILDING_DMS_ZY_GREAT_WORKS_WRITING_1"]
local buildingZaraYaqobGreatWorksWriting2ID	= GameInfoTypes["BUILDING_DMS_ZY_GREAT_WORKS_WRITING_2"]
local buildingZaraYaqobGreatWorksWriting3ID	= GameInfoTypes["BUILDING_DMS_ZY_GREAT_WORKS_WRITING_3"]
local buildingZaraYaqobGreatWorksWriting4ID	= GameInfoTypes["BUILDING_DMS_ZY_GREAT_WORKS_WRITING_4"]
local buildingZaraYaqobGreatWorksWriting5ID	= GameInfoTypes["BUILDING_DMS_ZY_GREAT_WORKS_WRITING_5"]
local buildingDefenseFromFaithID		= GameInfoTypes["BUILDING_DMS_ZY_DEFENSE"]
local buildingReligiousPressureWriterID		= GameInfoTypes["BUILDING_DMS_ZY_RELIGIOUS_PRESSURE"]

-- promotions
local tSeedPromos = {}
for i = 1, 25 do
	tSeedPromos[i] = GameInfoTypes["PROMOTION_DMS_SEED_OF_JACOB_" .. i]
end

-- combat types
local unitCombatTypeRecon					= GameInfoTypes["UNITCOMBAT_RECON"]
local unitCombatTypeMounted					= GameInfoTypes["UNITCOMBAT_MOUNTED"]
local unitCombatTypeMelee					= GameInfoTypes["UNITCOMBAT_MELEE"]
local unitCombatTypeGun						= GameInfoTypes["UNITCOMBAT_GUN"]
local unitCombatTypeArmor					= GameInfoTypes["UNITCOMBAT_ARMOR"]

-- various
local domainLandID							= GameInfoTypes["DOMAIN_LAND"]
local greatWorkLiteratureID					= GameInfoTypes["GREAT_WORK_SLOT_LITERATURE"]
local techFlightID							= GameInfoTypes["TECH_FLIGHT"]
local yieldFaithID							= GameInfoTypes["YIELD_FAITH"]
local yieldProductionID						= GameInfoTypes["YIELD_PRODUCTION"]
local resourceOilID							= GameInfoTypes["RESOURCE_OIL"]

local tGTI = {}
for row in GameInfo.Improvements() do
	if row.CreatedByGreatPerson == 1 then
		tGTI[row.ID] = true
	end
end

local gwTable = {}
for work in GameInfo.GreatWorks() do
	if work.GreatWorkClassType == "GREAT_WORK_LITERATURE" then
		--DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields: work is literature..")
		gwTable[work.ID] = work.ID
		--DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields: work id = " .. work.ID .. "..")
	end
end

if isEthiopiaZaraYaqobCivActive then
	print("Zara Yaqob of Ethiopia enters the game!")
end
--==========================================================================================================================
-- MAIN FUNCTIONS ZARA YAQOB
--==========================================================================================================================
-- DMS_ZY_OnExpendedDebtera
----------------------------------------------------------------------------------------------------------------------------
local bDebtera = false

function DMS_ZY_OnExpendedDebtera(iPlayer, eGreatPersonType, eGreatPersonTypeCP)
	if eGreatPersonTypeCP then eGreatPersonType = eGreatPersonTypeCP end
	local pPlayer = Players[iPlayer]
	if eGreatPersonType == unitDebteraID then
		bDebtera = true
		DMS_ZYPrint("DMS_ZY_OnExpendedDebtera: bDebtera = true")
	end
end

if isEthiopiaZaraYaqobCivActive then
	GameEvents.GreatPersonExpended.Add(DMS_ZY_OnExpendedDebtera)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_ZY_ExpendedDebtera
----------------------------------------------------------------------------------------------------------------------------
function DMS_ZY_ExpendedDebtera(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)
	if bDebtera == true then
		DMS_ZYPrint("DMS_ZY_ExpendedDebtera: bDebtera = true..")
		local pPlot = Map.GetPlot(iX, iY)
		if pPlot then
			DMS_ZYPrint("DMS_ZY_ExpendedDebtera: pPlot (" .. iX .. "," .. iY .. ")..")
			for pAdjPlot in PlotAreaSweepIterator(pPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				if pAdjPlot and pAdjPlot:IsUnit() then
					local iNumTileUnits = pAdjPlot:GetNumUnits()
					if iNumTileUnits > 0 then
						for i = 0, pAdjPlot:GetNumUnits() do
							local pAdjUnit = pAdjPlot:GetUnit(i)
							if pAdjUnit and pAdjUnit:GetOwner() == iPlayer and pAdjUnit:IsCombatUnit() and pAdjUnit:GetDomainType() == domainLandID then
								DMS_ZYPrint("DMS_ZY_ExpendedDebtera: found nearby combat land unit at pPlot (" .. pAdjPlot:GetX() .. "," .. pAdjPlot:GetY() .. ")..")
								local iDamage = pAdjUnit:GetDamage()
								DMS_ZYPrint("DMS_ZY_ExpendedDebtera: iDamage = (" .. iDamage .. ")..")
								if iDamage > 0 then
									pAdjUnit:ChangeDamage(-1 * math.min(25, pAdjUnit:GetMaxHitPoints() - pAdjUnit:GetCurrHitPoints()))
									DMS_ZYPrint("DMS_ZY_ExpendedDebtera: healed unit " .. math.min(25, pAdjUnit:GetMaxHitPoints() - pAdjUnit:GetCurrHitPoints()) .. " HP..")
								end
								if (pAdjUnit:GetUnitCombatType() == unitCombatTypeMelee) or (pAdjUnit:GetUnitCombatType() == unitCombatTypeRecon) or (pAdjUnit:GetUnitCombatType() == unitCombatTypeMounted) or (pAdjUnit:GetUnitCombatType() == unitCombatTypeGun) or (pAdjUnit:GetUnitCombatType() == unitCombatTypeArmor) then
									DMS_ZYPrint("DMS_ZY_ExpendedDebtera: unit is correct type to get Seed of Jacob promotion..")
									local bNeedsFirstPromo = true
									for kNum, vPromo in pairs(tSeedPromos) do
										if pAdjUnit:IsHasPromotion(vPromo) then
											bNeedsFirstPromo = false
											break
										end
									end
									if bNeedsFirstPromo then
										DMS_ZYPrint("DMS_ZY_ExpendedDebtera: unit does not  already have Seed of Jacob promotion..")
										pAdjUnit:SetHasPromotion(tSeedPromos[1], true)
										Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pAdjPlot:GetX(), pAdjPlot:GetY()))), "'Seed of Jacob' Promotion granted", 0)
										DMS_ZYPrint("DMS_ZY_ExpendedDebtera: Seed of Jacob promotion granted..")
									end
								end 
							end
						end
					end
				end
			end
		end
		
		bDebtera = false
		DMS_ZYPrint("DMS_ZY_ExpendedDebtera: reset bDebtera = false..")
	end
end

if isEthiopiaZaraYaqobCivActive then
	GameEvents.UnitPrekill.Add(DMS_ZY_ExpendedDebtera)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_ZY_SeedOfJacobPromotion
----------------------------------------------------------------------------------------------------------------------------
function DMS_ZY_SeedOfJacobPromotion(iPlayer)
	local pPlayer = Players[iPlayer]	
	if HasTrait(pPlayer, traitSeedOfJacobID) then
		for pUnit in pPlayer:Units() do
			if pUnit and pUnit:IsCombatUnit() and pUnit:GetDomainType() == domainLandID then
				for kNum, vPromo in pairs(tSeedPromos) do
					if pUnit:IsHasPromotion(vPromo) then
						DMS_ZYPrint("DMS_ZY_SeedOfJacobPromotion: unit at plot (" .. pUnit:GetPlot():GetX() .. "," .. pUnit:GetPlot():GetY() .. ") has the Seed of Jacob " .. kNum .. " promotion..")
						pUnit:SetHasPromotion(vPromo, false)
						if kNum < 25 then
							local iNextNum = kNum + 1
							pUnit:SetHasPromotion(tSeedPromos[iNextNum], true)
							DMS_ZYPrint("DMS_ZY_SeedOfJacobPromotion: granted Seed of Jacob " .. iNextNum .. " promotion..")
						end
						DMS_ZYPrint("DMS_ZY_SeedOfJacobPromotion: removed Seed of Jacob " .. kNum .. " promotion..")
						break
					end
				end
			end
		end
	end
end

if isEthiopiaZaraYaqobCivActive then
	GameEvents.PlayerDoTurn.Add(DMS_ZY_SeedOfJacobPromotion)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_ZY_SeedOfJacobKill
----------------------------------------------------------------------------------------------------------------------------
local iFirstTimeThroughKillerData = "NONE"
function DMS_ZY_SeedOfJacobKill(iOwner, iUnit, iUnitType, iX, iY, bDelay, iKiller)
	if bDelay then
		iFirstTimeThroughKillerData = iKiller
		return
	end
	if iOwner == Game.GetActivePlayer() then
		return
	end
	if iFirstTimeThroughKillerData == -1 then
		iFirstTimeThroughKillerData = "NONE"
		return
	end
	if iFirstTimeThroughKillerData == "NONE" then
		return
	end
	local pOwnerPlayer = Players[iOwner]
	local pUnitKilled = pOwnerPlayer:GetUnitByID(iUnit)
	if pUnitKilled:GetDomainType() ~= domainLandID then
		return	
	end
	local pKillerPlayer = Players[iFirstTimeThroughKillerData]
	iFirstTimeThroughKillerData = "NONE"
	if (not HasTrait(pKillerPlayer, traitSeedOfJacobID)) then
		return
	end
	local pPlot = Map.GetPlot(iX, iY)
	local iNumTileUnits = pPlot:GetNumUnits()
	if iNumTileUnits > 1 then
		for i = 0, pPlot:GetNumUnits() do
			local pUnit = pPlot:GetUnit(i)
			if pUnit then
				local iPlotUnitOwner = pUnit:GetOwner()
				local iPlotUnitType = pUnit:GetUnitType()

				if pUnit ~= pUnitKilled then
					local bKilledByAnySeedOfJacob = false
					for kNum, vPromo in pairs(tSeedPromos) do
						if pUnit:IsHasPromotion(vPromo) then
							bKilledByAnySeedOfJacob = true
							break
						end
					end
					if bKilledByAnySeedOfJacob then
						DMS_ZYPrint("DMS_ZY_SeedOfJacobKill: unit killed by unit with a Seed of Jacob promotion..")
						local pCity = DMS_GetWriterCity(pKillerPlayer)
						if pCity then
							DMS_ZYPrint("DMS_ZY_SeedOfJacobKill: city of " .. pCity:GetName() .. " is writer city..")
							local iMinNum = 5
							local iGreatWriterPoints = math.ceil(iMinNum * JFD_GetRandom(1,3))
							DMS_ZYPrint("DMS_ZY_SeedOfJacobKill: iGreatWriterPoints = " .. iGreatWriterPoints .. "..")
							pCity:ChangeSpecialistGreatPersonProgressTimes100(specialistWriter, iGreatWriterPoints * 100)
							DMS_ZYPrint("DMS_ZY_SeedOfJacobKill: " .. iGreatWriterPoints .. " great writer points added..")
							if pKillerPlayer:IsHuman() then
								Events.GameplayAlertMessage("A Unit with the 'Seed of Jacob' Promotion has killed an enemy and generated " .. iGreatWriterPoints .. " [ICON_GREAT_WRITER] Great Writer Points!");
								DMS_ZYPrint("DMS_ZY_SeedOfJacobKill: notification sent..")
							end
						end
					end
				end
			end
		end
	end
end

if isEthiopiaZaraYaqobCivActive then
	GameEvents.UnitPrekill.Add(DMS_ZY_SeedOfJacobKill)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_ProphetToDebteraConverter
----------------------------------------------------------------------------------------------------------------------------
function DMS_ProphetToDebteraConverter(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	if HasTrait(pPlayer, traitSeedOfJacobID) then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if (not pUnit) then return end
		local pUnitType = pUnit:GetUnitType()
		if pUnitType and (pUnitType == iProphetID) then
			DMS_ZYPrint("DMS_ProphetToDebteraConverter: prophet found for Zara Yaqob..")
			local pNewUnit = pPlayer:InitUnit(unitDebteraID, pUnit:GetX(), pUnit:GetY())
			DMS_ZYPrint("DMS_ProphetToDebteraConverter: init debtera..")
			pNewUnit:Convert(pUnit)	
			pUnit:Kill(-1)
			DMS_ZYPrint("DMS_ProphetToDebteraConverter: kill old unit..")
		end
	elseif (not HasTrait(pPlayer, traitSeedOfJacobID)) then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if (not pUnit) then return end
		local pUnitType = pUnit:GetUnitType()
		if (pUnitType == unitDebteraID) then
			DMS_ZYPrint("DMS_ProphetToDebteraConverter: debtera found for other civ NOT the correct type..")
			local pNewUnit = pPlayer:InitUnit(iProphetID, pUnit:GetX(), pUnit:GetY())
			DMS_ZYPrint("DMS_ProphetToDebteraConverter: init prophet..")
			pNewUnit:Convert(pUnit)	
			pUnit:Kill(-1)
			DMS_ZYPrint("DMS_ProphetToDebteraConverter: kill old unit..")
		end
	end
end

if isEthiopiaZaraYaqobCivActive then
	--Events.SerialEventUnitCreated.Add(DMS_ProphetToDebteraConverter)
end

function DMS_CanTrainProphet(iPlayer, iUnit)
    local pPlayer = Players[iPlayer]
    local bIs = HasTrait(pPlayer, traitSeedOfJacobID)
    if bIs and iUnit == iProphetID then
        return false
    elseif (not bIs) and iUnit == unitDebteraID then
        return false
    else
        return true
    end
    return true
end

GameEvents.PlayerCanTrain.Add(DMS_CanTrainProphet)
----------------------------------------------------------------------------------------------------------------------------
-- DebteraOverride
----------------------------------------------------------------------------------------------------------------------------
function DebteraOverride(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	if HasTrait(pPlayer, traitSeedOfJacobID) then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if pUnit and (pUnit:GetUnitType() == iProphetID) then
			--Events.SerialEventUnitCreated.Remove(ProphetOverride)
			local newUnit = pPlayer:InitUnit(iProphetOverride, pUnit:GetX(), pUnit:GetY())				
			newUnit:Convert(pUnit);	
			--Events.SerialEventUnitCreated.Add(AbiiruOverride)
        end
    end
end

if isEthiopiaZaraYaqobCivActive then
	Events.SerialEventUnitCreated.Add(DebteraOverride)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_ZY_MonolithicChurches_GreatWorksWritingSlot
----------------------------------------------------------------------------------------------------------------------------
DMS_ZaraYaqobImprovements_PlayerID = 0
DMS_ZaraYaqobImprovements_X = 0
DMS_ZaraYaqobImprovements_Y = 0

function DMS_ZY_MonolithicChurches_GreatWorksWritingSlot(iPlayer, iX, iY)
	if(DMS_ZaraYaqobImprovements_PlayerID == iPlayer and DMS_ZaraYaqobImprovements_X == iX and DMS_ZaraYaqobImprovements_Y == iY) then
		
		return
	end
	-- Store inputs for duplication check
	DMS_ZaraYaqobImprovements_PlayerID = iPlayer
	DMS_ZaraYaqobImprovements_X = iX
	DMS_ZaraYaqobImprovements_Y = iY
	
	local pPlayer = Players[iPlayer]
	DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: Improvement built at plot (" .. iX .. "," .. iY .. ")..")
	--if pPlayer and pPlayer:IsEverAlive() and pPlayer:GetCivilizationType() == civilisationDervishStateID then
	local pPlot = Map.GetPlot(iX, iY)
	local pCity = DMS_GetNearestCity(pPlayer, iX, iY)
	if pCity then
		DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: nearest city is (" .. pCity:GetName() .. ")..")
		if pPlot then
			if pPlot:GetImprovementType() == improvementMonolithicChurchID then
				DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: improvement is a Monolithic church..") 
				if pCity:IsHasBuilding(buildingZaraYaqobGreatWorksWriting6ID) then
					-- city cannot receive more great works of writing from monolithic churches
					DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: city has max Great Writer slots from monolithic churches..")
				elseif pCity:IsHasBuilding(buildingZaraYaqobGreatWorksWriting5ID) then
					DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: city has 5 Great Writer slots from monolithic churches..")
					pCity:SetNumRealBuilding(buildingZaraYaqobGreatWorksWriting6ID, 1)
					DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: added one more..")
				elseif pCity:IsHasBuilding(buildingZaraYaqobGreatWorksWriting4ID) then
					DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: city has 4 Great Writer slots from monolithic churches..")
					pCity:SetNumRealBuilding(buildingZaraYaqobGreatWorksWriting5ID, 1)
					DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: added one more..")
				elseif pCity:IsHasBuilding(buildingZaraYaqobGreatWorksWriting3ID) then
					DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: city has 3 Great Writer slots from monolithic churches..")
					pCity:SetNumRealBuilding(buildingZaraYaqobGreatWorksWriting4ID, 1)
					DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: added one more..")
				elseif pCity:IsHasBuilding(buildingZaraYaqobGreatWorksWriting2ID) then
					DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: city has 2 Great Writer slots from monolithic churches..")
					pCity:SetNumRealBuilding(buildingZaraYaqobGreatWorksWriting3ID, 1)
					DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: added one more..")
				elseif pCity:IsHasBuilding(buildingZaraYaqobGreatWorksWriting1ID) then
					DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: city has 1 Great Writer slot from monolithic churches..")
					pCity:SetNumRealBuilding(buildingZaraYaqobGreatWorksWriting2ID, 1)
					DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: added one more..")
				elseif (not pCity:IsHasBuilding(buildingZaraYaqobGreatWorksWriting1ID)) then
					DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: city does not have any Great Writer slots from monolithic churches..")
					pCity:SetNumRealBuilding(buildingZaraYaqobGreatWorksWriting1ID, 1)
					DMS_ZYPrint("DMS_ZY_MonolithicChurches_GreatWorksWritingSlot: added one..")
				end
			end
		end
	end
end

if isEthiopiaZaraYaqobCivActive then
	GameEvents.BuildFinished.Add(DMS_ZY_MonolithicChurches_GreatWorksWritingSlot)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_ZY_MonolithicChurches_ExtraYields
----------------------------------------------------------------------------------------------------------------------------
function DMS_ZY_MonolithicChurches_ExtraYields(iPlayer)
	local pPlayer = Players[iPlayer]	
	if HasTrait(pPlayer, traitSeedOfJacobID) then
		for pCity in pPlayer:Cities() do
			DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields: iterating cities..")
			if pCity then
				--local iNumGreatWorks = pCity:GetNumGreatWorks(greatWorkLiteratureID) -- issue is here!!
				local iNumGreatWorks = CountDemGreatWorks(pCity, gwTable)
				DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields: iNumGreatWorks = " .. iNumGreatWorks .. "..")
				if iNumGreatWorks > 0 then
				DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields: city of " .. pCity:GetName() .. " has " .. iNumGreatWorks .. " Great Work of Writing slots..")
					for nearbyPlot in PlotAreaSweepIterator(pCity:Plot(), 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						if nearbyPlot and nearbyPlot:GetOwner() == iPlayer and nearbyPlot:GetWorkingCity() == pCity then
							DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields: city of " .. pCity:GetName() .. " is working plot (" .. nearbyPlot:GetX() .. "," .. nearbyPlot:GetY() .. ")..")
							if nearbyPlot:GetImprovementType() == improvementMonolithicChurchID or nearbyPlot:GetImprovementType() == improvementMonolithicChurch1ID or nearbyPlot:GetImprovementType() == improvementMonolithicChurch2ID or nearbyPlot:GetImprovementType() == improvementMonolithicChurch3ID or nearbyPlot:GetImprovementType() == improvementMonolithicChurch4ID or nearbyPlot:GetImprovementType() == improvementMonolithicChurch5ID then
								DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields: plot has monolithic church improvement..")
								if iNumGreatWorks == 1 then
									nearbyPlot:SetImprovementType(improvementMonolithicChurch1ID)
									DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields: set improvement monolithic church 1..")
								elseif iNumGreatWorks == 2 then
									nearbyPlot:SetImprovementType(improvementMonolithicChurch2ID)
									DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields: set improvement monolithic church 2..")
								elseif iNumGreatWorks == 3 then
									nearbyPlot:SetImprovementType(improvementMonolithicChurch3ID)
									DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields: set improvement monolithic church 3..")
								elseif iNumGreatWorks == 4 then
									nearbyPlot:SetImprovementType(improvementMonolithicChurch4ID)
									DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields: set improvement monolithic church 4..")
								elseif iNumGreatWorks >= 5 then
									nearbyPlot:SetImprovementType(improvementMonolithicChurch5ID)
									DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields: set improvement monolithic church 5..")
								end
							end
						end
					end
				end
			end
		end
	end
end

function DMS_ZY_MonolithicChurches_ExtraYields_New(iPlayer)
	local pPlayer = Players[iPlayer]
	local pTeam = Teams[pPlayer]
	if HasTrait(pPlayer, traitSeedOfJacobID) then
		for pCity in pPlayer:Cities() do
			if pCity then
				local iNumGreatWorks = CountDemGreatWorks(pCity, gwTable)
				DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: " .. pCity:GetName() .. ", iNumGreatWorks = " .. iNumGreatWorks .. "..")
				if iNumGreatWorks > 0 then
					for nearbyPlot in PlotAreaSweepIterator(pCity:Plot(), 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						if nearbyPlot and nearbyPlot:GetOwner() == iPlayer and nearbyPlot:GetWorkingCity() == pCity then
							DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: checking plot (" .. nearbyPlot:GetX() .. "," .. nearbyPlot:GetY() .. ") near " .. pCity:GetName() .. "")
							if nearbyPlot:GetImprovementType() == improvementMonolithicChurchID then
								DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: plot (" .. nearbyPlot:GetX() .. "," .. nearbyPlot:GetY() .. ") near " .. pCity:GetName() .. " has a monolithic church, lets increase dem yields!")
								-- Production
								local iNearbyPlotProductionYield = nearbyPlot:GetYield(yieldProductionID)
								local iNearbyPlotProductionNatureYield = nearbyPlot:CalculateNatureYield(yieldProductionID, pTeam, false)
								local iNearbyPlotProductionImprovementYield = nearbyPlot:CalculateImprovementYieldChange(improvementMonolithicChurchID, yieldProductionID, pPlayer)
								DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: iNearbyPlotProductionYield = " .. iNearbyPlotProductionYield .. "")
								DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: iNearbyPlotProductionNatureYield = " .. iNearbyPlotProductionNatureYield .. "")
								DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: iNearbyPlotProductionImprovementYield = " .. iNearbyPlotProductionImprovementYield .. "")
								if iNearbyPlotProductionYield == iNearbyPlotProductionNatureYield + iNearbyPlotProductionImprovementYield + (iNumGreatWorks - 1) then
									Game.SetPlotExtraYield(nearbyPlot:GetX(), nearbyPlot:GetY(), yieldProductionID, iNumGreatWorks)
									DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: added extra production yield from plot (" .. nearbyPlot:GetX() .. "," .. nearbyPlot:GetY() .. ")")
								end
								-- Faith
								local iNearbyPlotFaithYield = nearbyPlot:GetYield(yieldFaithID)
								local iNearbyPlotFaithNatureYield = nearbyPlot:CalculateNatureYield(yieldFaithID, pTeam, false)
								local iNearbyPlotFaithImprovementYield = nearbyPlot:CalculateImprovementYieldChange(improvementMonolithicChurchID, yieldFaithID, pPlayer)
								DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: iNearbyPlotFaithYield = " .. iNearbyPlotFaithYield .. "")
								DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: iNearbyPlotFaithNatureYield = " .. iNearbyPlotFaithNatureYield .. "")
								DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: iNearbyPlotFaithImprovementYield = " .. iNearbyPlotFaithImprovementYield .. "")
								if iNearbyPlotFaithYield == iNearbyPlotFaithNatureYield + iNearbyPlotFaithImprovementYield + (iNumGreatWorks - 1) then
									Game.SetPlotExtraYield(nearbyPlot:GetX(), nearbyPlot:GetY(), yieldFaithID, iNumGreatWorks)
									DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: added extra faith yield from plot (" .. nearbyPlot:GetX() .. "," .. nearbyPlot:GetY() .. ")")
								end
							else
								DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: plot (" .. nearbyPlot:GetX() .. "," .. nearbyPlot:GetY() .. ") near " .. pCity:GetName() .. " does not have a monolithic church, check if it has extra yields")
								local iNearbyPlotProductionYield = nearbyPlot:GetYield(yieldProductionID)
								local iNearbyPlotProductionNatureYield = nearbyPlot:CalculateNatureYield(yieldProductionID, pTeam, false)
								local iNearbyPlotProductionImprovementYield = nearbyPlot:CalculateImprovementYieldChange(improvementMonolithicChurchID, yieldProductionID, pPlayer)
								DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: iNearbyPlotProductionYield = " .. iNearbyPlotProductionYield .. "")
								DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: iNearbyPlotProductionNatureYield = " .. iNearbyPlotProductionNatureYield .. "")
								DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: iNearbyPlotProductionImprovementYield = " .. iNearbyPlotProductionImprovementYield .. "")
								if iNearbyPlotProductionYield == iNearbyPlotProductionNatureYield + iNearbyPlotProductionImprovementYield then
									Game.SetPlotExtraYield(nearbyPlot:GetX(), nearbyPlot:GetY(), yieldProductionID, -iNumGreatWorks)
									DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: removed extra production yield from plot (" .. nearbyPlot:GetX() .. "," .. nearbyPlot:GetY() .. ")")
								end
								-- Faith
								local iNearbyPlotFaithYield = nearbyPlot:GetYield(yieldFaithID)
								local iNearbyPlotFaithNatureYield = nearbyPlot:CalculateNatureYield(yieldFaithID, pTeam, false)
								local iNearbyPlotFaithImprovementYield = nearbyPlot:CalculateImprovementYieldChange(improvementMonolithicChurchID, yieldFaithID, pPlayer)
								DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: iNearbyPlotFaithYield = " .. iNearbyPlotFaithYield .. "")
								DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: iNearbyPlotFaithNatureYield = " .. iNearbyPlotFaithNatureYield .. "")
								DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: iNearbyPlotFaithImprovementYield = " .. iNearbyPlotFaithImprovementYield .. "")
								if iNearbyPlotFaithYield == iNearbyPlotFaithNatureYield + iNearbyPlotFaithImprovementYield then
									Game.SetPlotExtraYield(nearbyPlot:GetX(), nearbyPlot:GetY(), yieldFaithID, -iNumGreatWorks)
									DMS_ZYPrint("DMS_ZY_MonolithicChurches_ExtraYields_New: removed extra faith yield from plot (" .. nearbyPlot:GetX() .. "," .. nearbyPlot:GetY() .. ")")
								end
							end
						end
					end
				else
				-- reduce yields of monolithic churches accordingly
				end
			end
		end
	end
end

if isEthiopiaZaraYaqobCivActive then
--	GameEvents.PlayerDoTurn.Add(DMS_ZY_MonolithicChurches_ExtraYields)
	GameEvents.PlayerDoTurn.Add(DMS_ZY_MonolithicChurches_ExtraYields_New)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_ZY_OnReligiousPressureFromWriters
----------------------------------------------------------------------------------------------------------------------------
local bWritersReligiousPressure = false

function DMS_ZY_OnReligiousPressureFromWriters(iPlayer, eGreatPersonType, eGreatPersonTypeCP)
	if eGreatPersonTypeCP then eGreatPersonType = eGreatPersonTypeCP end
	local pPlayer = Players[iPlayer]
	if eGreatPersonType == unitWriterID then
		if HasTrait(pPlayer, traitSeedOfJacobID) then
			bWritersReligiousPressure = true
			DMS_ZYPrint("DMS_ZY_OnReligiousPressureFromWriters: bWritersReligiousPressure = true..")
		end
	end
end

if isEthiopiaZaraYaqobCivActive then
	GameEvents.GreatPersonExpended.Add(DMS_ZY_OnReligiousPressureFromWriters)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_ZY_ReligiousPressureFromWriters
----------------------------------------------------------------------------------------------------------------------------
function DMS_ZY_ReligiousPressureFromWriters(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)
	if bWritersReligiousPressure == true then
		local pPlot = Map.GetPlot(iX, iY)
		if pPlot then
			DMS_ZYPrint("DMS_ZY_ReligiousPressureFromWriters: bWritersReligiousPressure = true, plot (" .. iX .. "," .. iY .. ")..")
			for pNearbyPlot in PlotAreaSweepIterator(pPlot, 4, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				if pNearbyPlot and pNearbyPlot:IsCity() then
					local pCity = pNearbyPlot:GetPlotCity()
					if pCity and pCity:GetOwner() == iPlayer then
						DMS_ZYPrint("DMS_ZY_ReligiousPressureFromWriters: found city of " .. pCity:GetName() .. " at plot (" .. pNearbyPlot:GetX() .. "," .. pNearbyPlot:GetY() .. ")..")
						local iNumPressureBuildings = pCity:GetNumRealBuilding(buildingReligiousPressureWriterID)
						pCity:SetNumRealBuilding(buildingReligiousPressureWriterID, iNumPressureBuildings + 1)

						if Players[iPlayer]:IsHuman() then
							Events.GameplayAlertMessage("Religious Pressure increased by [COLOR_POSITIVE_TEXT]+" .. 5 .. " [ENDCOLOR] in " .. pCity:GetName() .. "!");
						end

						DMS_ZYPrint("DMS_ZY_ReligiousPressureFromWriters: added religious pressure dummy building to city of " .. pCity:GetName() .. "..")
					end
				end
			end
		end
		
		bWritersReligiousPressure = false
		DMS_ZYPrint("DMS_ZY_ReligiousPressureFromWriters: bWritersReligiousPressure = false..")
	end
end

if isEthiopiaZaraYaqobCivActive then
	GameEvents.UnitPrekill.Add(DMS_ZY_ReligiousPressureFromWriters)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_ZY_CityDefenseFromTerrainFaith
----------------------------------------------------------------------------------------------------------------------------
function DMS_ZY_CityDefenseFromTerrainFaith(iPlayer)
    local pPlayer = Players[iPlayer]
    if HasTrait(pPlayer, traitSeedOfJacobID) then
		DMS_ZYPrint("DMS_ZY_CityDefenseFromTerrainFaith: iterating cities..")
        for pCity in pPlayer:Cities() do
            if pCity then
				DMS_ZYPrint("DMS_ZY_CityDefenseFromTerrainFaith: processessing for city of " .. pCity:GetName() .. "..")
                local iFaithFromTerrainAndImprovements = math.ceil(pCity:GetFaithPerTurn() - (pCity:GetFaithPerTurnFromBuildings() + pCity:GetFaithPerTurnFromPolicies() + pCity:GetFaithPerTurnFromReligion() + pCity:GetFaithPerTurnFromTraits()))
				DMS_ZYPrint("DMS_ZY_CityDefenseFromTerrainFaith: iFaithFromTerrainAndImprovements = math.ceil(pCity:GetFaithPerTurn() - (pCity:GetFaithPerTurnFromBuildings() + pCity:GetFaithPerTurnFromPolicies() + pCity:GetFaithPerTurnFromReligion() + pCity:GetFaithPerTurnFromTraits())..")
				DMS_ZYPrint("DMS_ZY_CityDefenseFromTerrainFaith: pCity:GetFaithPerTurn() = " .. pCity:GetFaithPerTurn() .. "..")
				DMS_ZYPrint("DMS_ZY_CityDefenseFromTerrainFaith: pCity:GetFaithPerTurnFromBuildings() = " .. pCity:GetFaithPerTurnFromBuildings() .. "..")
				DMS_ZYPrint("DMS_ZY_CityDefenseFromTerrainFaith: pCity:GetFaithPerTurnFromPolicies() = " .. pCity:GetFaithPerTurnFromPolicies() .. "..")
				DMS_ZYPrint("DMS_ZY_CityDefenseFromTerrainFaith: pCity:GetFaithPerTurnFromReligion() = " .. pCity:GetFaithPerTurnFromReligion() .. "..")
				DMS_ZYPrint("DMS_ZY_CityDefenseFromTerrainFaith: pCity:GetFaithPerTurnFromTraits() = " .. pCity:GetFaithPerTurnFromTraits() .. "..")
				DMS_ZYPrint("DMS_ZY_CityDefenseFromTerrainFaith: iFaithFromTerrainAndImprovements = " .. iFaithFromTerrainAndImprovements .. "..")

		if iFaithFromTerrainAndImprovements > 38 then
			pCity:SetNumRealBuilding(buildingDefenseFromFaithID, 20)
			DMS_ZYPrint("DMS_ZY_CityDefenseFromTerrainFaith: 20 buildingDefenseFromFaithID in " .. pCity:GetName() .. "..")
		else
			local iReducedFaith = math.ceil(iFaithFromTerrainAndImprovements / 2)
			-- if iFaithFromTerrainAndImprovements is within (0, 2], iReducedFaith will be 1; if within (2, 4], it'll be 2; and so on and so on
			pCity:SetNumRealBuilding(buildingDefenseFromFaithID, iReducedFaith)
			DMS_ZYPrint("DMS_ZY_CityDefenseFromTerrainFaith: " .. iReducedFaith .. " buildingDefenseFromFaithID in " .. pCity:GetName() .. "..")
		end
            end
        end
    end
end

if isEthiopiaZaraYaqobCivActive then
	GameEvents.PlayerDoTurn.Add(DMS_ZY_CityDefenseFromTerrainFaith)
end
--==========================================================================================================================
--==========================================================================================================================
