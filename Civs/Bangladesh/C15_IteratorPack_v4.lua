-- C15_IteratorPack
-- Author: Chrisy
-- DateCreated: 6/5/2019 12:43:52 AM
--------------------------------------------------------------

-- Holy shit I actually did it :D

-- Just a shame I can't make them Plot methods ;_;

function C15_PlotUnitsIterator(pPlot) -- Fuck yeah!
	local next = coroutine.create(function()
		local i = 0 
		local pUnit = pPlot:GetLayerUnit(i) 
		while pUnit do
			coroutine.yield(pUnit)
			 i = i + 1 
			 pUnit = pPlot:GetLayerUnit(i)
		end
		
		return nil
	end)
	
	return function()
		local bSuccess, pIterUnit = coroutine.resume(next) -- I'll assume bSuccess is some hidden return since icbf to look up documentation
		
		return bSuccess and pIterUnit or nil
	end
end

function C15_AdjacentPlotIterator(pPlot, bIncludeCentre) -- This one's much more of a PlotIterators clone obviously, since I'm trying to achieve the same end goal (in a less versatile fashion :p)
	local next = coroutine.create(function()
		if bIncludeCentre then
			coroutine.yield(pPlot)
		end
		for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			coroutine.yield(Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction))
		end
	end)
	
	return function()
		local pReturnPlot = nil
		local bSuccess, pIterPlot = coroutine.resume(next)
		
		while (bSuccess and pReturnPlot == nil) do
			if pIterPlot then
				pReturnPlot = pIterPlot
			else
				bSuccess, pIterPlot = coroutine.resume(next)
			end
		end
		
		return bSuccess and pReturnPlot or nil
	end
end

function C15_NearbyUnitIterator(pPlot, bIncludeCentre) -- No longer includes Units on the same Plot by default! For the sake of consistency with C15_AdjacentPlotIterator and at the expense of the function name
	local next = coroutine.create(function()
		for pIterPlot in C15_AdjacentPlotIterator(pPlot, bIncludeCentre) do
			if pIterPlot then
				for pUnit in C15_PlotUnitsIterator(pIterPlot) do
					coroutine.yield(pUnit)
				end	
			end	
		end
	end)
	
	return function()
		local bSuccess, pUnit = coroutine.resume(next)
		
		return bSuccess and pUnit or nil
	end
end

local iMinorStart = GameDefines.MAX_MAJOR_CIVS
local iMinorEnd = iMinorStart + GameDefines.MAX_MINOR_CIVS - 1

function C15_MajorIterator()
	local next = coroutine.create(function()
        for i = 0, iMinorStart - 1 do
            local pIterPlayer = Players[i]
            if pIterPlayer and pIterPlayer:IsEverAlive() and pIterPlayer:IsAlive() and (not pIterPlayer:IsMinorCiv()) then
                coroutine.yield(pIterPlayer)
            end
        end
        
        return nil
    end)
    
    return function()
        local bSuccess, pCiv = coroutine.resume(next)
        
        return bSuccess and pCiv or nil
    end
end

function C15_CSIterator()
    local next = coroutine.create(function()
        for i = iMinorStart, iMinorEnd do
            local pIterPlayer = Players[i]
            if pIterPlayer and pIterPlayer:IsEverAlive() and pIterPlayer:IsAlive() and pIterPlayer:IsMinorCiv() then
                coroutine.yield(pIterPlayer)
            end
        end
        
        return nil
    end)
    
    return function()
        local bSuccess, pCS = coroutine.resume(next)
        
        return bSuccess and pCS or nil
    end
end