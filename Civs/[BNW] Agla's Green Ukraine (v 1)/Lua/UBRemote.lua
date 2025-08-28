-- BuildingRemoteGreatPeoplePoints
-- Author: Sukritact
--=======================================================================================================================
-- Prevent Duplicates
--=======================================================================================================================
if MapModData.BuildingRemoteGreatPeoplePoints then return end
MapModData.BuildingRemoteGreatPeoplePoints = true
Events.SequenceGameInitComplete.Add(function() MapModData.BuildingRemoteGreatPeoplePoints = nil end)
--=======================================================================================================================



--=======================================================================================================================
-- Main Code
--=======================================================================================================================
local specWriter, specArtist, specMusician = GameInfo.Specialists.SPECIALIST_WRITER.ID, GameInfo.Specialists.SPECIALIST_ARTIST.ID, GameInfo.Specialists.SPECIALIST_MUSICIAN.ID
local specScientist, specMerchant, specEngineer = GameInfo.Specialists.SPECIALIST_SCIENTIST.ID, GameInfo.Specialists.SPECIALIST_MERCHANT.ID, GameInfo.Specialists.SPECIALIST_ENGINEER.ID

local tSpecGuilds = {}
tSpecGuilds[specWriter] = GameInfo.Buildings.BUILDING_WRITERS_GUILD.ID
tSpecGuilds[specArtist] = GameInfo.Buildings.BUILDING_ARTISTS_GUILD.ID
tSpecGuilds[specMusician] = GameInfo.Buildings.BUILDING_MUSICIANS_GUILD.ID

local tRemoteGreatPeoplePoints = {}
for row in DB.Query("SELECT * FROM Building_RemoteGreatPeoplePoints") do
	local iBuilding = GameInfoTypes[row.BuildingType]
	tRemoteGreatPeoplePoints[iBuilding] = {}
	local iSpec = GameInfoTypes[row.SpecialistType]
	tRemoteGreatPeoplePoints[iBuilding]["Spec"] = iSpec
	tRemoteGreatPeoplePoints[iBuilding]["Rate"] = row.RateChange
	tRemoteGreatPeoplePoints[iBuilding]["Modified"] = row.Modified
	tRemoteGreatPeoplePoints[iBuilding]["Capital"] = row.Capital
end

