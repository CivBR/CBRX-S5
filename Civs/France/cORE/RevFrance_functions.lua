-- RevFrance_functions
--==========================================================================================================================
-- Includes
--==========================================================================================================================
include("IconSupport.lua")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
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
local tLinkages = {}
for row in GameInfo.US_Robespierre_HappinessDummy_Building_Linkage() do
	--tLinkages[row.DummyBuildingType] = row.NormalBuildingType
	tLinkages[GameInfoTypes[row.NormalBuildingType]] = GameInfoTypes[row.DummyBuildingType]
end
----------------------------------------------------------------------------------------------------------------------------
local tBuildingYields = {}
for row in DB.Query("SELECT * FROM Building_YieldChanges WHERE BuildingType IN (SELECT DefaultBuilding FROM BuildingClasses WHERE MaxPlayerInstances = -1 AND MaxGlobalInstances = -1 AND Type NOT LIKE 'BUILDINGCLASS_US_ROBESPIERRE_HAPPINESS_DUMMY_%')") do
	local buildingID = GameInfoTypes[row.BuildingType]
	if not tBuildingYields[buildingID] then
		tBuildingYields[buildingID] = 0
	end
	tBuildingYields[buildingID] = tBuildingYields[buildingID] + row.Yield
end
----------------------------------------------------------------------------------------------------------------------------
-- C15_US_Robespierre_GetUUCulture
----------------------------------------------------------------------------------------------------------------------------
function C15_US_Robespierre_GetUUCulture(pPlayer, pUnit)
	-- print("C15_US_Robespierre_GetUUCulture called..")
	return math.ceil((1 + pPlayer:GetTotalJONSCulturePerTurn() / 4) * pUnit:GetLevel())
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local civilizationID					= GameInfoTypes["CIVILIZATION_URDNOT_REV_FRANCE"]
local iGuillotine						= GameInfoTypes["BUILDING_URDNOT_GUILLOTINE"]
local iGuillotineSpecialDummy			= GameInfoTypes["BUILDING_US_ROBESPIERRE_HAPPINESS_DUMMY_SPECIAL"]
local pGuard							= GameInfoTypes["UNIT_URDNOT_NATIONAL_GUARD"]

print("RevFrance_functions loaded, Monsieur!")
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- C15_US_Robespierre_OnBuildingDestroy
----------------------------------------------------------------------------------------------------------------------------
function C15_US_Robespierre_OnBuildingDestroy(playerID, cityID, buildingID)
	local pPlayer = Players[playerID]
	if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationID then
		-- print("C15_US_Robespierre_OnBuildingDestroy called..")
		local pBuilding = GameInfo.Buildings[buildingID]
		local iCulture = 0
		local pCity = pPlayer:GetCityByID(cityID)
		-- print("C15_US_Robespierre_OnBuildingDestroy: city " .. pCity:GetName() .. "..")
		if tBuildingYields[buildingID] then
			iCulture = pPlayer:GetTotalJONSCulturePerTurn() * tBuildingYields[buildingID]
			-- print("C15_US_Robespierre_OnBuildingDestroy: building yields culture (" .. iCulture .. ")..")
		end
		if buildingID == iGuillotine then
			-- print("C15_US_Robespierre_OnBuildingDestroy: building is iGuillotine, culture doubled..")
			iCulture = iCulture * 2
			pCity:SetNumRealBuilding(iGuillotineSpecialDummy, 0)
		end
		pCity:SetNumRealBuilding(tLinkages[buildingID], 1)
		-- print("C15_US_Robespierre_OnBuildingDestroy: set tLinkages[buildingID] building..")
		if pCity:GetGarrisonedUnit() then
			local pUnit = pCity:GetGarrisonedUnit()
			if pUnit:GetUnitType() == pGuard then
				-- print("C15_US_Robespierre_OnBuildingDestroy: garrisoned unit is UU, grant experience..")
				pUnit:ChangeExperience(math.max(math.floor(iCulture / 10), 1, pBuilding.GoldMaintenance))
			end
		end
		if iCulture > 0 then
			pPlayer:ChangeJONSCulture(iCulture)
			-- print("C15_US_Robespierre_OnBuildingDestroy: add culture (" .. iCulture .. ")..")
			if pPlayer:IsHuman() then
				local sBuildingName = Locale.ConvertTextKey(pBuilding.Description)
				local sBody = Locale.ConvertTextKey("TXT_KEY_US_ROBESPIERRE_BUILDING_SOLD_BODY", sBuildingName, iCulture)
				-- You have sold a {1_Building} for {2_Culture} [ICON_CULTURE] Culture!
				local sHead = Locale.ConvertTextKey("TXT_KEY_US_ROBESPIERRE_BUILDING_SOLD_HEAD")
				-- Building Sold!
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", sBody, sHead)
			end
		end
	end
