local widget = require( "widget" )

local M = {}

local motionDown
local motionLeft 
local motionRight 
local motionUp 

local paused

local function configSprite (down, left, right, up, scale)

	local group = display.newGroup()

	down:scale(scale, scale)
	down.isVisible = false

	left:scale(scale, scale)
	left.isVisible = false

	right:scale(scale, scale)
	right.isVisible = false

	up:scale(scale, scale)
	up.isVisible = false

	group:insert(down)
	group:insert(left)
	group:insert(right)
	group:insert(up)

	return group
end

local function createEnemy (codX, codY, size, scale)

	local group

	local sheetPokemon =
	{
	    frames =
	    {
	    
	        {   -- lopunny walking down 1
	            x = codX + 0 * size,
	            y = codY + 0 * size,
	            width = size,
	            height = size
	        },

		    {   -- lopunny walking down 2
		        x = codX + 1 * size,
		        y = codY + 0 * size,
		        width = size,
	            height = size
		    },

		    {   -- lopunny walking down 3
		        x = codX + 2 * size,
		        y = codY + 0 * size,
		        width = size,
	            height = size
		    },

		    {   -- lopunny walking down 4
		        x = codX + 3 * size,
		        y = codY + 0 * size,
		        width = size,
	            height = size
		    },

		    {   -- lopunny walking left 1
		        x = codX + 0 * size,
		        y = codY + 1 * size,
		        width = size,
	            height = size
		    },

		    {   -- lopunny walking left 2
		        x = codX + 1 * size,
		        y = codY + 1 * size,
		        width = size,
	            height = size
		    },

		    {   -- lopunny walking left 3
		        x = codX + 2 * size,
		        y = codY + 1 * size,
		        width = size,
	            height = size
		    },

		    {   -- lopunny walking left 4
		        x = codX + 3 * size,
		        y = codY + 1 * size,
		        width = size,
	            height = size
		    },

		    {   -- lopunny walking right 1
		        x = codX + 0 * size,
		        y = codY + 2 * size,
		        width = size,
	            height = size
		    },

		    {   -- lopunny walking right 2
		        x = codX + 1 * size,
		        y = codY + 2 * size,
		        width = size,
	            height = size
		    },

		    {   -- lopunny walking right 3
		        x = codX + 2 * size,
		        y = codY + 2 * size,
		        width = size,
	            height = size
		    },

		    {   -- lopunny walking right 4
		        x = codX + 3 * size,
		        y = codY + 2 * size,
		        width = size,
	            height = size
		    },

		    {   -- lopunny walking up 1
		        x = codX + 0 * size,
		        y = codY + 3 * size,
		        width = size,
	            height = size
		    },

		    {   -- lopunny walking up 2
		        x = codX + 1 * size,
		        y = codY + 3 * size,
		        width = size,
	            height = size
		    },

		    {   -- lopunny walking up 3
		        x = codX + 2 * size,
		        y = codY + 3 * size,
		        width = size,
	            height = size
		    },

		    {   -- lopunny walking up 4
		        x = codX + 3 * size,
		        y = codY + 3 * size,
		        width = size,
	            height = size
		    }
	    }
	}

	local pokemon = graphics.newImageSheet( "images/monsters/pokemon.png", sheetPokemon )

	-- walking down sequences table
	local sequencesDown = {
	    -- consecutive frames sequence
	    {
	        frames = { 1,2,3,4 },
	        time = 400
	    }
	}

	-- walking left sequences table
	local sequencesRight = {
	    -- consecutive frames sequence
	    {
	        frames = { 5,6,7,8 },
	        time = 400
	    }
	}

	-- walking right sequences table
	local sequencesLeft = {
	    -- consecutive frames sequence
	    {
	        frames = { 9,10,11,12 },
	        time = 400
	    }
	}

	-- walking up sequences table
	local sequencesUp = {
	    -- consecutive frames sequence
	    {
	        frames = { 13,14,15,16 },
	        time = 400
	    }
	}

	group = configSprite(
		display.newSprite(pokemon, sequencesDown),
		display.newSprite(pokemon, sequencesLeft),
		display.newSprite(pokemon, sequencesRight),
		display.newSprite(pokemon, sequencesUp),
		scale)

	return group

end

