-- Ghost Hunters by Neirai the Forgiven. Heavy use of Sukritact's Burmese functions.
-- Save functions brought to you by Sukritact's Save Utils.

include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "CLAnishinaabeUA";

local vSpeed = {}
vSpeed[0] = 3
vSpeed[1] = 1.5
vSpeed[2] = 1
vSpeed[3] = 0.67
vSpeed[4] = 0.4 -- Assumes using SuperQuick mod

--is it call to war?
--begin call to war

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

function CallToWarSpyEffect(pPlayer, iTeam)
	local tSpies = pPlayer:GetEspionageSpies()
	for k, spy in pairs(tSpies) do
		-- print("Testing")
		tprint(tSpies, 1)
		for i, pEnemy in pairs(Players) do
			if pEnemy:GetTeam() == iTeam then
				for pCity in pEnemy:Cities() do
					-- print("Testing "..pCity:GetName())
					if spy.CityX == pCity:GetX() then --Awkward method for identifying spy location
						if spy.CityY == pCity:GetY() then
							if load(pPlayer, pCity:GetName()) == nil then
								local pTitle = ("Defenses Neutralized")
								local pDesc = ("Our spies have compromised all defenses in "..pCity:GetName()..". As long as a Call to War! lasts, "..pCity:GetName().." will be exposed.")
								pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, pDesc, pTitle)
							end
							save(pPlayer, pCity:GetName(), true)
							local pNoDefense = true
							for pBldg in GameInfo.Buildings() do
								if pBldg.Defense > 100 then
									if pCity:GetNumBuilding(pBldg) > 0 then
										-- print("Taking "..pBldg.Description.." offline")
										local saveName = (pCity:GetName()..pBldg.Description)
										save(pPlayer, saveName, true)
										pCity:SetNumRealBuilding(pBldg, 0)
										pNoDefense = false
									end
								end
							end
							if pNoDefense == true then
								pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CLANISHINAABESPY, 0)
								-- print("Strength Value is "..pCity:GetStrengthValue())
								local dampenSpirits = math.floor(pCity:GetStrengthValue() / 200)
								pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CLANISHINAABESPY, dampenSpirits)
							else
								pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CLANISHINAABESPY, 0)
							end
						end
					end
				end
			end
		end
	end	
end

function EndCallToWarSpyEffect(pPlayer, iTeam)
	for i, pEnemy in pairs(Players) do
		if pEnemy:GetTeam() == iTeam then
			for pCity in pEnemy:Cities() do
				if pCity:GetNumBuilding(GameInfoTypes.BUILDING_CLANISHINAABESPY) > 0 then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CLANISHINAABESPY, 0)
				else
					save(pPlayer, pCity:GetName(), nil)
					for pBldg in GameInfo.Buildings() do
						if pBldg.Defense > 100 then
							local loadName = (pCity:GetName()..pBldg.Description)
							if load(pPlayer, loadName) == true then
								-- print("Reinstating "..pBldg.Description.." in "..pCity:GetName())
								save(pPlayer, loadName, nil)
								pCity:SetNumRealBuilding(pBldg, 1)
							end
						end
					end
				end
			end
		end
	end
	local pTitle = ("Call to War Ended")
	local pDesc = ("Our spies must go back into hiding if they are not going to be compromised. Enemy defenses will return to normal.")
	local pCity = pPlayer:GetCapitalCity()
	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, pDesc, pTitle)
end

function CallToWarIterate(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLANISHINAABE then
		for i, pEnemy in pairs(Players) do
			local iThem = pEnemy:GetTeam()
			local iCTWturns = load(pPlayer, iThem)
			if iCTWturns ~= nil then
				-- print(iCTWturns.." turns are remaining in our war with "..pEnemy:GetCivilizationType())
				local bWar = Teams[pPlayer:GetTeam()]:IsAtWar(iThem)
				if Teams[pPlayer:GetTeam()]:IsAtWar(iThem) then
					-- print("War Detected")
					if iCTWturns > 0 then
						-- print("Triggering Spy Effect")
						CallToWarSpyEffect(pPlayer, iThem)
						save(pPlayer, iThem, iCTWturns - 1)
					elseif iCTWturns == 0 then
						-- print("Shut 'er down, guys")
						EndCallToWarSpyEffect(pPlayer, iThem)
						save(pPlayer, iThem, nil)
					end
				else
					-- print("We are not at war")
					save(pPlayer, iThem, nil)
				end
			end
		end
	end
end


function CallToWarStart(iUs, iThem)
	for i, pPlayer in pairs(Players) do
		if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLANISHINAABE then
			if pPlayer:GetTeam() == iUs then
				-- print(iUs)
				-- print(iThem)
				local tSpies = pPlayer:GetEspionageSpies()
				if #tSpies > 0 then
					local vCtW = 10 * vSpeed[Game.GetGameSpeedType()]
					save(pPlayer, iThem, vCtW)
					CallToWarSpyEffect(pPlayer, iThem)
					local pTitle = ("Call to War!")
					local pDesc = ("The time to strike is now! Place our spies in enemy cities to render their defenses useless!")
					local pCity = pPlayer:GetCapitalCity()
					pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, pDesc, pTitle)
				end
			end
		end
	end		
end

function CallToWarStop(iUs, iThem)
	for i, pPlayer in pairs(Players) do
		if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLANISHINAABE then
			if pPlayer:GetTeam() == iUs then
				save(pPlayer, iThem, nil)
				EndCallToWarSpyEffect(pPlayer, iThem)
			end
		end
	end
end

function FreeAnishSpy(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLANISHINAABE then
		local pCap = pPlayer:GetCapitalCity()
		pCap:SetNumRealBuilding(GameInfoTypes.BUILDING_CLANISHINAABEREL, 1)
	end
end

for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
	local pPlayer = Players[i]
	if pPlayer:IsEverAlive() and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLANISHINAABE then
		-- print("Beothuk Mythic Emblem lua loaded!")
		GameEvents.ReligionFounded.Add(FreeAnishSpy)
		GameEvents.MakePeace.Add(CallToWarStop)
		GameEvents.DeclareWar.Add(CallToWarStart)
		GameEvents.PlayerDoTurn.Add(CallToWarIterate)
        break
    end
end