end
GameEvents.CitySoldBuilding.Add(C15_US_Robespierre_OnBuildingDestroy)
----------------------------------------------------------------------------------------------------------------------------
-- C15_US_Robespierre_OnBuildingConstruct
----------------------------------------------------------------------------------------------------------------------------
function C15_US_Robespierre_OnBuildingConstruct(playerID, cityID, buildingID)
	local pPlayer = Players[playerID]
	if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationID then
		-- print("C15_US_Robespierre_OnBuildingConstruct called..")
		local pCity = pPlayer:GetCityByID(cityID)
		-- print("C15_US_Robespierre_OnBuildingConstruct: city " .. pCity:GetName() .. "..")
		if buildingID == iGuillotine then
			-- print("C15_US_Robespierre_OnBuildingConstruct: building is iGuillotine..")
			local iToKill = 2
			while iToKill > 0 and pCity:GetPopulation() > 1 do
				pCity:ChangePopulation(-1)
				-- print("C15_US_Robespierre_OnBuildingConstruct: in while loop call LuaEvents.C15_US_Robespierre_CitizenExecuted..")
				LuaEvents.C15_US_Robespierre_CitizenExecuted(pPlayer, pCity)
				iToKill = iToKill - 1
				-- print("C15_US_Robespierre_OnBuildingConstruct: iToKill = " .. iToKill .. "..")
			end
			--[[repeat
				pCity:ChangePopulation(-1)
				LuaEvents.C15_US_Robespierre_CitizenExecuted(pPlayer, pCity)
				iToKill = iToKill - 1
			until iToKill == 0 or pCity:GetPopulation() == 1]]

			if pCity:IsHasBuilding(tLinkages[buildingID]) then
				pCity:SetNumRealBuilding(iGuillotineSpecialDummy, 1)
				-- print("C15_US_Robespierre_OnBuildingConstruct: set building iGuillotineSpecialDummy..")
			end
		end
		pCity:SetNumRealBuilding(tLinkages[buildingID], 0)
		-- print("C15_US_Robespierre_OnBuildingConstruct: remove building tLinkages[buildingID]..")
	end
end
GameEvents.CityConstructed.Add(C15_US_Robespierre_OnBuildingConstruct)
----------------------------------------------------------------------------------------------------------------------------
-- C15_US_Robespierre_OnPolicyAdopted
----------------------------------------------------------------------------------------------------------------------------
function C15_US_Robespierre_OnPolicyAdopted(playerID)
	local pPlayer = Players[playerID]
	if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationID then
		-- print("C15_US_Robespierre_OnPolicyAdopted called..")
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iGuillotine) and pCity:GetPopulation() > 1 then
				-- print("C15_US_Robespierre_OnPolicyAdopted city " .. pCity:GetName() .. " has pop > 1 and building iGuillotine..")
				pCity:ChangePopulation(-1)
				-- print("C15_US_Robespierre_OnPolicyAdopted kill 1 pop and call LuaEvents.C15_US_Robespierre_CitizenExecuted..")
				LuaEvents.C15_US_Robespierre_CitizenExecuted(pPlayer, pCity)
			end
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(C15_US_Robespierre_OnPolicyAdopted)
GameEvents.PlayerAdoptPolicyBranch.Add(C15_US_Robespierre_OnPolicyAdopted)
----------------------------------------------------------------------------------------------------------------------------
-- C15_US_Robespierre_UnitXPExecuted
----------------------------------------------------------------------------------------------------------------------------
function C15_US_Robespierre_UnitXPExecuted(pPlayer, pCity)
	-- print("C15_US_Robespierre_UnitXPExecuted called..")
	local pUnit = pCity:GetGarrisonedUnit()
	if pUnit then
		if pUnit:GetUnitType() == pGuard then
			-- print("C15_US_Robespierre_UnitXPExecuted: garrisoned unit is UU, grant experience..")
			pUnit:ChangeExperience(10)
		end
	end
