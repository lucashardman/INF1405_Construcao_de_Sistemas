local widget = require( "widget" )

local M = {}

local function configSprite (down, left, right, up, group, x, y, scale)

	down.x = x
	down.y = y
	down:scale(scale, scale)
	down.isVisible = false

	left.x = x
	left.y = y
	left:scale(scale, scale)
	left.isVisible = false

	right.x = x
	right.y = y
	right:scale(scale, scale)
	right.isVisible = false

	up.x = x
	up.y = y
	up:scale(scale, scale)
	up.isVisible = false

	group:insert(down)
	group:insert(left)
	group:insert(right)
	group:insert(up)

	return group
end

local function createEnemy (codX, codY, size, animation, mapCodX, mapCodY, scale)

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
		animation, mapCodX, mapCodY, scale)

	return group

end

local function walk (animation, x, y)
	animation[1].isVisible = true
	animation[1]:play()
	animation.x = 100 - x
	animation.y = 100 - y
end

local function generateEnemies (enemy, x, y, scale)
	
	if (enemy == "lopunny") then
		local animationLopunny = display.newGroup()
		local animationLopunny = createEnemy(80, 25, 27, animationLopunny, x, y, scale)
		walk(animationLopunny, x, y)
	end
end

M.generateEnemies = generateEnemies

return M