-- 
-- Projeto da disciplina INF1405 - Construção de Sistemas - PUC-Rio
-- Autor: Lucas Hardman Gomes Campos França
--

local widget = require "widget"
local controller = require "controller"

local function start (background, startButton, screenGroup, chosenClass, chosenSkin, skinGroup)
	
	if (chosenClass == nil) then
		print ("Select a class!!!")
	elseif (chosenSkin == nil) then
		print ("Select a skin!!!")
	elseif( chosenSkin < 1 or chosenSkin > 11) then
		print ("Select a skin!!!")
	else
		if (chosenSkin == 1) then
			controller.gameController(skinGroup[1])	
		elseif (chosenSkin == 2) then	
			controller.gameController(skinGroup[2])	
		elseif (chosenSkin == 3) then	
			controller.gameController(skinGroup[3])	
		elseif (chosenSkin == 4) then	
			controller.gameController(skinGroup[4])	
		elseif (chosenSkin == 5) then	
			controller.gameController(skinGroup[5])	
		elseif (chosenSkin == 6) then	
			controller.gameController(skinGroup[6])	
		elseif (chosenSkin == 7) then	
			controller.gameController(skinGroup[7])	
		elseif (chosenSkin == 8) then	
			controller.gameController(skinGroup[8])	
		elseif (chosenSkin == 9) then	
			controller.gameController(skinGroup[9])	
		elseif (chosenSkin == 10) then	
			controller.gameController(skinGroup[10])	
		elseif (chosenSkin == 11) then	
			controller.gameController(skinGroup[11])		
		end
		print(chosenSkin)
		startButton:removeSelf()
		background:removeSelf()
		screenGroup:removeSelf()	
	end
end