local function walk (animation, x, y, speed)

	motionDown = speed
	motionLeft = speed
	motionRight = -speed
	motionUp = -speed

	animation.x = x
	animation.y = y
	animation.direction = "down"

	-- Move character Down
	local function moveEnemyDown (event)
		animation.y = animation.y + motionDown
		animation[1].isVisible = true
		animation[2].isVisible = false
		animation[3].isVisible = false
		animation[4].isVisible = false
		animation[1]:play()
	end

	-- Move character Left
	local function moveEnemyLeft (event)
		animation.x = animation.x + motionLeft
		animation[1].isVisible = false
		animation[2].isVisible = true
		animation[3].isVisible = false
		animation[4].isVisible = false
		animation[2]:play()
	end

	-- Move character Right
	local function moveEnemyRight (event)
		animation.x = animation.x + motionRight
		animation[1].isVisible = false
		animation[2].isVisible = false
		animation[3].isVisible = true
		animation[4].isVisible = false
		animation[3]:play()
	end

	-- Move character Up
	local function moveEnemyUp (event)
		animation.y = animation.y + motionUp
		animation[1].isVisible = false
		animation[2].isVisible = false
		animation[3].isVisible = false
		animation[4].isVisible = true
		animation[4]:play()
	end

	local function changeDirection (event)
		local direction = math.random(4)

		Runtime:removeEventListener("enterFrame", moveEnemyLeft)
		Runtime:removeEventListener("enterFrame", moveEnemyRight)
		Runtime:removeEventListener("enterFrame", moveEnemyUp)
		Runtime:removeEventListener("enterFrame", moveEnemyDown)

		if direction == 1 then
			Runtime:addEventListener("enterFrame", moveEnemyDown)
			Runtime:removeEventListener("enterFrame", moveEnemyLeft)
			Runtime:removeEventListener("enterFrame", moveEnemyRight)
			Runtime:removeEventListener("enterFrame", moveEnemyUp)
			animation.direction = "down"
			
		elseif direction == 2 then
			Runtime:addEventListener("enterFrame", moveEnemyLeft)
			Runtime:removeEventListener("enterFrame", moveEnemyDown)
			Runtime:removeEventListener("enterFrame", moveEnemyRight)
			Runtime:removeEventListener("enterFrame", moveEnemyUp)
			animation.direction = "left"
			
		elseif direction == 3 then
			Runtime:addEventListener("enterFrame", moveEnemyRight)
			Runtime:removeEventListener("enterFrame", moveEnemyLeft)
			Runtime:removeEventListener("enterFrame", moveEnemyDown)
			Runtime:removeEventListener("enterFrame", moveEnemyUp)
			animation.direction = "right"
			
		elseif direction == 4 then
			Runtime:addEventListener("enterFrame", moveEnemyUp)
			Runtime:removeEventListener("enterFrame", moveEnemyLeft)
			Runtime:removeEventListener("enterFrame", moveEnemyRight)
			Runtime:removeEventListener("enterFrame", moveEnemyDown)
			animation.direction = "up"
			
		else
			print ("erro math random")
		end
	end
	timer.performWithDelay( 5000, changeDirection, -1 ) -- 5000 = 1 second to change direction. -1 = infinity loop
	
	local function isPaused ()
		if paused == true then
			Runtime:removeEventListener("enterFrame", moveEnemyLeft)
			Runtime:removeEventListener("enterFrame", moveEnemyRight)
			Runtime:removeEventListener("enterFrame", moveEnemyUp)
			Runtime:removeEventListener("enterFrame", moveEnemyDown)
		end

	end
	Runtime:addEventListener("enterFrame", isPaused)
	
end

local function insertPropertiesEnemy (animation, name, level)

	print ("Iniciado inimigo "..name.." de level "..level)

	animation.myName = name
	animation.level = level
	animation.onCombat = false

	if name == "lopunny" then
		animation.HP = 20 * level
		animation.maxHP = 20 * level
		animation.atk = 5 * level
		animation.def = 0.5 * level
		animation.alive = true
		animation.experience = 25
		animation.speedAttack = 2 -- Seconds between each attack
	end

	if name == "venusaur" then
		animation.HP = 20 * level
		animation.maxHP = 20 * level
		animation.atk = 5 * level
		animation.def = 0.5 * level
		animation.alive = true
		animation.experience = 25
		animation.speedAttack = 2 -- Seconds between each attack
	end

	if name == "wingull" then
		animation.HP = 20 * level
		animation.maxHP = 20 * level
		animation.atk = 5 * level
		animation.def = 0.5 * level
		animation.alive = true
		animation.experience = 25
		animation.speedAttack = 2 -- Seconds between each attack
	end

	if name == "drifblim" then
		animation.HP = 20 * level
		animation.maxHP = 20 * level
		animation.atk = 5 * level
		animation.def = 0.5 * level
		animation.alive = true
		animation.experience = 25
		animation.speedAttack = 2 -- Seconds between each attack
	end

	if name == "cubone" then
		animation.HP = 20 * level
		animation.maxHP = 20 * level
		animation.atk = 5 * level
		animation.def = 0.5 * level
		animation.alive = true
		animation.experience = 25
		animation.speedAttack = 2 -- Seconds between each attack
	end

	if name == "vespiquen" then
		animation.HP = 20 * level
		animation.maxHP = 20 * level
		animation.atk = 5 * level
		animation.def = 0.5 * level
		animation.alive = true
		animation.experience = 25
		animation.speedAttack = 2 -- Seconds between each attack
	end

	if name == "butterfree" then
		animation.HP = 20 * level
		animation.maxHP = 20 * level
		animation.atk = 5 * level
		animation.def = 0.5 * level
		animation.alive = true
		animation.experience = 25
		animation.speedAttack = 2 -- Seconds between each attack
	end

	if name == "yanmega" then
		animation.HP = 20 * level
		animation.maxHP = 20 * level
		animation.atk = 5 * level
		animation.def = 0.5 * level
		animation.alive = true
		animation.experience = 25
		animation.speedAttack = 2 -- Seconds between each attack
	end

	if name == "pikachu" then
		animation.HP = 20 * level
		animation.maxHP = 20 * level
		animation.atk = 5 * level
		animation.def = 0.5 * level
		animation.alive = true
		animation.experience = 25
		animation.speedAttack = 2 -- Seconds between each attack
	end

	return animation
