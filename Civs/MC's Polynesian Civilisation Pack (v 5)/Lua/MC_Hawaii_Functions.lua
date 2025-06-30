--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ /// Hawai'i functions \\\ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ///                     \\\ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~ UA: Kahuna Mastery - Specialists generate double their base yield. Receive Great People points    ~~~
--~~~                      from combat.                                                                 ~~~
--~~~            UU: Koa - Replaces Longswordsman. Costs more production but requires no Iron. Starts   ~~~
--~~~                      with more experience and the Amphibious promo.                               ~~~
--~~~          UB: Heiau - Replaces the Temple. Gives a random specialist when built.                   ~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\\\ ///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
local iHawaii = GameInfoTypes.CIVILIZATION_POLYNESIA

--=================================================================================================
-- Utility Functions
--=================================================================================================
-- Leugi's DummyPolicyTrait
-- DateCreated: 1/18/2014 9:41:08 AM
--------------------------------------------------------------

-- function TraitPolicyGive (iPlayer)
	-- local pPlayer = Players[iPlayer];
	-- local p = GetDummyPolicy(pPlayer);
	-- if p ~= nil then
		-- if not(pPlayer:HasPolicy(GameInfo.Policies["" .. p .. ""].ID)) then
			-- pPlayer:SetNumFreePolicies(1)
			-- pPlayer:SetNumFreePolicies(0)
			-- pPlayer:SetHasPolicy(GameInfo.Policies["" .. p .. ""].ID, true);
		-- end
	-- end
-- end


-- GameEvents.PlayerDoTurn.Add(TraitPolicyGive);
-- GameEvents.PlayerCityFounded.Add(TraitPolicyGive)


-- function GetDummyPolicy(pPlayer)
	-- if pPlayer == nil or not pPlayer:IsAlive() or 
			-- pPlayer:IsBarbarian() or pPlayer:IsMinorCiv() then
		-- return nil;
	-- end
	-- local trait = GetMajorTrait(pPlayer);
	-- return trait.DummyPolicy;
-- end


-- function GetMajorTrait(pPlayer)
	-- local leader = GameInfo.Leaders[pPlayer:GetLeaderType()];
	-- local leaderTrait = GameInfo.Leader_Traits("LeaderType ='" .. leader.Type .. "'")();
	-- return GameInfo.Traits[leaderTrait.TraitType];
-- end

-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
-------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------
-- GetRandom
-------------------------------------------------------------------------------------------------------------------------
function GetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

-------------------------------------------------------------------------------------------------------------------------
-- InitUnitFromCity
-------------------------------------------------------------------------------------------------------------------------
function InitUnitFromCity(pCity, iUnitType, iNum)
	local tUnits = {}
	pPlayer = Players[pCity:GetOwner()]
	for i = 1, iNum do
		pUnit = pPlayer:InitUnit(iUnitType, pCity:GetX(), pCity:GetY())
		if not(pUnit:JumpToNearestValidPlot()) then return tUnits end
		
		table.insert(tUnits, pUnit)
		
		pUnit:SetExperience(pCity:GetDomainFreeExperience(pUnit:GetDomainType()))
		for promotion in GameInfo.UnitPromotions() do
			iPromotion = promotion.ID
				if (pCity:GetFreePromotionCount(iPromotion) > 0 and pUnit:IsPromotionValid(iPromotion)) then
				pUnit:SetHasPromotion(iPromotion, true)
			end
		end
		
	end
	return tUnits
end

--================================================================
-- UA: Kahuna Mastery
-- Author: Sukritact
--================================================================
local tSpecialists = {
	GameInfoTypes.SPECIALIST_ARTIST,
	GameInfoTypes.SPECIALIST_ENGINEER,
	GameInfoTypes.SPECIALIST_MERCHANT,
	GameInfoTypes.SPECIALIST_MUSICIAN,
	GameInfoTypes.SPECIALIST_SCIENTIST,
	GameInfoTypes.SPECIALIST_WRITER,	
}