local function setPreparationScreen (logo, playButton, background)

	local chosenClass
	local chosenSkin

	logo:removeSelf()
	playButton:removeSelf()

	local screenGroup = display.newGroup()

	local chooseClass = display.newText( "Choose your class:", 200, 100, "images/other/RPGSystem.ttf", 36 )
	screenGroup:insert(chooseClass)

	local swordmanClass = display.newText( "Swordman", 300, 300, native.systemFont, 16 )
	local archerClass = display.newText( "Archer", 450, 300, native.systemFont, 16 )
	local acolyteClass = display.newText( "Acolyte", 600, 300, native.systemFont, 16 )
	local mageClass = display.newText( "Mage", 750, 300, native.systemFont, 16 )
	screenGroup:insert(swordmanClass)
	screenGroup:insert(archerClass)
	screenGroup:insert(acolyteClass)
	screenGroup:insert(mageClass)

	local pinClass = display.newCircle( 160, 240, 23 )
	pinClass.isVisible = false
	screenGroup:insert(pinClass)
	pinClass.strokeWidth = 4
	pinClass.stroke = {0,0,0}
	pinClass.x = 300
	pinClass.y = 160

	local function swordmanButtonEvent( event )
		if ( "ended" == event.phase ) then
			chosenClass = "swordman"
	 		--print(chosenClass)
	 		pinClass.isVisible = true
	 		pinClass.x = 300
			pinClass.y = 160
	 	end
	end
	local function archerButtonEvent( event )
		if ( "ended" == event.phase ) then
	 		chosenClass = "archer"
	 		--print(chosenClass)
	 		pinClass.isVisible = true
	 		pinClass.x = 450
			pinClass.y = 160
	 	end
	end
	local function acolyteButtonEvent( event )
		if ( "ended" == event.phase ) then
	 		chosenClass = "acolyte"
	 		--print(chosenClass)
	 		pinClass.isVisible = true
	 		pinClass.x = 600
			pinClass.y = 160
	 	end
	end
	local function mageButtonEvent( event )
		if ( "ended" == event.phase ) then
	 		chosenClass = "mage"
	 		--print(chosenClass)
	 		pinClass.isVisible = true
	 		pinClass.x = 750
			pinClass.y = 160
	 	end
	end

	local swordmanSlot = widget.newButton(
	    {
	        --label = "button",
	        onEvent = swordmanButtonEvent,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "roundedRect",
	        width = 75,
	        height = 75,
	        cornerRadius = 10,
	        fillColor = { default={1,1,1,1}, over={1,1,1,1} },
	        strokeColor = { default={0,0,0,1}, over={0.8,0.8,2,1} },
	        strokeWidth = 4
	    }
	)
	swordmanSlot.x = 300
	swordmanSlot.y = 240
	screenGroup:insert(swordmanSlot)

	swordmanSlot.stroke = slotsStroke
	swordmanSlot.strokeWidth = 4

	local archerSlot = widget.newButton(
	    {
	        --label = "button",
	        onEvent = archerButtonEvent,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "roundedRect",
	        width = 75,
	        height = 75,
	        cornerRadius = 10,
	        fillColor = { default={1,1,1,1}, over={1,1,1,1} },
	        strokeColor = { default={0,0,0,1}, over={0.8,0.8,2,1} },
	        strokeWidth = 4
	    }
	)
	archerSlot.x = 450
	archerSlot.y = 240
	screenGroup:insert(archerSlot)

	archerSlot.stroke = slotsStroke
	archerSlot.strokeWidth = 4

	local acolyteSlot = widget.newButton(
	    {
	        --label = "button",
	        onEvent = acolyteButtonEvent,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "roundedRect",
	        width = 75,
	        height = 75,
	        cornerRadius = 10,
	        fillColor = { default={1,1,1,1}, over={1,1,1,1} },
	        strokeColor = { default={0,0,0,1}, over={0.8,0.8,2,1} },
	        strokeWidth = 4
	    }
	)
	acolyteSlot.x = 600
	acolyteSlot.y = 240
	screenGroup:insert(acolyteSlot)

	acolyteSlot.stroke = slotsStroke
	acolyteSlot.strokeWidth = 4

	local mageSlot = widget.newButton(
	    {
	        --label = "button",
	        onEvent = mageButtonEvent,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "roundedRect",
	        width = 75,
	        height = 75,
	        cornerRadius = 10,
	        fillColor = { default={1,1,1,1}, over={1,1,1,1} },
	        strokeColor = { default={0,0,0,1}, over={0.8,0.8,2,1} },
	        strokeWidth = 4
	    }
	)
	mageSlot.x = 750
	mageSlot.y = 240
	screenGroup:insert(mageSlot)

	mageSlot.stroke = slotsStroke
	mageSlot.strokeWidth = 4

	local swordmanIcon = display.newImage("images/other/sword.png")
	screenGroup:insert(swordmanIcon)
	
	swordmanIcon.height = 64
	swordmanIcon.width = 64
	swordmanIcon.x = 300
	swordmanIcon.y = 240

	local archerIcon = display.newImage("images/other/bow.png")
	screenGroup:insert(archerIcon)

	archerIcon.height = 64
	archerIcon.width = 64
	archerIcon.x = 450
	archerIcon.y = 240

	local acolyteIcon = display.newImage("images/other/cross.png")
	screenGroup:insert(acolyteIcon)

	acolyteIcon.height = 64
	acolyteIcon.width = 64
	acolyteIcon.x = 600
	acolyteIcon.y = 240

	local mageIcon = display.newImage("images/other/wand.png")
	screenGroup:insert(mageIcon)

	mageIcon.height = 64
	mageIcon.width = 64
	mageIcon.x = 750
	mageIcon.y = 240

	local chooseSkin = display.newText( "Choose your skin:", 200, 350, "images/other/RPGSystem.ttf", 36 )
	screenGroup:insert(chooseSkin)

	------------------------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------------------------
	-- Display the buttons of the Skins																	--
	-- skin[] -> array of pritsheets, where each position represent one diferent skin. This  array is 	--
	-- sent to the function "start()" and the chosen skin (one of the array positions) is sent to the 	--
	-- controller module.																				--
	------------------------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------------------------

	local skinGroup = {}
	
	local sheetOptionsSkin1
	sheetOptionsSkin1 =
	{
	    width = 16, -- width of EACH FRAME
	    height = 20, -- height of EACH FRAME
	    numFrames = 12 -- number of frames
	}

	local sheetOptionsSkin2
	sheetOptionsSkin2 =
	{
	    width = 16, -- width of EACH FRAME
	    height = 16, -- height of EACH FRAME
	    numFrames = 12 -- number of frames
	}

	local sheetOptionsSkin3
	sheetOptionsSkin3 =
	{
	    width = 16, -- width of EACH FRAME
	    height = 16, -- height of EACH FRAME
	    numFrames = 12 -- number of frames
	}
	
	local sheetOptionsSkin4
	sheetOptionsSkin4 =
	{
	    width = 16, -- width of EACH FRAME
	    height = 16, -- height of EACH FRAME
	    numFrames = 12 -- number of frames
	}

	local sheetOptionsSkin5
	sheetOptionsSkin5 =
	{
	    width = 16, -- width of EACH FRAME
	    height = 24, -- height of EACH FRAME
	    numFrames = 12 -- number of frames
	}
	
	local sheetOptionsSkin6
	sheetOptionsSkin6 =
	{
	    width = 16, -- width of EACH FRAME
	    height = 18, -- height of EACH FRAME
	    numFrames = 12 -- number of frames
	}
	
	local sheetOptionsSkin7
	sheetOptionsSkin7 =
	{
	    width = 16, -- width of EACH FRAME
	    height = 19, -- height of EACH FRAME
	    numFrames = 12 -- number of frames
	}
	
	local sheetOptionsSkin8
	sheetOptionsSkin8 =
	{
	    width = 16, -- width of EACH FRAME
	    height = 16, -- height of EACH FRAME
	    numFrames = 12 -- number of frames
	}
	
	local sheetOptionsSkin9
	sheetOptionsSkin9 =
	{
	    width = 16, -- width of EACH FRAME
	    height = 16, -- height of EACH FRAME
	    numFrames = 12 -- number of frames
	}
	
	local sheetOptionsSkin10
	sheetOptionsSkin10 =
	{
	    width = 16, -- width of EACH FRAME
	    height = 18, -- height of EACH FRAME
	    numFrames = 12 -- number of frames
	}
	
	local sheetOptionsSkin11
	sheetOptionsSkin11 =
	{
	    width = 16, -- width of EACH FRAME
	    height = 16, -- height of EACH FRAME
	    numFrames = 12 -- number of frames
	}

	local skin1 = graphics.newImageSheet( "images/characters/char1.png", sheetOptionsSkin1 )
	skinGroup[1] = skin1

	-- walking down sequences table
	local sequences_skin1 = {
	    -- consecutive frames sequence
	    {
	        name = "skin1",
	        frames = { 1,2,3 },
	        time = 400
	    }
	}

	local animationSkin1 = display.newSprite(skin1, sequences_skin1)
	animationSkin1.height = 64
	animationSkin1.width = 64
	animationSkin1.x = 150
	animationSkin1.y = 420
	screenGroup:insert(animationSkin1)

	local skin2 = graphics.newImageSheet( "images/characters/char2.png", sheetOptionsSkin2 )
	skinGroup[2] = skin2

	-- walking down sequences table
	local sequences_skin2 = {
	    -- consecutive frames sequence
	    {
	        name = "skin2",
	        frames = { 1,2,3 },
	        time = 400
	    }
	}

	local animationSkin2 = display.newSprite(skin2, sequences_skin2)
	animationSkin2.height = 64
	animationSkin2.width = 64
	animationSkin2.x = 240
	animationSkin2.y = 420
	screenGroup:insert(animationSkin2)

	local skin3 = graphics.newImageSheet( "images/characters/char3.png", sheetOptionsSkin3 )
	skinGroup[3] = skin3

	-- walking down sequences table
	local sequences_skin3 = {
	    -- consecutive frames sequence
	    {
	        name = "skin3",
	        frames = { 1,2,3 },
	        time = 400
	    }
	}

	local animationSkin3 = display.newSprite(skin3, sequences_skin3)
	animationSkin3.height = 64
	animationSkin3.width = 64
	animationSkin3.x = 330
	animationSkin3.y = 420
	screenGroup:insert(animationSkin3)

	local skin4 = graphics.newImageSheet( "images/characters/char4.png", sheetOptionsSkin4 )
	skinGroup[4] = skin4

	-- walking down sequences table
	local sequences_skin4 = {
	    -- consecutive frames sequence
	    {
	        name = "skin4",
	        frames = { 1,2,3 },
	        time = 400
	    }
	}

	local animationSkin4 = display.newSprite(skin4, sequences_skin4)
	animationSkin4.height = 64
	animationSkin4.width = 64
	animationSkin4.x = 420
	animationSkin4.y = 420
	screenGroup:insert(animationSkin4)

	local skin5 = graphics.newImageSheet( "images/characters/char5.png", sheetOptionsSkin5 )
	skinGroup[5] = skin5

	-- walking down sequences table
	local sequences_skin5 = {
	    -- consecutive frames sequence
	    {
	        name = "skin5",
	        frames = { 1,2,3 },
	        time = 400
	    }
	}

	local animationSkin5 = display.newSprite(skin5, sequences_skin5)
	animationSkin5.height = 64
	animationSkin5.width = 64
	animationSkin5.x = 510
	animationSkin5.y = 420
	screenGroup:insert(animationSkin5)

	local skin6 = graphics.newImageSheet( "images/characters/char6.png", sheetOptionsSkin6 )
	skinGroup[6] = skin6

	-- walking down sequences table
	local sequences_skin6 = {
	    -- consecutive frames sequence
	    {
	        name = "skin6",
	        frames = { 1,2,3 },
	        time = 400
	    }
	}

	local animationSkin6 = display.newSprite(skin6, sequences_skin6)
	animationSkin6.height = 64
	animationSkin6.width = 64
	animationSkin6.x = 600
	animationSkin6.y = 420
	screenGroup:insert(animationSkin6)

	local skin7 = graphics.newImageSheet( "images/characters/char7.png", sheetOptionsSkin7 )
	skinGroup[7] = skin7

	-- walking down sequences table
	local sequences_skin7 = {
	    -- consecutive frames sequence
	    {
	        name = "skin7",
	        frames = { 1,2,3 },
	        time = 400
	    }
	}

	local animationSkin7 = display.newSprite(skin7, sequences_skin7)
	animationSkin7.height = 64
	animationSkin7.width = 64
	animationSkin7.x = 690
	animationSkin7.y = 420
	screenGroup:insert(animationSkin7)

	local skin8 = graphics.newImageSheet( "images/characters/char8.png", sheetOptionsSkin8 )
	skinGroup[8] = skin8

	-- walking down sequences table
	local sequences_skin8 = {
	    -- consecutive frames sequence
	    {
	        name = "skin8",
	        frames = { 1,2,3 },
	        time = 400
	    }
	}

	local animationSkin8 = display.newSprite(skin8, sequences_skin8)
	animationSkin8.height = 64
	animationSkin8.width = 64
	animationSkin8.x = 780
	animationSkin8.y = 420
	screenGroup:insert(animationSkin8)

	local skin9 = graphics.newImageSheet( "images/characters/char9.png", sheetOptionsSkin9 )
	skinGroup[9] = skin9

	-- walking down sequences table
	local sequences_skin9 = {
	    -- consecutive frames sequence
	    {
	        name = "skin9",
	        frames = { 1,2,3 },
	        time = 400
	    }
	}

	local animationSkin9 = display.newSprite(skin9, sequences_skin9)
	animationSkin9.height = 64
	animationSkin9.width = 64
	animationSkin9.x = 860
	animationSkin9.y = 420
	screenGroup:insert(animationSkin9)

	local skin10 = graphics.newImageSheet( "images/characters/char10.png", sheetOptionsSkin10 )
	skinGroup[10] = skin10

	-- walking down sequences table
	local sequences_skin10 = {
	    -- consecutive frames sequence
	    {
	        name = "skin10",
	        frames = { 1,2,3 },
	        time = 400
	    }
	}

	local animationSkin10 = display.newSprite(skin10, sequences_skin10)
	animationSkin10.height = 64
	animationSkin10.width = 64
	animationSkin10.x = 150
	animationSkin10.y = 520
	screenGroup:insert(animationSkin10)

	local skin11 = graphics.newImageSheet( "images/characters/char11.png", sheetOptionsSkin11 )
	skinGroup[11] = skin11

	-- walking down sequences table
	local sequences_skin11 = {
	    -- consecutive frames sequence
	    {
	        name = "skin11",
	        frames = { 1,2,3 },
	        time = 400
	    }
	}

	local animationSkin11 = display.newSprite(skin11, sequences_skin11)
	animationSkin11.height = 64 
	animationSkin11.width = 64
	animationSkin11.x = 240
	animationSkin11.y = 520
	screenGroup:insert(animationSkin11)

	local chosenSkinPin = display.newRect( 150, 464, 64, 8 )
	screenGroup:insert(chosenSkinPin)
	chosenSkinPin.isVisible = false
	chosenSkinPin.strokeWidth = 4
	chosenSkinPin:setFillColor( 1,1,1 )
	chosenSkinPin:setStrokeColor( 0, 0, 0 )

	local function buttonEventSkin1( event )
		if ( "ended" == event.phase ) then
	 		chosenSkin = 1
	 		print(chosenSkin)
	 		chosenSkinPin.isVisible = true
	 		chosenSkinPin.x = 150
			chosenSkinPin.y = 469
	 	end
	end

	local function buttonEventSkin2( event )
		if ( "ended" == event.phase ) then
	 		chosenSkin = 2
	 		print(chosenSkin)
	 		chosenSkinPin.isVisible = true
	 		chosenSkinPin.x = 240
			chosenSkinPin.y = 469
	 	end
	end

	local function buttonEventSkin3( event )
		if ( "ended" == event.phase ) then
	 		chosenSkin = 3
	 		print(chosenSkin)
	 		chosenSkinPin.isVisible = true
	 		chosenSkinPin.x = 330
			chosenSkinPin.y = 469
	 	end
	end

	local function buttonEventSkin4( event )
		if ( "ended" == event.phase ) then
	 		chosenSkin = 4
	 		print(chosenSkin)
	 		chosenSkinPin.isVisible = true
	 		chosenSkinPin.x = 420
			chosenSkinPin.y = 469
	 	end
	end

	local function buttonEventSkin5( event )
		if ( "ended" == event.phase ) then
	 		chosenSkin = 5
	 		print(chosenSkin)
	 		chosenSkinPin.isVisible = true
	 		chosenSkinPin.x = 510
			chosenSkinPin.y = 469
	 	end
	end

	local function buttonEventSkin6( event )
		if ( "ended" == event.phase ) then
	 		chosenSkin = 6
	 		print(chosenSkin)
	 		chosenSkinPin.isVisible = true
	 		chosenSkinPin.x = 600
			chosenSkinPin.y = 469
	 	end
	end

	local function buttonEventSkin7( event )
		if ( "ended" == event.phase ) then
	 		chosenSkin = 7
	 		print(chosenSkin)
	 		chosenSkinPin.isVisible = true
	 		chosenSkinPin.x = 690
			chosenSkinPin.y = 469
	 	end
	end

	local function buttonEventSkin8( event )
		if ( "ended" == event.phase ) then
	 		chosenSkin = 8
	 		print(chosenSkin)
	 		chosenSkinPin.isVisible = true
	 		chosenSkinPin.x = 780
			chosenSkinPin.y = 469
	 	end
	end

	local function buttonEventSkin9( event )
		if ( "ended" == event.phase ) then
	 		chosenSkin = 9
	 		print(chosenSkin)
	 		chosenSkinPin.isVisible = true
	 		chosenSkinPin.x = 870
			chosenSkinPin.y = 469
	 	end
	end

	local function buttonEventSkin10( event )
		if ( "ended" == event.phase ) then
	 		chosenSkin = 10
	 		print(chosenSkin)
	 		chosenSkinPin.isVisible = true
	 		chosenSkinPin.x = 150
			chosenSkinPin.y = 571
	 	end
	end

	local function buttonEventSkin11( event )
		if ( "ended" == event.phase ) then
	 		chosenSkin = 11
	 		print(chosenSkin)
	 		chosenSkinPin.isVisible = true
	 		chosenSkinPin.x = 240
			chosenSkinPin.y = 571
	 	end
	end

	local slotSkin1 = widget.newButton(
	    {
	        --label = "button",
	        onEvent = buttonEventSkin1,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "roundedRect",
	        width = 74,
	        height = 74,
	        cornerRadius = 10,
	        fillColor = { default={0,0,0,0.1}, over={0,0,0,0} }
	    }
	)
	slotSkin1.x = 150
	slotSkin1.y = 420
	screenGroup:insert(slotSkin1)

	local slotSkin2 = widget.newButton(
	    {
	        --label = "button",
	        onEvent = buttonEventSkin2,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "roundedRect",
	        width = 74,
	        height = 74,
	        cornerRadius = 10,
	        fillColor = { default={0,0,0,0.1}, over={0,0,0,0} }
	    }
	)
	slotSkin2.x = 240
	slotSkin2.y = 420
	screenGroup:insert(slotSkin2)

	local slotSkin3 = widget.newButton(
	    {
	        --label = "button",
	        onEvent = buttonEventSkin3,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "roundedRect",
	        width = 74,
	        height = 74,
	        cornerRadius = 10,
	        fillColor = { default={0,0,0,0.1}, over={0,0,0,0} }
	    }
	)
	slotSkin3.x = 330
	slotSkin3.y = 420
	screenGroup:insert(slotSkin3)

	local slotSkin4 = widget.newButton(
	    {
	        --label = "button",
	        onEvent = buttonEventSkin4,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "roundedRect",
	        width = 74,
	        height = 74,
	        cornerRadius = 10,
	        fillColor = { default={0,0,0,0.1}, over={0,0,0,0} }
	    }
	)
	slotSkin4.x = 420
	slotSkin4.y = 420
	screenGroup:insert(slotSkin4)

	local slotSkin5 = widget.newButton(
	    {
	        --label = "button",
	        onEvent = buttonEventSkin5,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "roundedRect",
	        width = 74,
	        height = 74,
	        cornerRadius = 10,
	        fillColor = { default={0,0,0,0.1}, over={0,0,0,0} }
	    }
	)
	slotSkin5.x = 510
	slotSkin5.y = 420
	screenGroup:insert(slotSkin5)

	local slotSkin6 = widget.newButton(
	    {
	        --label = "button",
	        onEvent = buttonEventSkin6,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "roundedRect",
	        width = 74,
	        height = 74,
	        cornerRadius = 10,
	        fillColor = { default={0,0,0,0.1}, over={0,0,0,0} }
	    }
	)
	slotSkin6.x = 600
	slotSkin6.y = 420
	screenGroup:insert(slotSkin6)

	local slotSkin7 = widget.newButton(
	    {
	        --label = "button",
	        onEvent = buttonEventSkin7,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "roundedRect",
	        width = 74,
	        height = 74,
	        cornerRadius = 10,
	        fillColor = { default={0,0,0,0.1}, over={0,0,0,0} }
	    }
	)
	slotSkin7.x = 690
	slotSkin7.y = 420
	screenGroup:insert(slotSkin7)

	local slotSkin8 = widget.newButton(
	    {
	        --label = "button",
	        onEvent = buttonEventSkin8,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "roundedRect",
	        width = 74,
	        height = 74,
	        cornerRadius = 10,
	        fillColor = { default={0,0,0,0.1}, over={0,0,0,0} }
	    }
	)
	slotSkin8.x = 780
	slotSkin8.y = 420
	screenGroup:insert(slotSkin8)

	local slotSkin9 = widget.newButton(
	    {
	        --label = "button",
	        onEvent = buttonEventSkin9,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "roundedRect",
	        width = 74,
	        height = 74,
	        cornerRadius = 10,
	        fillColor = { default={0,0,0,0.1}, over={0,0,0,0} }
	    }
	)
	slotSkin9.x = 870
	slotSkin9.y = 420
	screenGroup:insert(slotSkin9)

	local slotSkin10 = widget.newButton(
	    {
	        --label = "button",
	        onEvent = buttonEventSkin10,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "roundedRect",
	        width = 74,
	        height = 74,
	        cornerRadius = 10,
	        fillColor = { default={0,0,0,0.1}, over={0,0,0,0} }
	    }
	)
	slotSkin10.x = 150
	slotSkin10.y = 520
	screenGroup:insert(slotSkin10)

	local slotSkin11 = widget.newButton(
	    {
	        --label = "button",
	        onEvent = buttonEventSkin11,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "roundedRect",
	        width = 74,
	        height = 74,
	        cornerRadius = 10,
	        fillColor = { default={0,0,0,0.1}, over={0,0,0,0} }
	    }
	)
	slotSkin11.x = 240
	slotSkin11.y = 520
	screenGroup:insert(slotSkin11)

	------------------------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------------------------

	-- This will declare the start button 
	local startButton

	-- This is what will run when we press our button
	local startButtonEvent = function (event )
	    if (event.phase == "ended") then
	        start(background, startButton, screenGroup, chosenClass, chosenSkin, skinGroup)
	    end
	end

	-- This will create the start button previously declared
	startButton=widget.newButton{

	        -- The id can be used to tell you what button was pressed in your button event
		id = "startButton",
	        -- This is the text label to put on the button
		label = "Start",
	        -- This sets the color of the text
		labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
			-- This loads the font file
		font = "images/other/rpg.ttf",
			-- This sets the font size
		fontSize = 56,
	        -- Emboss can be true or false, tells it to make the label look embossed/inset
		emboss = true,
	        -- The border around the outside of the button
		strokeWidth = 4,
	        -- How round to make the corners
		cornerRadius = 8,
			-- This tells it what function to call when you press the button
	    onEvent = startButtonEvent
	}

	startButton.x = display.contentCenterX, logo.contentCenterX
	startButton.y = 600

	screenGroup:insert(startButton)

