local widget = require( "widget" )

local M = {}

local animationLopunny

local function loadEnemies ()

	local sheetPokemon =
	{
	    frames =
	    {
	    
	        {   -- lopunny walking down 1
	            x = 80 + 0 * 27,
	            y = 25 + 0 * 27,
	            width = 27,
	            height = 27
	        },

		    {   -- lopunny walking down 2
		        x = 80 + 1 * 27,
		        y = 25 + 0 * 27,
		        width = 27,
	            height = 27
		    },

		    {   -- lopunny walking down 3
		        x = 80 + 2 * 27,
		        y = 25 + 0 * 27,
		        width = 27,
	            height = 27
		    },

		    {   -- lopunny walking down 4
		        x = 80 + 3 * 27,
		        y = 25 + 0 * 27,
		        width = 27,
	            height = 27
		    },

		    {   -- lopunny walking left 1
		        x = 80 + 0 * 27,
		        y = 25 + 1 * 27,
		        width = 27,
	            height = 27
		    },

		    {   -- lopunny walking left 2
		        x = 80 + 1 * 27,
		        y = 25 + 1 * 27,
		        width = 27,
	            height = 27
		    },

		    {   -- lopunny walking left 3
		        x = 80 + 2 * 27,
		        y = 25 + 1 * 27,
		        width = 27,
	            height = 27
		    },

		    {   -- lopunny walking left 4
		        x = 80 + 3 * 27,
		        y = 25 + 1 * 27,
		        width = 27,
	            height = 27
		    },

		    {   -- lopunny walking right 1
		        x = 80 + 0 * 27,
		        y = 25 + 2 * 27,
		        width = 27,
	            height = 27
		    },

		    {   -- lopunny walking right 2
		        x = 80 + 1 * 27,
		        y = 25 + 2 * 27,
		        width = 27,
	            height = 27
		    },

		    {   -- lopunny walking right 3
		        x = 80 + 2 * 27,
		        y = 25 + 2 * 27,
		        width = 27,
	            height = 27
		    },

		    {   -- lopunny walking right 4
		        x = 80 + 3 * 27,
		        y = 25 + 2 * 27,
		        width = 27,
	            height = 27
		    },

		    {   -- lopunny walking up 1
		        x = 80 + 0 * 27,
		        y = 25 + 3 * 27,
		        width = 27,
	            height = 27
		    },

		    {   -- lopunny walking up 2
		        x = 80 + 1 * 27,
		        y = 25 + 3 * 27,
		        width = 27,
	            height = 27
		    },

		    {   -- lopunny walking up 3
		        x = 80 + 2 * 27,
		        y = 25 + 3 * 27,
		        width = 27,
	            height = 27
		    },

		    {   -- lopunny walking up 4
		        x = 80 + 3 * 27,
		        y = 25 + 3 * 27,
		        width = 27,
	            height = 27
		    }
	    }
	}
	local pokemon = graphics.newImageSheet( "images/monsters/pokemon.png", sheetPokemon )

	-- walking down sequences table
	local sequences_lopunnyDown = {
	    -- consecutive frames sequence
	    {
	        name = "lopunnyDown",
	        frames = { 1,2,3,4 },
	        time = 400
	    }
	}

	-- walking left sequences table
	local sequences_lopunnyLeft = {
	    -- consecutive frames sequence
	    {
	        name = "lopunnyLeft",
	        frames = { 5,6,7,8 },
	        time = 400
	    }
	}

	-- walking right sequences table
	local sequences_lopunnyRight = {
	    -- consecutive frames sequence
	    {
	        name = "lopunnyRight",
	        frames = { 9,10,11,12 },
	        time = 400
	    }
	}

	-- walking up sequences table
	local sequences_lopunnyUp = {
	    -- consecutive frames sequence
	    {
	        name = "lopunnyUp",
	        frames = { 13,14,15,16 },
	        time = 400
	    }
	}

	local animationLopunnyDown = display.newSprite(pokemon, sequences_lopunnyDown)
	animationLopunnyDown.height = 64
	animationLopunnyDown.width = 64
	animationLopunnyDown.x = 150
	animationLopunnyDown.y = 420
	animationLopunnyDown:scale(1.5,1.5)
	animationLopunnyDown.isVisible = false

	local animationLopunnyLeft = display.newSprite(pokemon, sequences_lopunnyLeft)
	animationLopunnyLeft.height = 64
	animationLopunnyLeft.width = 64
	animationLopunnyLeft.x = 150
	animationLopunnyLeft.y = 420
	animationLopunnyLeft:scale(1.5,1.5)
	animationLopunnyLeft.isVisible = false

	local animationLopunnyRight = display.newSprite(pokemon, sequences_lopunnyRight)
	animationLopunnyRight.height = 64
	animationLopunnyRight.width = 64
	animationLopunnyRight.x = 150
	animationLopunnyRight.y = 420
	animationLopunnyRight:scale(1.5,1.5)
	animationLopunnyRight.isVisible = false

	local animationLopunnyUp = display.newSprite(pokemon, sequences_lopunnyUp)
	animationLopunnyUp.height = 64
	animationLopunnyUp.width = 64
	animationLopunnyUp.x = 150
	animationLopunnyUp.y = 420
	animationLopunnyUp:scale(1.5,1.5)
	animationLopunnyUp.isVisible = false

	animationLopunny = display.newGroup()
	animationLopunny:insert(animationLopunnyDown)
	animationLopunny:insert(animationLopunnyLeft)
	animationLopunny:insert(animationLopunnyRight)
	animationLopunny:insert(animationLopunnyUp)

end


local function walk (animation)
	animation[1].isVisible = true
	animation[1]:play()
end

local function generateEnemies (enemy)
	
	if (enemy == "lopunny") then
		walk(animationLopunny)
	end
end

M.loadEnemies = loadEnemies
M.generateEnemies = generateEnemies

return M