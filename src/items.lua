local M = {}
local function generateItem()

	local itemsGroup = display.newGroup()


	local sheetOptionsItems
	sheetOptionsItems =
	{
	    width = 32, -- width of EACH FRAME
	    height = 32, -- height of EACH FRAME
	    numFrames = 256 -- number of frames
	}
	local skin1 = graphics.newImageSheet( "images/items/potions.png", sheetOptionsItems )
	-- walking right sequences table
	local sequences_jaca = {
	    -- consecutive frames sequence
	    {
	        name = "jaca",
	        frames = { 10 },
	        time = 400
	    }
	}
	local walkingUp = display.newSprite(skin1, sequences_jaca)
	walkingUp.isVisible = true
	walkingUp.x = 300
	walkingUp.y = 300

	for count = 1, 10 do
		local itemDiamond = display.newImage("images/items/gemRedStroked.png")

		itemDiamond.x = math.random(0 + itemDiamond.width/2, 1024 - itemDiamond.width/2 )
		itemDiamond.y = math.random(0 + itemDiamond.height/2, 768 - itemDiamond.height/2 )
		
		itemsGroup:insert(itemDiamond)
	end

	return itemsGroup
end
M.generateItem = generateItem

return M