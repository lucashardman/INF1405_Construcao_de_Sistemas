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
			
		elseif direction == 2 then
			Runtime:addEventListener("enterFrame", moveEnemyLeft)
			Runtime:removeEventListener("enterFrame", moveEnemyDown)
			Runtime:removeEventListener("enterFrame", moveEnemyRight)
			Runtime:removeEventListener("enterFrame", moveEnemyUp)
			
		elseif direction == 3 then
			Runtime:addEventListener("enterFrame", moveEnemyRight)
			Runtime:removeEventListener("enterFrame", moveEnemyLeft)
			Runtime:removeEventListener("enterFrame", moveEnemyDown)
			Runtime:removeEventListener("enterFrame", moveEnemyUp)
			
		elseif direction == 4 then
			Runtime:addEventListener("enterFrame", moveEnemyUp)
			Runtime:removeEventListener("enterFrame", moveEnemyLeft)
			Runtime:removeEventListener("enterFrame", moveEnemyRight)
			Runtime:removeEventListener("enterFrame", moveEnemyDown)
			
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
		animation.HP = 2 * level
		animation.maxHP = 2 * level
		animation.atk = 0.5 * level
		animation.def = 0.5 * level
	end

	return animation
end

local function generateEnemies (enemy, level, x, y, scale)
	
	local animationEnemy = display.newGroup()

	--animationEnemy.x = x
	--animationEnemy.y = y
	paused = false

	if (enemy == "lopunny") then

		animationEnemy = createEnemy(80, 25, 27, scale)
		animationEnemy = insertPropertiesEnemy(animationEnemy, enemy, level)
		walk(animationEnemy, x, y, 1)
	end

	animationEnemy.myType = "enemy"
	return animationEnemy
end

local function pauseWalk (p)
	
	paused = p
end


M.generateEnemies = generateEnemies
M.pauseWalk = pauseWalk

return M