end
LuaEvents.C15_US_Robespierre_CitizenExecuted.Add(C15_US_Robespierre_UnitXPExecuted)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_US_Robespierre_UnitPromoted
----------------------------------------------------------------------------------------------------------------------------
function DMS_US_Robespierre_UnitPromoted(playerID, unitID, promotion)
	local pPlayer = Players[playerID]
	if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationID then
		local pUnit = pPlayer:GetUnitByID(unitID)
		if pUnit and pUnit:GetUnitType() == pGuard then
			local iCulture = C15_US_Robespierre_GetUUCulture(pPlayer, pUnit)
			if iCulture > 0 then
				pPlayer:ChangeJONSCulture(iCulture)
				if pPlayer:IsHuman() then
					local iX = pUnit:GetX()
					local iY = pUnit:GetY()
					local pHexPos = ToHexFromGrid{x=iX, y=iY}
					local pWorldPos = HexToWorld(pHexPos)
	           
					Events.AddPopupTextEvent(pWorldPos, "[COLOR_POSITIVE_TEXT]+" .. iCulture .. " [ICON_CULTURE] Culture[ENDCOLOR]")
				end
			end
		end
	end
end

GameEvents.UnitPromoted.Add(DMS_US_Robespierre_UnitPromoted)
----------------------------------------------------------------------------------------------------------------------------
-- C15_US_Robespierre_ExpendUnit
----------------------------------------------------------------------------------------------------------------------------
-- TomButton
--local pSelUnit

--function C15_US_Robespierre_ExpendUnit(pPlayer, pUnit)
--	print(pPlayer, pUnit)
--	--if not pPlayer then pPlayer = Players[Game.GetActivePlayer()] end
--	if type(pPlayer) == "number" then pPlayer = Players[Game.GetActivePlayer()] end
--	--if not pUnit then pUnit = pSelUnit end
--	if type(pUnit) == "number" then pUnit = pSelUnit end
--	print(pPlayer, pUnit)
--	local iCulture = C15_US_Robespierre_GetUUCulture(pPlayer, pUnit)
--	if iCulture > 0 then
--		pPlayer:ChangeJONSCulture(iCulture)
--		pUnit:Kill(-1)
--		if pPlayer:IsHuman() then
--			local iX = pUnit:GetX()
--			local iY = pUnit:GetY()
--			local pHexPos = ToHexFromGrid{x=iX, y=iY}
--			local pWorldPos = HexToWorld(pHexPos)
--           
--			Events.AddPopupTextEvent(pWorldPos, "[COLOR_CULTURE_STORED]+" .. iCulture .. " [ICON_CULTURE][ENDCOLOR]")
--		end
--	end
--end

--IconHookup(2, 45, "URDNOT_REV_FRANCE_ATLAS", Controls.TomButtonImage )
--Controls.TomButtonBackground:SetHide(true)
----------------------------------------------------------------------------------------------------------------------------
-- C15_US_Robespierre_TomButton_UnitExpend
----------------------------------------------------------------------------------------------------------------------------
--function C15_US_Robespierre_TomButton_UnitExpend(playerID, unitID, x, y, a5, bool)
--	if bool then
--		local pPlayer = Players[playerID]
--		local pUnit = pPlayer:GetUnitByID(unitID);
--		if pUnit:GetUnitType() == pGuard then
--			Controls.TomButtonBackground:SetHide(false)
--			pSelUnit = pUnit;
--			local iCulture = C15_US_Robespierre_GetUUCulture(pPlayer, pUnit)
--			Controls.TomButton:SetDisabled(iCulture == 0)
--			Controls.TomButton:RegisterCallback(Mouse.eLClick, C15_US_Robespierre_ExpendUnit)
--			local sTT = Locale.ConvertTextKey("TXT_KEY_US_ROBESPIERRE_UU_EXPEND", iCulture)
--			Controls.TomButton:LocalizeAndSetToolTip("" .. sTT .. "")
--		else
--			Controls.TomButton:SetDisabled(true)
--			Controls.TomButtonBackground:SetHide(true)
--		end
--	else
--		Controls.TomButtonBackground:SetHide(true)
--		pSelUnit = nil;
--	end
--end
--Events.UnitSelectionChanged.Add(C15_US_Robespierre_TomButton_UnitExpend)
----------------------------------------------------------------------------------------------------------------------------
-- C15_US_Robespierre_ExpendUnit_AI
----------------------------------------------------------------------------------------------------------------------------
--function C15_US_Robespierre_ExpendUnit_AI(playerID)
--	local pPlayer = Players[playerID]
--	if pPlayer and (not pPlayer:IsHuman()) and pPlayer:GetCivilizationType() == civilizationID then
--		for pUnit in pPlayer:Units() do
--			if pUnit:GetUnitType() == pGuard and pUnit:GetLevel() > 2 then
--				C15_US_Robespierre_ExpendUnit(pPlayer, pUnit)
--			end
--		end
--	end
--end
--GameEvents.PlayerDoTurn.Add(C15_US_Robespierre_ExpendUnit_AI)
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================


