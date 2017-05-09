local M = {}
local function generateItem()

	local itemsGroup = display.newGroup()

	-- Load POTIONS sprite sheet to sheetPotions
	local sheetOptionsItems
	sheetOptionsItems =
	{
	    width = 32, -- width of EACH FRAME
	    height = 32, -- height of EACH FRAME
	    numFrames = 256 -- number of frames
	}
	local sheetPotions = graphics.newImageSheet( "images/items/potions.png", sheetOptionsItems )
	
	-- Lista de poções:
	-- - Poção verde grande -> recupera muito HP
	-- - Poção verde media -> recupera medio HP
	-- - Poção verde pequena -> recupera pouco HP
	-- - Poção rosa -> aumenta velocidade de movimento
	-- - Poção rosa grande -> aumenta mais ainda a velocidade de movimento
	-- - Poção rosa extendida -> aumenta velocidade de movimento por mais tempo
	-- - Poção azul grande -> recupera muito SP
	-- - Poção azul media -> recupera medio SP
	-- - Poção azul pequena -> recupera pouco SP
	-- - Poção amarela -> aumenta ATK
	-- - Poção vermelha -> aumenta DEF
	

	-- walking right sequences table
	local framePocaoVerdeGrande = {
	    -- consecutive frames sequence
	    {
	        name = "Poção Verde Grande",
	        frames = { 69 }
	    }
	}

	for count = 1, 10 do
	
		local pocaoVerdeGrande = display.newSprite(sheetPotions, framePocaoVerdeGrande)
		pocaoVerdeGrande.isVisible = true
		pocaoVerdeGrande.myName = "pocaoVerdeGrande"
		pocaoVerdeGrande.effect = 60
		pocaoVerdeGrande.x = math.random(0 + pocaoVerdeGrande.width/2, 1024 - pocaoVerdeGrande.width/2 )
		pocaoVerdeGrande.y = math.random(0 + pocaoVerdeGrande.height/2, 768 - pocaoVerdeGrande.height/2 )
		itemsGroup:insert(pocaoVerdeGrande)
	end

	return itemsGroup
end
M.generateItem = generateItem

return M