local iMod = 50

function GetTargetCity(pPlayer, iType)
	local pTargetCity = pPlayer:GetCapitalCity()
	if not(pTargetCity) then return end
	local iProgress = pTargetCity:GetSpecialistGreatPersonProgress(iType)
	
	iGuild = nil
	if iType == GameInfoTypes.SPECIALIST_WRITER then
		iGuild = GameInfoTypes.BUILDING_WRITERS_GUILD
	elseif iType == GameInfoTypes.SPECIALIST_ARTIST then
		iGuild = GameInfoTypes.BUILDING_ARTISTS_GUILD
	elseif iType == GameInfoTypes.SPECIALIST_MUSICIAN then
		iGuild = GameInfoTypes.BUILDING_MUSICIANS_GUILD
	end

	for pCity in pPlayer:Cities() do
		--if Guilded GP, identify city with Guild
		if iGuild then
			if pCity:IsHasBuilding(iGuild) then
				pTargetCity = pCity
			end
		-- Else find city with greatest progress
		else
			if iProgress < pCity:GetSpecialistGreatPersonProgress(iType) then
				iProgress = pCity:GetSpecialistGreatPersonProgress(iType)
				pTargetCity = pCity
			end
		end
	end
	
	return pTargetCity
end

function HawaiiUA(iPlayer, iKilled, iUnitType)
	local pPlayer = Players[iPlayer]
	if (pPlayer:GetCivilizationType() ~= iHawaii) then return end
	
	local iType = tSpecialists[GetRandom(1, #tSpecialists)]
	local pCity = GetTargetCity(pPlayer, iType)
	
	if not(pCity) then return end
	
	local iStrength = GameInfo.Units[iUnitType].Combat
	local iDelta = math.ceil(iStrength * iMod)
	
	pCity:ChangeSpecialistGreatPersonProgressTimes100(iType, iDelta)
	--print("Gained " .. iDelta/100 .. " Great " .. Locale.ConvertTextKey(GameInfo.Specialists[iType].Description) .. " Points in " .. pCity:GetName() .. " from killing a " .. Locale.ConvertTextKey(GameInfo.Units[iUnitType].Description)) 
end

if JFD_IsCivilisationActive(iHawaii) then
	GameEvents.UnitKilledInCombat.Add(HawaiiUA)
end

--================================================================
-- UA: Kahuna Mastery (culture yield specifically)
-- Author: Sukritact
--================================================================
function JFD_CultureFromSpecialists(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_POLYNESIA"] then
		for city in player:Cities() do
			local specialistCount = (city:GetSpecialistCount(GameInfoTypes["SPECIALIST_ARTIST"]) + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_MUSICIAN"]) + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_WRITER"])) * 3
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_MC_HAWAII_UA_CULTURE"], specialistCount)			
		end
	end
end

if JFD_IsCivilisationActive(GameInfoTypes["CIVILIZATION_POLYNESIA"]) then
	GameEvents.PlayerDoTurn.Add(JFD_CultureFromSpecialists)
end

--================================================================
-- UU: Koa (Extra experience)
-- Author: Leugi
--================================================================
local XPPromo = GameInfoTypes.PROMOTION_MC_KOA_XP;
local XPDone = GameInfoTypes.PROMOTION_MC_KOA_XP_CONSUMED;
local XP = 10;

function MoreXP(iPlayer, iUnit)
    local pPlayer = Players[iPlayer];
    if (pPlayer:IsEverAlive()) then
        for pUnit in pPlayer:Units() do
            if (pUnit:IsHasPromotion(XPPromo)) then
                local CurrXP = pUnit:GetExperience();
                local XPbonus = (CurrXP + XP);
                pUnit:SetExperience(XPbonus)
                pUnit:SetHasPromotion(XPDone,true);
                pUnit:SetHasPromotion(XPPromo,false);
            end
        end
    end
end

Events.SerialEventUnitCreated.Add(MoreXP)

--================================================================
-- UB: Heiau (Random specialist)
-- Author: JFD
--================================================================

function GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
 
function JFD_Heiau(playerID)
	local player = Players[playerID]
	if player:IsAlive() then
		for city in player:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_MC_HAWAIIAN_HEIAU"]) then
				if not city:IsHasBuilding(GameInfoTypes["BUILDING_MC_HEIAU_MERCHANT"]) and not city:IsHasBuilding(GameInfoTypes["BUILDING_MC_HEIAU_ENGINEER"]) and not city:IsHasBuilding(GameInfoTypes["BUILDING_MC_HEIAU_ARTIST"] and not city:IsHasBuilding(GameInfoTypes["BUILDING_MC_HEIAU_MUSICIAN"]) and not city:IsHasBuilding(GameInfoTypes["BUILDING_MC_HEIAU_WRITER"]) and not city:IsHasBuilding(GameInfoTypes["BUILDING_MC_HEIAU_SCIENTIST"]))then
					local random = GetRandom(1, 14)
					local specialistType
					if random <= 4 then specialistType = "BUILDING_MC_HEIAU_MERCHANT"
					elseif random <= 7 then specialistType = "BUILDING_MC_HEIAU_ENGINEER"
					elseif random <= 9 then specialistType = "BUILDING_MC_HEIAU_ARTIST"
					elseif random <= 11 then specialistType = "BUILDING_MC_HEIAU_MUSICIAN"
					elseif random <= 13 then specialistType = "BUILDING_MC_HEIAU_WRITER"
					elseif random <= 14 then specialistType = "BUILDING_MC_HEIAU_SCIENTIST"
					end

					city:SetNumRealBuilding(GameInfoTypes[specialistType], 1)
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_MC_HAWAIIAN_HEIAU"], 0)
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(JFD_Heiau)

function SpecificCityInfoDirty_Heiau(iPlayer, iCity, iUpdateType)

	if iUpdateType ~= CityUpdateTypes.CITY_UPDATE_TYPE_PRODUCTION then return end

	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
	if not(pPlayer:IsTurnActive()) then	return end

	local pCity = pPlayer:GetCityByID(iCity)
	if pCity:IsHasBuilding(GameInfoTypes["BUILDING_MC_HAWAIIAN_HEIAU"]) then
		if not pCity:IsHasBuilding(GameInfoTypes["BUILDING_MC_HEIAU_MERCHANT"]) and not pCity:IsHasBuilding(GameInfoTypes["BUILDING_MC_HEIAU_ENGINEER"]) and not pCity:IsHasBuilding(GameInfoTypes["BUILDING_MC_HEIAU_ARTIST"] and not pCity:IsHasBuilding(GameInfoTypes["BUILDING_MC_HEIAU_MUSICIAN"]) and not pCity:IsHasBuilding(GameInfoTypes["BUILDING_MC_HEIAU_WRITER"]) and not pCity:IsHasBuilding(GameInfoTypes["BUILDING_MC_HEIAU_SCIENTIST"]))then
			local random = GetRandom(1, 14)
			local specialistType
			if random <= 4 then specialistType = "BUILDING_MC_HEIAU_MERCHANT"
			elseif random <= 7 then specialistType = "BUILDING_MC_HEIAU_ENGINEER"
			elseif random <= 9 then specialistType = "BUILDING_MC_HEIAU_ARTIST"
			elseif random <= 11 then specialistType = "BUILDING_MC_HEIAU_MUSICIAN"
			elseif random <= 13 then specialistType = "BUILDING_MC_HEIAU_WRITER"
			elseif random <= 14 then specialistType = "BUILDING_MC_HEIAU_SCIENTIST"
			end

			pCity:SetNumRealBuilding(GameInfoTypes[specialistType], 1)
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_MC_HAWAIIAN_HEIAU"], 0)
			
		end
	end
end
Events.SpecificCityInfoDirty.Add(SpecificCityInfoDirty_Heiau)
