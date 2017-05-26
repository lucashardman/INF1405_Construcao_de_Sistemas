local M = {}

----------------------------------------------
-- This function controls de character,		--
-- allowing it to go up, down, right and 	--
-- left on the map 							--
----------------------------------------------
local function characterController (characterGroup, speed)


	local motionx = 0 -- Variable used to move horizontally
	local motiony = 0 -- Variable used to move vertically
	--speed = 2 -- Speed of movement of the character

	-- Called when a key event has been received
	local function onKeyEvent( event )

	    -- Print which key was pressed down/up
	    -- local message = "Key '" .. event.keyName .. "' was pressed " .. event.phase
	    -- print( message )

	    if (event.keyName == "right" and event.phase == "down") then
	    	motionx = speed

	    	characterGroup[1].isVisible = true
	    	characterGroup[2].isVisible = false
	    	characterGroup[3].isVisible = false
	    	characterGroup[4].isVisible = false

	    	characterGroup[1]:play()
	    end

		if (event.keyName == "right" and event.phase == "up") then
	    	motionx = 0
	    	characterGroup[1]:setFrame(1)
	    	characterGroup[1]:pause()
	    end

	    if (event.keyName == "left" and event.phase == "down") then
	    	motionx = -speed

	    	characterGroup[1].isVisible = false
	    	characterGroup[2].isVisible = true
	    	characterGroup[3].isVisible = false
	    	characterGroup[4].isVisible = false
	    	
	    	characterGroup[2]:play()
	    end

		if (event.keyName == "left" and event.phase == "up") then
	    	motionx = 0
	    	characterGroup[2]:setFrame(1)
	    	characterGroup[2]:pause()
	    end

	   	if (event.keyName == "up" and event.phase == "down") then
	    	motiony = -speed

	    	characterGroup[1].isVisible = false
	    	characterGroup[2].isVisible = false
	    	characterGroup[3].isVisible = true
	    	characterGroup[4].isVisible = false
	    	
	    	characterGroup[3]:play()
	    end

		if (event.keyName == "up" and event.phase == "up") then
	    	motiony = 0
	    	characterGroup[3]:setFrame(1)
	    	characterGroup[3]:pause()
	    end

	    if (event.keyName == "down" and event.phase == "down") then
	    	motiony = speed

	    	characterGroup[1].isVisible = false
	    	characterGroup[2].isVisible = false
	    	characterGroup[3].isVisible = false
	    	characterGroup[4].isVisible = true
	    	
	    	characterGroup[4]:play()
	    end

		if (event.keyName == "down" and event.phase == "up") then
	    	motiony = 0
	    	characterGroup[4]:setFrame(1)
	    	characterGroup[4]:pause()
	    end
	end
 
	-- Add the key event listener
	Runtime:addEventListener( "key", onKeyEvent )

	-- Move character
	local function movePlayer (event)
		characterGroup.x = characterGroup.x + motionx
		characterGroup.y = characterGroup.y + motiony
	end
	Runtime:addEventListener("enterFrame", movePlayer)
	return characterGroup
end

local function initializeChar (sheet_hero)

	local characterGroup = display.newGroup()

	-- walking right sequences table
	local sequences_walkingRight = {
	    -- consecutive frames sequence
	    {
	        name = "walkingRight",
	        frames = { 10,11,12 },
	        time = 400
	    }
	}

	-- walking left sequences table
	local sequences_walkingLeft = {
	    -- consecutive frames sequence
	    {
	        name = "walkingLeft",
	        frames = { 7,8,9 },
	        time = 400
	    }
	}

	-- walking up sequences table
	local sequences_walkingUp = {
	    -- consecutive frames sequence
	    {
	        name = "walkingUp",
	        frames = { 4,5,6 },
	        time = 400
	    }
	}

	-- walking down sequences table
	local sequences_walkingDown = {
	    -- consecutive frames sequence
	    {
	        name = "walkingDown",
	        frames = { 1,2,3 },
	        time = 400
	    }
	}

	local walkingRight = display.newSprite(sheet_hero, sequences_walkingRight)
	walkingRight.isVisible = false
	local walkingLeft = display.newSprite(sheet_hero, sequences_walkingLeft)
	walkingLeft.isVisible = false
	local walkingUp = display.newSprite(sheet_hero, sequences_walkingUp)
	walkingUp.isVisible = false
	local walkingDown = display.newSprite(sheet_hero, sequences_walkingDown)
	walkingDown.isVisible = true

	characterGroup:insert(walkingRight)
	characterGroup:insert(walkingLeft)
	characterGroup:insert(walkingUp)
	characterGroup:insert(walkingDown)

	characterGroup.x = 300
	characterGroup.y = 300
	characterGroup.height = 40
	characterGroup.width = 32

	characterController(characterGroup, 2)

	return characterGroup
end

M.initializeChar = initializeChar
M.characterController = characterController

return M