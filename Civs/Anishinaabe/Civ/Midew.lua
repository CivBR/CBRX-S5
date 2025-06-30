include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "CLMidewUU";
include( "IconSupport");
include("InstanceManager");
include("FLuaVector.lua");

--==========================================================================================================================
-- Initial Processes
--==========================================================================================================================

local vSpeed = {}
vSpeed[0] = 3
vSpeed[1] = 1.5
vSpeed[2] = 1
vSpeed[3] = 0.67
vSpeed[4] = 0.4 -- Assumes using SuperQuick mod

local iMidew = GameInfoTypes.UNIT_CLMIDEW
local iMaxCivID = (GameDefines.MAX_MAJOR_CIVS - 1)
local tUnitsCreated = {}
local bIsPopupOpen = false
local tMidewInstances = {}


local function tprint (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent+1)
    elseif type(v) == 'boolean' then
      print(formatting .. tostring(v))      
    else
      print(formatting .. v)
    end
  end
end

-- AnishMidewCode
-- Author: Neirai, working off of code supplied by Sukritact and JFD
--==========================================================================================================================
--global
g_Tabs = {
	["MidewTargets"] = {
		Panel = Controls.MidewTargets,
		SelectHighlight = Controls.CivilizationIconHighlight,
	},
}

local g_AtWarEnemies = InstanceManager:new( "MidewTargets", "Base", Controls.MidewTargetsStack);

