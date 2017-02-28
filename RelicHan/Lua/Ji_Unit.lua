local iHanUU = GameInfoTypes.UNIT_RELIC_HAN_JI
local civID = GameInfoTypes.CIVILIZATION_RELIC_HAN
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end


function findCityStates(pPlayer)
    local cs = {}
    for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS-1,1 do
        if Players[i]:isAlive() and Teams[pPlayer:GetTeam()]:IsHasMet(Players[i]:GetTeam()) and Players[i]:IsMinorCiv() then
            table.insert(cs,Players[i])
        end
    end
    return cs{}
end

function RelicInfluenceOnKill(killerID, killedID, killedUnitType)
	local pPlayer = Players[killerID]
	local kPlayer = Players[killedID]
	local cityStates = {}
	cityStates = findCityStates()
	if pPlayer:GetCivilizationType() == civID  then
		for pUnit in pPlayer:Units() do
			if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_DID_ATTACK) then --there was an attack
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_DID_ATTACK, false)
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_NO_ATTACK,true)
				local cs = cityStates[JFD_GetRandom(0,#cityStates)]
				cs:ChangeMinorCIvFriendshipWithMajor(killerID,5)
			end
		end
	elseif kPlayers:GetCivilizationType == civID then
		for pUnit in pPlayer:Units() do
			if pUnit:IsHasPromotion(GameInfoType.PROMOTION_DID_ATTACK) then --there was an attack
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_DID_ATTACK, false)
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_NO_ATTACK,true)
				local cs = cityStates[JFD_GetRandom(0,#cityStates)]
				cs:ChangeMinorCIvFriendshipWithMajor(killerID,5)
			end
		end
	end
	return --expects return
end
GameEvents.UnitKilledInCombat.Add(RelicInfluenceOnKill)

function RelicInfluenceFallback(playerID) --above check didn't work, this is a fallback
	local pPlayer = Players[playerID]
	local cityStates = {}
	cityStates = findCityStates()
	for pUnit in pPlayer:Unit() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_DID_ATTACK) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_DID_ATTACK,false)
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_NO_ATTACK, true)
		end
	end
	return --expects return
end

GameEvents.PlayerDoTurn.Add(RelicInfluenceFallback)