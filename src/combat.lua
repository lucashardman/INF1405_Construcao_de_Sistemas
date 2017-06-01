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

M.body2bodyAttack = body2bodyAttack

return M