function BuildingRemoteGreatPeoplePoints(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsBarbarian() or pPlayer:IsMinorCiv() then
		return
	end
	
	for iBuilding, tSubtable in pairs(tRemoteGreatPeoplePoints) do
	
		local pTargetCity = pPlayer:GetCapitalCity()
		if not(pTargetCity) then return end
		-- Retrieve Info from tables
		--local iBuilding = GameInfo.Buildings[row.BuildingType].ID
		local iType = tSubtable["Spec"]
		local iPoints = tSubtable["Rate"]
		local iModified = tSubtable["Modified"]
		local iCapital = tSubtable["Capital"]
		
		local iProgress = pTargetCity:GetSpecialistGreatPersonProgress(iType)
		local iNumCities = 0
		local iMod = 100
		
		local iGuild = tSpecGuilds[iType]

		for pCity in pPlayer:Cities() do
			--if Guilded GP, identify city with Guild
			if iGuild then
				if pCity:IsHasBuilding(iGuild) then
					pTargetCity = pCity
				end
			-- Else find city with greatest progress
			elseif (bCapital == 0) then
				if iProgress < pCity:GetSpecialistGreatPersonProgress(iType) then
					iProgress = pCity:GetSpecialistGreatPersonProgress(iType)
					pTargetCity = pCity
				end
			end
			
			--identify number of cities with building
			if pCity:IsHasBuilding(iBuilding) then
				iNumCities = iNumCities + 1
			end
		end
		
		if (pTargetCity ~= nil) and (iNumCities > 0) then
			if (iModified == 1) then
				iMod = iMod + (GetGreatPersonModifier(pPlayer, pTargetCity, iType))
			end
			iDelta = (iPoints * iNumCities * iMod)
			pTargetCity:ChangeSpecialistGreatPersonProgressTimes100(iType, iDelta)
		end
		
	end
end

GameEvents.PlayerDoTurn.Add(BuildingRemoteGreatPeoplePoints)

--=======================================================================================================================        
-- The following is adapted from the CityView.lua
--=======================================================================================================================    
function GetGreatPersonModifier(pPlayer, pTargetCity, iType)
	-- Generic GP mods
	local iPlayerMod = pPlayer:GetGreatPeopleRateModifier()
	local iPolicyMod = pPlayer:GetPolicyGreatPeopleRateModifier()
	local iWorldCongressMod = 0
	local pWorldCongress = nil
	if (Game.GetNumActiveLeagues() > 0) then
		pWorldCongress = Game.GetActiveLeague()
	end
	local iCityMod = pTargetCity:GetGreatPeopleRateModifier()
	local iGoldenAgeMod = 0
	local bGoldenAge = (pPlayer:GetGoldenAgeTurns() > 0)
	
	-- GP mods by type	
	if (iType == specWriter) then
		--print("is " .. GameInfo.Specialists[iType].Description)
		iPlayerMod = iPlayerMod + pPlayer:GetGreatWriterRateModifier()
		iPolicyMod = iPolicyMod + pPlayer:GetPolicyGreatWriterRateModifier()
		if (pWorldCongress ~= nil and pWorldCongress:GetArtsyGreatPersonRateModifier() ~= 0) then
		iWorldCongressMod = iWorldCongressMod + pWorldCongress:GetArtsyGreatPersonRateModifier()
		end
		if (bGoldenAge and pPlayer:GetGoldenAgeGreatWriterRateModifier() > 0) then
		iGoldenAgeMod = iGoldenAgeMod + pPlayer:GetGoldenAgeGreatWriterRateModifier()
		end
	elseif (iType == specArtist) then
		--print("is " .. GameInfo.Specialists[iType].Description)
		iPlayerMod = iPlayerMod + pPlayer:GetGreatArtistRateModifier()
		iPolicyMod = iPolicyMod + pPlayer:GetPolicyGreatArtistRateModifier()
		if (pWorldCongress ~= nil and pWorldCongress:GetArtsyGreatPersonRateModifier() ~= 0) then
		iWorldCongressMod = iWorldCongressMod + pWorldCongress:GetArtsyGreatPersonRateModifier()
		end
		if (bGoldenAge and pPlayer:GetGoldenAgeGreatArtistRateModifier() > 0) then
		iGoldenAgeMod = iGoldenAgeMod + pPlayer:GetGoldenAgeGreatArtistRateModifier()
		end
	elseif (iType == specMusician) then
		--print("is " .. GameInfo.Specialists[iType].Description)
		iPlayerMod = iPlayerMod + pPlayer:GetGreatMusicianRateModifier()
		iPolicyMod = iPolicyMod + pPlayer:GetPolicyGreatMusicianRateModifier()
		if (pWorldCongress ~= nil and pWorldCongress:GetArtsyGreatPersonRateModifier() ~= 0) then
		iWorldCongressMod = iWorldCongressMod + pWorldCongress:GetArtsyGreatPersonRateModifier()
		end
		if (bGoldenAge and pPlayer:GetGoldenAgeGreatMusicianRateModifier() > 0) then
		iGoldenAgeMod = iGoldenAgeMod + pPlayer:GetGoldenAgeGreatMusicianRateModifier()
		end
	elseif (iType == specScientist) then
		--print("is " .. GameInfo.Specialists[iType].Description)
		iPlayerMod = iPlayerMod + pPlayer:GetGreatScientistRateModifier()
		iPolicyMod = iPolicyMod + pPlayer:GetPolicyGreatScientistRateModifier()
		if (pWorldCongress ~= nil and pWorldCongress:GetScienceyGreatPersonRateModifier() ~= 0) then
		iWorldCongressMod = iWorldCongressMod + pWorldCongress:GetScienceyGreatPersonRateModifier()
		end
	elseif (iType == specMerchant) then
		--print("is " .. GameInfo.Specialists[iType].Description)
		iPlayerMod = iPlayerMod + pPlayer:GetGreatMerchantRateModifier()
		iPolicyMod = iPolicyMod + pPlayer:GetPolicyGreatMerchantRateModifier()
		if (pWorldCongress ~= nil and pWorldCongress:GetScienceyGreatPersonRateModifier() ~= 0) then
		iWorldCongressMod = iWorldCongressMod + pWorldCongress:GetScienceyGreatPersonRateModifier()
		end
	elseif (iType == specEngineer) then
		--print("is " .. GameInfo.Specialists[iType].Description)
		iPlayerMod = iPlayerMod + pPlayer:GetGreatEngineerRateModifier()
		iPolicyMod = iPolicyMod + pPlayer:GetPolicyGreatEngineerRateModifier()
		if (pWorldCongress ~= nil and pWorldCongress:GetScienceyGreatPersonRateModifier() ~= 0) then
		iWorldCongressMod = iWorldCongressMod + pWorldCongress:GetScienceyGreatPersonRateModifier()
		end
	end
			
	-- Player mod actually includes policy mod and World Congress mod, so separate them for tooltip
	iPlayerMod = iPlayerMod - iPolicyMod - iWorldCongressMod		
	--print(iPlayerMod, iPolicyMod, iWorldCongressMod, iCityMod, iGoldenAgeMod)
	local iMod = iPlayerMod + iPolicyMod + iWorldCongressMod + iCityMod + iGoldenAgeMod
	--print(iMod)
	return iMod
end
--=======================================================================================================================
--=======================================================================================================================
