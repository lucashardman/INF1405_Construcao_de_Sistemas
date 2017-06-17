M = {}

local size = 0
local codX = 0
local codY = 0

local sheetSword =
	{
	    width = 256, -- width of EACH FRAME
	    height = 194, -- height of EACH FRAME
	    numFrames = 24 -- number of frames
	}


local swordSheet = graphics.newImageSheet( "images/items/sword.png", sheetSword )

local sequencesSwordUp = {
    -- consecutive frames sequence
    {
        frames = { 1,2,3,4,5,6 },
        time = 400
    }
}

local sequencesSwordDown = {
    -- consecutive frames sequence
    {
        frames = { 7,8,9,10,11,12 },
        time = 400
    }
}

local sequencesSwordLeft = {
    -- consecutive frames sequence
    {
        frames = { 13,14,15,16,17,18 },
        time = 400
    }
}

local sequencesSwordRight = {
    -- consecutive frames sequence
    {
        frames = { 19,20,21,22,23,24 },
        time = 400
    }
}


local function body2bodyAttack (attacker, defender)

	local hit = attacker.atk - defender.def

	print (attacker.myName.." attacked! Hit = "..attacker.atk.." - "..defender.def.." = ".. hit)
	print ("HP updated: "..defender.HP)

	if  hit > 0 then -- If hero has less def then enemy's atk, hero loose HP

		if defender.HP - hit >= 0 then
			defender.HP = defender.HP - hit
			hpFlag = 0
		else
			defender.HP = 0
			hpFlag = 0
		end
	end

	local sword 

	if(attacker.direction == "up") then
		sword = display.newSprite(swordSheet, sequencesSwordUp)
		sword.x = attacker.x 
		sword.y = attacker.y - 40
	elseif(attacker.direction == "down") then
		sword = display.newSprite(swordSheet, sequencesSwordDown)
		sword.x = attacker.x 
		sword.y = attacker.y 
	elseif(attacker.direction == "left") then
		sword = display.newSprite(swordSheet, sequencesSwordLeft)
		sword.x = attacker.x - 15
		sword.y = attacker.y - 25
	elseif(attacker.direction == "right") then
		sword = display.newSprite(swordSheet, sequencesSwordRight)
		sword.x = attacker.x + 20
		sword.y = attacker.y - 25
	else
		print ("Erro: load sword.")
	end
	
	sword.isVisible = true
	sword:scale(0.5,0.5)
	sword:play()

	timer.performWithDelay(400, function()

		sword:pause()
		sword.isVisible = false
        end, 1)

	return defender
end

local function body2body (attacker, defender)

	local hit = attacker.atk - defender.def

	print (attacker.myName.." attacked! Hit = "..attacker.atk.." - "..defender.def.." = ".. hit)
	print ("HP updated: "..defender.HP)

	if  hit > 0 then -- If hero has less def then enemy's atk, hero loose HP

		if defender.HP - hit >= 0 then
			defender.HP = defender.HP - hit
			hpFlag = 0
		else
			defender.HP = 0
			hpFlag = 0
		end
	end
	return defender
end

local function initializeHPbar()

	local HP = {}

	local backgroundBarHP = display.newRoundedRect( 0, 0, 150, 50, 3 )
	local barHP = display.newRoundedRect( 0, 0, 150, 50, 3 )

	table.insert(HP, backgroundBarHP)
	table.insert(HP, barHP)

	return HP 
end

local function HPbar(enemy, bars)

	local barWidth = 40

	bars[1].x = enemy.x ; bars[1].y = enemy.y + enemy.height/2 + 5
	local colorBarHP = {217/255, 217/255, 217/255}
	bars[1].fill = colorBarHP
	bars[1].height = 5
	bars[1].width = barWidth

	local percentageHP = enemy.HP/enemy.maxHP

	local colorBarHP = {0/255, 230/255, 0/255}
	bars[2].height = 5
	bars[2].width = barWidth
	bars[2].fill = colorBarHP
	bars[2].width = percentageHP * barWidth
	bars[2].x = enemy.x - bars[1].width/2 + bars[2].width/2; bars[2].y = bars[1].y

	if percentageHP == 0 then
		bars[1].isVisible = false
		bars[2].isVisible = false
	end

	return bars
end

local function explosionEffect(enemy)
	local sheetExplosion =
		{
		    width = 66, -- width of EACH FRAME
		    height = 66, -- height of EACH FRAME
		    numFrames = 32 -- number of frames
		}
	local explosionSheet = graphics.newImageSheet( "images/other/explosion-effect.png", sheetExplosion )

	local sequences = {
	    -- consecutive frames sequence
	    {
	        frames = { 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32 },
	        time = 400
	    }
	}
	
	explosion = display.newSprite(explosionSheet, sequences)
	explosion.x = enemy.x
	explosion.y = enemy.y
	explosion:play()
	local function stopExplosion ()
		explosion.isVisible = false
	end
	timer.performWithDelay( 400, stopExplosion, 1 )

end


M.body2bodyAttack = body2bodyAttack
M.body2body = body2body
M.HPbar = HPbar
M.initializeHPbar = initializeHPbar
M.explosionEffect = explosionEffect

return M