end

local function generateEnemies (level, x, y, scale)
	
	local animationEnemy = display.newGroup()

	paused = false

	enemySorted = 0

	if level == 1 then
		enemySorted = math.random(1, 3)
	elseif level == 2 then
		enemySorted = math.random(1, 4)
	elseif level == 3 then
		enemySorted = math.random(2, 5)
	elseif level == 4 then
		enemySorted = math.random(3, 5)
	elseif level == 5 then
		enemySorted = math.random(4, 6)
	elseif level == 6 then
		enemySorted = math.random(4, 6)
	elseif level == 7 then
		enemySorted = math.random(4, 7)
	elseif level == 8 then
		enemySorted = math.random(6, 8)
	elseif level == 9 then
		enemySorted = math.random(6, 9)
	end

	if (enemySorted == 1) then

		enemy = "lopunny"
		animationEnemy = createEnemy(80, 25, 27, scale)
		animationEnemy = insertPropertiesEnemy(animationEnemy, enemy, level)
		walk(animationEnemy, x, y, 1)

	elseif (enemySorted == 2) then
		enemy = "pikachu"
		animationEnemy = createEnemy(907, 753, 19, scale)
		animationEnemy = insertPropertiesEnemy(animationEnemy, enemy, level)
		walk(animationEnemy, x, y, 1)

	elseif (enemySorted == 3) then
		enemy = "wingull"
		animationEnemy = createEnemy(575, 619, 26, scale)
		animationEnemy = insertPropertiesEnemy(animationEnemy, enemy, level)
		walk(animationEnemy, x, y, 1)

	elseif (enemySorted == 4) then
		enemy = "cubone"
		animationEnemy = createEnemy(705, 412, 17, scale)
		animationEnemy = insertPropertiesEnemy(animationEnemy, enemy, level)
		walk(animationEnemy, x, y, 1)

	elseif (enemySorted == 5) then
		enemy = "butterfree"
		animationEnemy = createEnemy(478, 143, 25, scale)
		animationEnemy = insertPropertiesEnemy(animationEnemy, enemy, level)
		walk(animationEnemy, x, y, 1)

	elseif (enemySorted == 6) then
		enemy = "vespiquen"
		animationEnemy = createEnemy(303, 21, 28, scale)
		animationEnemy = insertPropertiesEnemy(animationEnemy, enemy, level)
		walk(animationEnemy, x, y, 1)

	elseif (enemySorted == 7) then
		enemy = "yanmega"
		animationEnemy = createEnemy(432, 247, 42, scale)
		animationEnemy = insertPropertiesEnemy(animationEnemy, enemy, level)
		walk(animationEnemy, x, y, 1)

	elseif (enemySorted == 8) then
		enemy = "drifblim"
		animationEnemy = createEnemy(309, 250, 29, scale)
		animationEnemy = insertPropertiesEnemy(animationEnemy, enemy, level)
		walk(animationEnemy, x, y, 1)

	elseif (enemySorted == 9) then
		enemy = "venusaur"
		animationEnemy = createEnemy(530, 26, 29, scale)
		animationEnemy = insertPropertiesEnemy(animationEnemy, enemy, level)
		walk(animationEnemy, x, y, 1)
	end

	animationEnemy.myType = "enemy"
	return animationEnemy
end

local function pauseWalk (p)
	
	paused = p
end

local function showHPbar (enemy)

	local barWidth = 220

	local backgroundBarHP = display.newRoundedRect( 0, 0, 150, 50, 3 )
	backgroundBarHP.x = enemy.x ; backgroundBarHP.y = enemy.y
	local colorBarHP = {217/255, 217/255, 217/255}
	backgroundBarHP.fill = colorBarHP
	backgroundBarHP.height = 15
	backgroundBarHP.width = barWidth

	local percentageHP = enemy.HP/enemy.maxHP

	local barHP = display.newRoundedRect( 0, 0, 150, 50, 3 )
	local colorBarHP = {0/255, 230/255, 0/255}
	barHP.height = 15
	barHP.width = 220
	barHP.fill = colorBarHP
	barHP.width = percentageHP * barWidth
	barHP.x = backgroundBarHP.x ; barHP.y = backgroundBarHP.y
end



M.generateEnemies = generateEnemies
M.pauseWalk = pauseWalk
M.showHPbar = showHPbar

return M