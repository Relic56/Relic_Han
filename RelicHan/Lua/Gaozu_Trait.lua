local civilizationType = GameInfoType["CIVILIZATION_RELIC_HAN"]

function findEligibleCityStates(pPlayer)
	local eligibleCS = {}
	for k, v in ipairs(pPlayer:GetTradeRoutes()) do
		if Players[v.ToID]:IsMinorCiv() then
			if not doesContain(eligibleCS) then
				table.insert(eligibleCS,v)
			end
		end
	end
	return eligibleCS
end

function doesContain(tab,value)
	for k, v in ipairs(tab) do
		if v == value then
			return true
		end
	end
	return false
end

function giveInfluence(playerID)
	local player = Players[playerID]
	local eligibleCS = findEligibleCityStates(Player)
	if player:IsAlive() and player:GetCivilizationType() == civilizationType then
		for k, v in ipairs(eligibleCS) do
			Players[v.ToID]:ChangeMinorCivFriendshipWithMajor(playerID,30)--give influence
			Events.GameplayAlertMessage(Locale.ConvertTextKey("The actions of your Great Scientist have impressed the leaders of {1_Name} gaining you 30 [ICON_INFLUENCE] with them!", Players[v.toID]:GetCivilizationShortDescription()))
		end
	end
end


function silkRoad(iPlayer, iType, iTypeCP)
	if iTypeCP then
		iType = iTypeCP
	end
	
	local pPlayer = Players[iPlayer]
	if(pPlayer:GetCivilizationType() ~= iCiv) then 
		return
	end
	
	if iType == GameInfoType.UNIT_SCIENTIST then
		giveInfluence(iPlayer)
	end
end
		
GameEvents.GreatPersonExpended.Add(silkRoad)