end

--local background = display.newImage("images/hipster_hexagon_blur_pattern-1145.jpg")
local background = display.newImage("images/other/grey.png")
background.x = display.contentCenterX, background.contentCenterX
background.y = display.contentCenterY, background.contentCenterY 
background.width = 1024
background.height = 768

--local logo = display.newImage("images/coronalabs_logo@2x.png")
local logo = display.newText( "Project High Guard", 200, 100, "images/other/RPGSystem.ttf", 46 )
logo.x = display.contentCenterX, logo.contentCenterX
logo.y = 100

-- This will declare the start button 
local playButton

-- This is what will run when we press our button
local playButtonEvent = function (event )
    if (event.phase == "ended") then
        chosenClass = setPreparationScreen(logo, playButton, background)
    end
end

-- This will create the start button previously declared
playButton=widget.newButton{

        -- The id can be used to tell you what button was pressed in your button event
	id = "playButton",
        -- This is the text label to put on the button
	label = "Play",
		-- This sets the color of the text
	labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
		-- This loads the font file
	font = "images/other/rpg.ttf",
		-- This sets the font size
	fontSize = 56,
        -- Emboss can be true or false, tells it to make the label look embossed/inset
	emboss = true,
        -- The border around the outside of the button
	strokeWidth = 4,
        -- How round to make the corners
	cornerRadius = 8,
		-- This tells it what function to call when you press the button
    onEvent = playButtonEvent
}

playButton.x = display.contentCenterX, logo.contentCenterX
playButton.y = 600
