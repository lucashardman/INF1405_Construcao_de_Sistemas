local widget = require( "widget" )

local M = {}

local function loadEnemies ()

	local sheetPokemon =
	{
	    frames =
	    {
	    
	        {   -- frame 1
	            x = 80,
	            y = 25,
	            width = 27,
	            height = 27
	        },

		    {   -- frame 2
		        x = 80 + 27,
		        y = 25,
		        width = 27,
	            height = 27
		    },

		    {   -- frame 3
		        x = 80 + 2 * 27,
		        y = 25,
		        width = 27,
	            height = 27
		    },

		    {   -- frame 4
		        x = 80 + 3 * 27,
		        y = 25,
		        width = 27,
	            height = 27
		    }
	    }
	}
	local ratata = graphics.newImageSheet( "images/monsters/pokemon.png", sheetPokemon )

	-- walking down sequences table
	local sequences_skin1 = {
	    -- consecutive frames sequence
	    {
	        name = "skin1",
	        frames = { 1,2,3 },
	        time = 400
	    }
	}

	local animationSkin1 = display.newSprite(ratata, sequences_skin1)
	animationSkin1.height = 64
	animationSkin1.width = 64
	animationSkin1.x = 150
	animationSkin1.y = 420

	animationSkin1:play()

end

local function generateEnemies ()
	print ("oi")
end

M.loadEnemies = loadEnemies
M.generateEnemies = generateEnemies

return M