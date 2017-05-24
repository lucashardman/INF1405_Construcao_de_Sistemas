local widget = require( "widget" )

local M = {}

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
	local sequencesLeft = {
	    -- consecutive frames sequence
	    {
	        frames = { 5,6,7,8 },
	        time = 400
	    }
	}

	-- walking right sequences table
	local sequencesRight = {
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

local function walk (animation, x, y)
	animation[1].isVisible = true
	animation[1]:play()
	animation.x = 100
	animation.y = 100
end

local function generateEnemies (enemy, x, y, scale)
	
	local animationEnemy = display.newGroup()

	if (enemy == "lopunny") then
		animationEnemy = createEnemy(80, 25, 27, scale)
		walk(animationEnemy, x, y)
	end

	return animationEnemy
end

M.generateEnemies = generateEnemies

return M