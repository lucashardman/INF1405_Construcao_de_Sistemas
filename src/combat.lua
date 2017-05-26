M = {}

local function basicAttack (attacker, defender, hero) -- hero == 1 if attacker == player, hero == 2 if defender == player
	local hit = attacker.atk - defender.def

	print (attacker.myName.." attacked! Hit = "..attacker.atk.." - "..defender.def.." = ".. hit)

	if  hit > 0 then -- If hero has less def then enemy's atk, hero loose HP

		if defender.HP - hit >= 0 then
			defender.HP = defender.HP - hit
			hpFlag = 0
		else
			defender.HP = 0
			hpFlag = 0
		end
	end

	if hero == 1 then
		return attacker
	end
	if hero == 2 then
		return defender
	end

end

M.basicAttack = basicAttack

return M