function MidewRefresh(pPopupUnit, iPlotOwner)
	print("MidewRefresh() was triggered")
	g_AtWarEnemies:ResetInstances()
	local midewTargets = {}
	local activePlayer = Players[Game.GetActivePlayer()];
	local activeTeam = Teams[activePlayer:GetTeam()]
	local pPlotOwner = Players[iPlotOwner]
	print(pPlotOwner)
	for k, pPlayer in pairs(Players) do	
		if pPlayer:IsEverAlive() then
			print(pPlayer:GetName())
		end
		if pPlayer:IsAlive() and activeTeam:IsAtWar(pPlayer:GetTeam()) and not pPlayer:IsBarbarian() then
			--if Teams[pPlotOwner:GetTeam()]:IsHasMet(pPlayer:GetTeam()) then
			print("We got this far")
			local civName = pPlayer:GetCivilizationShortDescription()
			print(civName)
			local civID = k
			print(civID)
			local color = pPlayer:GetPlayerColors()
			if (color == nil) then
				color = GameInfo.Colors.COLOR_WHITE.ID
			end
			print(civName.." is added to the list")
			table.insert(midewTargets, {
				Civilization = Locale.Lookup(civName),
				CivilizationID = civID,
				CivIconIndex = GameInfo.Civilizations[civID].PortraitIndex,
				CivIconAtlas = GameInfo.Civilizations[civID].IconAtlas,
				Color = color,
			})
		end
	end
	
	if(#midewTargets > 0) then
		tprint(midewTargets)
		Controls.MidewScrollPanel:SetHide(false);
		Controls.MidewAtPeace:SetHide(true);
				
	--	table.sort(midewTargets, g_StateReligionsSortFunction);	
	
		for i,v in ipairs(midewTargets) do
			local entry = g_AtWarEnemies:GetInstance();
			entry.TargetCivilization:SetText(v.Civilization);
			entry.TargetCivilization:SetColor(v.Color, 0);
			CivIconHookup(v.CivilizationID, 45, entry.CivilizationIcon, entry.CivilizationIconBG, entry.CivilizationIconShadow, true, true );
			entry.Enemy:RegisterCallback(Mouse.eLClick, function()
				local pTarget = Players[v.CivilizationID]
				print(pTarget)
				if pTarget:IsAlive() then
					print("pTarget is Alive")
					if pPlotOwner:IsAlive() then
						print("pPlotOwner is Alive")
						UIManager:DequeuePopup(ContextPtr)
						bIsPopupOpen = false
						if Teams[pPlotOwner:GetTeam()]:CanDeclareWar(pTarget:GetTeam()) then
							pPopupUnit:SetDamage(999)
							print("I killed the unit.")
							LuaEvents.GreatPersonExpended(activePlayer:GetID(), iMidew)
							print("A Great Person was Expended")
							Teams[pPlotOwner:GetTeam()]:DeclareWar(pTarget:GetTeam())
							print("A Declaration of War!")
						else
							print("Error! Trying Change WarPeace")
							if Teams[pPlotOwner:GetTeam()]:CanChangeWarPeace(pTarget:GetTeam()) then
								pPopupUnit:SetDamage(999)
								print("I killed the unit.")
								LuaEvents.GreatPersonExpended(activePlayer:GetID(), iMidew)
								print("A Great Person was Expended")
								Teams[pPlotOwner:GetTeam()]:DeclareWar(pTarget:GetTeam())
								print("A Declaration of War!")
							else
								print("Error! ")
							end
						end
						print("Our work here is done.")
					end
				end
			end)
		end
	end
end
g_Tabs["MidewTargets"].RefreshContent = MidewRefresh;

--Triggers if you load a game that's in progress
for iPlayer = 0, iMaxCivID do
	local pPlayer = Players[iPlayer]
	if pPlayer:IsEverAlive() then
		for pUnit in pPlayer:Units() do
			local iUnitType = pUnit:GetUnitType()
			if iUnitType == iMidew then
				local iUnit = pUnit:GetID()
				tUnitsCreated["P"..iPlayer.."U"..iUnit ] = 1
			end
		end
		if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLANISHINAABE then
			--MidewRefresh()
		end
	end
end
--=======================================================================================================================
-- Open/Close Functions
--=======================================================================================================================
ButtonPopupTypes.BUTTONPOPUP_KHMERUA = "BUTTONPOPUP_CLMIDEW"
g_PopupInfo = {["Type"] = ButtonPopupTypes.BUTTONPOPUP_CLMIDEW}

tprint(g_PopupInfo, 1)

function CLMidewShowHideHandler(bIsHide, bInitState)
    if(not bInitState) then
       if(not bIsHide) then
        	UI.incTurnTimerSemaphore()
        	Events.SerialEventGameMessagePopupShown(g_PopupInfo)
        else
            UI.decTurnTimerSemaphore()
            if(g_PopupInfo ~= nil) then
				Events.SerialEventGameMessagePopupProcessed.CallImmediate(g_PopupInfo.Type, 0)
			end
        end
    end
end
ContextPtr:SetShowHideHandler(CLMidewShowHideHandler)
--==========================================================================================================================
-- Main Code
--==========================================================================================================================

function AIDetermineMidewTarget(pPlayer, pPlotOwner)
	local pTarget = nil
	local iReligionSize = 0
	local iScore = 0
	for k, pOther in pairs(Players) do
		if not pOther == pPlayer then -- Don't attack yourself then
			if not pOther == pPlotOwner then -- that too
				local pTeam = Teams[pOther:GetTeam()]
				if not pTeam:IsBarbarian() then -- can't be barbarians
					if (not Teams[pPlotOwner:GetTeam()]:IsAtWar(pTeam)) then -- can't be a Team we're already at War with.
						if Teams[pPlayer:GetTeam()]:IsAtWar(pTeam) then -- we only care about the ones we're at war with!
							local iRel = pOther:GetReligionCreatedByPlayer()
							local iCities = 0
							if iRel ~= nil and iRel > ReligionTypes.RELIGION_PANTHEON then
								iCities = Game.GetNumCitiesFollowing(iRel)
							end
							if iCities > iReligionSize then --Traditionalist AI Pontiac attacks the enemy with the most pronounced religion
								iReligionSize = iCities
								iScore = pOther:GetScore()
								pTarget = pOther
							elseif iCities == iReligionSize then
								if pOther:GetScore() > iScore then -- Jealous AI Pontiac attacks the enemy with the highest score
									iScore = pOther:GetScore()
									pTarget = pOther
								end
							end
						end
					end
				end
			end
		end
	end
	return pTarget
end

function AnishMidewCode(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	--if Popup open then return
	if bIsPopupOpen then
		return
	end
	--prevent trigger for just-killed units
	if (iX < 0) and (iY < 0) then
		return
	end
	--prevent trigger for just-created units	
	if tUnitsCreated["P"..iPlayer.."U"..iUnit ] == nil and pPlayer:IsHuman() then
		tUnitsCreated["P"..iPlayer.."U"..iUnit ] = 1
		return
	end
	
	--check if Midew
	local pUnit = pPlayer:GetUnitByID(iUnit)
	local iUnitType = pUnit:GetUnitType()
	if iUnitType ~= iMidew then
		return
	end
	print("Unit is a Midew")
	--check if I'm at peace with everyone
	if Teams[pPlayer:GetTeam()]:GetAtWarCount() == 0 then
		print("The world is a peaceful place")
		return
	end
	print("We have enemies")
	--check if trigger enabled
	local bTrigger = load(pPlayer, iUnit)
	if bTrigger == nil then
		bTrigger = true
	end
	local pPlot = Map.GetPlot(iX, iY)
	if pPlot == nil then
		return
	end

	-- Check for CityState and do things.
	local iPlotOwner = pPlot:GetOwner()
	local pPlotOwner = Players[iPlotOwner]
	print(pPlotOwner)
	local bEstablished = nil
	if pPlotOwner:IsMinorCiv() then
		--populating this will take and need a bit more work than what is here right now.
		if Teams[pPlotOwner:GetTeam()]:IsAtWar(Teams[pPlayer:GetTeam()]) then
			print("Hostile City-State!")
			return
		end
		print("City-State is a sucker")
		if (bTrigger) then
			--Disable trigger for next time
			save(pPlayer, iUnit, false)
			--Trigger
			if pPlayer:IsHuman() then
				bIsPopupOpen = true
				print("Triggering MidewPopup!")
				MidewPopup(iPlayer, iPlotOwner, iUnit)
			else
				local iTarg = AIDetermineMidewTarget(pPlayer, pPlotOwner)
				if iTarg ~= nil then
					pUnit:SetDamage(999)
					LuaEvents.GreatPersonExpended(iPlayer, iMidew)
					Teams[pPlotOwner:GetTeam()]:DeclareWar(Teams[iTarg])
				else
					bTrigger = true
					save(pPlayer, iUnit, true)
				end
			end
		end
	end
end

function UnitDestroyed(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit == nil then
		save(pPlayer, iUnit, nil)
		tUnitsCreated["P"..iPlayer.."U"..iUnit ] = nil
	end
end

--==========================================================================================================================
-- Popup Behaviour
--==========================================================================================================================

local pPopupPlayer = nil
local iPopupOwner = nil
local pPopupUnit = nil
local iPopupDelta = nil


---

--==========================================================================================================================
-- Popup Behaviour
--==========================================================================================================================


function MidewPopup(iPlayer, iPlotOwner, iUnit)
	local pPlayer = Players[iPlayer]
	local pPlotOwner = Players[iPlotOwner]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	pPopupPlayer = pPlayer
	iPopupOwner = iPlotOwner
	pPopupUnit = pUnit

	MidewRefresh(pUnit, iPlotOwner)
	Controls.MidewAtPeace:LocalizeAndSetText("TXT_KEY_CLMIDEW_DIALOG", pPlotOwner:GetName())
	CivIconHookup(iPlayer, 64, Controls.CivilizationIcon, Controls.CivilizationIconBG, Controls.CivilizationIconShadow, false, true )
	UIManager:QueuePopup(ContextPtr, PopupPriority.WonderPopup)
	bIsPopupOpen = true
end

--Controls.MidewTargets.Enemy:RegisterCallback(Mouse.eLClick, function()
--	pPopupUnit:SetDamage(999)
--	LuaEvents.GreatPersonExpended(pPopupPlayer:GetID(), iMidew)
--	Teams[pPlotOwner:GetTeam()]:DeclareWar(Teams[iTarg])
--	UIManager:DequeuePopup(ContextPtr)
--	bIsPopupOpen = false
--end)
	
Controls.No:RegisterCallback(Mouse.eLClick, function()
	UIManager:DequeuePopup(ContextPtr)
	bIsPopupOpen = false
end)
	
Controls.Never:RegisterCallback(Mouse.eLClick, function()
	save(pPopupPlayer, "C_" .. iPopupOwner, true)
	UIManager:DequeuePopup(ContextPtr)
	bIsPopupOpen = false
end)






--=======================================================================================================================
-- Initialise
--=======================================================================================================================
UIManager:QueuePopup(ContextPtr, PopupPriority.WonderPopup)
UIManager:DequeuePopup(ContextPtr)
--=======================================================================================================================
--=======================================================================================================================

 ------------------------------------------------------------------------------------------------------------------------
-- JFD_GetStateReligion
------------------------------------------------------------------------------------------------------------------------
function JFD_GetStateReligion(playerID)
	local JFD_StateReligion = "JFD_StateReligionOf" .. playerID
	return GetPersistentProperty(JFD_StateReligion)
end


function GetReligion(pPlayer)		--Thanks to Sukritact for this function
	local iMajorityReligion = nil
	if JFD_GetStateReligion then
		local iReligion = JFD_GetStateReligion(pPlayer:GetID())
		if iReligion and (iReligion ~= -1) then
			return iReligion 
		end
	end
    local iReligion = pPlayer:GetReligionCreatedByPlayer()
    if iReligion and (iReligion ~= -1) then
		return iReligion
	end
	for row in GameInfo.Religions() do
		local iReligion = row.ID
		if pPlayer:HasReligionInMostCities(iReligion) then
			iMajorityReligion = iReligion
			break
		end
	end
	return iMajorityReligion
end

function MidewIntoleranceEarn(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLANISHINAABE then
		local iOrtho = GetReligion(pPlayer)
		if not (iOrtho) then return end
		local tReligions = {-1, 0, iOrtho}
		local iHeathens = 0
		for pCity in pPlayer:Cities() do
			local iNonHeathens = 0
			for iKey, iReligion in pairs(tReligions) do
				iNonHeathens = iNonHeathens + pCity:GetNumFollowers(iReligion)
			end
			iHeathens = iHeathens + (pCity:GetPopulation() - iNonHeathens)
		end
		local iMPoints = load(pPlayer, "MidewPoints")
		if iMPoints == nil then
			iMPoints = 0
		end
		iMPoints = iMPoints + iHeathens
		save (pPlayer, "MidewPoints", iMPoints)
		local iMidewsBorn = load(pPlayer, "MidewCount")
		if iMidewsBorn == nil then
			iMidewsBorn = 0
		end
		local iMidewTH = ((100 + (200 * iMidewsBorn)) * vSpeed[Game.GetGameSpeedType()])
		print("Current level of Intolerance for "..pPlayer:GetName().." is "..iMPoints..". "..iMidewTH.." points are needed for the next Midew.")
		if iMPoints > iMidewTH then
			pCap = pPlayer:GetCapitalCity()
			pPlayer:InitUnit(GameInfoTypes.UNIT_CLMIDEW, pCap:GetX(), pCap:GetY(), UNITAI_INQUISITOR)
			save(pPlayer, "MidewCount", iMidewsBorn + 1)
			save(pPlayer, "MidewPoints", iMPoints - iMidewTH)
		end
	end
end

for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
	local pPlayer = Players[i]
	if pPlayer:IsEverAlive() and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLANISHINAABE then
		print("Beothuk Mythic Emblem lua loaded!")
        GameEvents.PlayerDoTurn.Add(MidewIntoleranceEarn)
		Events.SerialEventUnitDestroyed.Add(UnitDestroyed)
		GameEvents.UnitSetXY.Add(AnishMidewCode)
        break
    end
end