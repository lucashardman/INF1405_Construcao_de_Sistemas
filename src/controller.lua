local tiled = require "com.ponywolf.ponytiled"
local physics = require "physics"
local json = require "json"
local character = require "character"
local item = require "items"
local status = require "status"
local enemies = require "enemies"
local collisionHandler = require "collisionHandler"
local combat = require "combat"

local M = {}

local function drawMap ()
	-- Load a "pixel perfect" map and elements from a JSON file exported (tilemap.json) by Tiled (http://www.mapeditor.org)
	display.setDefault("magTextureFilter", "nearest")
	display.setDefault("minTextureFilter", "nearest")
	local mapData = json.decodeFile(system.pathForFile("images/tiled/tilemap.json", system.ResourceDirectory))  -- load from json export
	local map = tiled.new(mapData, "images/tiled") -- render map using ponywolf

	-- center the map on screen
	map.x,map.y = display.contentCenterX - map.designedWidth/2 + 16, display.contentCenterY - map.designedHeight/2

	return map
end

local function gameController( sheet_hero )
	
	-- Initiate physics
	physics.start()
	physics.setGravity( 0, 0 ) -- Use no gravity, because Corona doesn't work with Z direction
	
	-- Map is a json file rendered by ponywolf
	local map = drawMap()

	-- Hero is a group of sprite sheets
	-- hero[1] means walk right
	-- hero[2] means walk left
	-- hero[3] means walk up
	-- hero[4] means walk down

	local hero = character.initializeChar(sheet_hero)
	hero.myName = "hero"

	hero.speed = 2 -- Current speed.
	hero.baseSpeed = 2 -- Normal speed. Used to fix a bug that happens when speed is updated.
	hero.HP = 100
	hero.maxHP = 100
	hero.SP = 50
	hero.maxSP = 50
	hero.atk = 3
	hero.def = 3
	hero.experience = 0
	hero.level = 1

	physics.addBody( hero, "dynamic", { density=3.0, friction=1, bounce=0.3 } )
	hero.isFixedRotation = true

	-- Adding borders to the map
	local borderRight = map:findObject("borderRight")
	borderRight.myName = "borderRight"
	borderRight.myType = "border"
	local borderLeft = map:findObject("borderLeft")
	borderLeft.myName = "borderLeft"
	borderLeft.myType = "border"
	local borderUp = map:findObject("borderUp")
	borderUp.myName = "borderUp"
	borderUp.myType = "border"
	local borderDown = map:findObject("borderDown")
	borderDown.myName = "borderDown"
	borderDown.myType = "border"

	physics.addBody( borderRight, "static", { density=3.0, friction=0.5, bounce=0 } )
	physics.addBody( borderLeft, "static", { density=3.0, friction=0.5, bounce=0 } )
	physics.addBody( borderUp, "static", { density=3.0, friction=0.5, bounce=0 } )
	physics.addBody( borderDown, "static", { density=3.0, friction=0.5, bounce=0 } )

	-- Adding Trees
	local arvore1 = map:findObject("arvore1")
	arvore1.myName = "arvore1"
	arvore1.myType = "scenario"
	physics.addBody( arvore1, "static", { density=3.0, friction=0.5, bounce=0 } )
	local arvore2 = map:findObject("arvore2")
	arvore2.myName = "arvore2"
	arvore2.myType = "scenario"
	physics.addBody( arvore2, "static", { density=3.0, friction=0.5, bounce=0 } )
	local arvore3 = map:findObject("arvore3")
	arvore3.myName = "arvore3"
	arvore3.myType = "scenario"
	physics.addBody( arvore3, "static", { density=3.0, friction=0.5, bounce=0 } )


	-- Place enemies on maps
	local enemiesGroup = display.newGroup()
	local fulano1 = enemies.generateEnemies("lopunny", 1, 350, 300, 1.5)
	enemiesGroup:insert(fulano1)
	local fulano2 = enemies.generateEnemies("lopunny", 1, 300, 300, 1.5)
	enemiesGroup:insert(fulano2)
	local fulano3 = enemies.generateEnemies("lopunny", 1, 550, 100, 1.5)
	enemiesGroup:insert(fulano3)
	local fulano4 = enemies.generateEnemies("lopunny", 1, 30, 700, 1.5)
	enemiesGroup:insert(fulano4)

	-- Add enemies to physics and add HPbar
	for count = 1, enemiesGroup.numChildren do

		-- Physics
		physics.addBody(enemiesGroup[count])
		enemiesGroup[count].isFixedRotation = true

		-- HP bar
		local enemyBar = combat.initializeHPbar();
		local function updateEnemyHPbar()
			enemyBar = combat.HPbar(enemiesGroup[count], enemyBar)
		end
		Runtime:addEventListener("enterFrame", updateEnemyHPbar)
	end
	print (enemiesGroup[1].myType.." HP: "..enemiesGroup[1].HP.." ATK: "..enemiesGroup[1].atk.." DEF: "..enemiesGroup[1].def)

	-- Create and respaw all items
	local respawItems = item.generateItem()

	-- Add items to physics
	for count = 1, respawItems.numChildren do
		physics.addBody(respawItems[count])
	end

	-- Enables hero to pick up items
	character = collisionHandler.handler(hero, character)
	hero:addEventListener( "collision" )

	-- Update level
	local expForNextLevel = 50

	local function updateLevel()
		if hero.experience >= expForNextLevel and hero.level == 1 then
			hero.level = hero.level + 1
			hero.experience = 0
			expForNextLevel = 100
		elseif hero.experience >= expForNextLevel and hero.level == 2 then
			hero.level = hero.level + 1
			hero.experience = 0
			expForNextLevel = 200
		elseif hero.experience >= expForNextLevel and hero.level == 3 then
			hero.level = hero.level + 1
			hero.experience = 0
			expForNextLevel = 300
		elseif hero.experience >= expForNextLevel and hero.level == 4 then
			hero.level = hero.level + 1
			hero.experience = 0
			expForNextLevel = 400
		elseif hero.experience >= expForNextLevel and hero.level == 5 then
			hero.level = hero.level + 1
			hero.experience = 0
			expForNextLevel = 500
		elseif hero.experience >= expForNextLevel and hero.level == 6 then
			hero.level = hero.level + 1
			hero.experience = 0
			expForNextLevel = 600
		elseif hero.experience >= expForNextLevel and hero.level == 7 then
			hero.level = hero.level + 1
			hero.experience = 0
			expForNextLevel = 700
		elseif hero.experience >= expForNextLevel and hero.level == 8 then
			hero.level = hero.level + 1
			hero.experience = 0
			expForNextLevel = 800
		elseif hero.experience >= expForNextLevel and hero.level == 9 then
			hero.level = hero.level + 1 -- Max level 9 + 1 = 10
		end
	end

	local function heroAttack (event)
		for i=1, enemiesGroup.numChildren do
			if (enemiesGroup[i].onCombat == true) then
				if (event.keyName == "space" and event.phase == "down") then
					enemies.pauseWalk(true)
					enemiesGroup[i] = combat.body2bodyAttack(hero, enemiesGroup[i])
					if enemiesGroup[i].HP == 0 then
						hero.experience = hero.experience + enemiesGroup[i].experience
						combat.explosionEffect(enemiesGroup[i])
						print ("Morreu :/")
						enemiesGroup[i].x = 0
						enemiesGroup[i].y = 0
						enemiesGroup[i].alive = false
						enemiesGroup[i].isVisible = false
						physics.removeBody(enemiesGroup[i])
					end
				elseif (event.keyName == "space" and event.phase == "up") then
					enemies.pauseWalk(false)
				end
			end
		end
		updateLevel()

		--print ("Level: "..hero.level.." Exp: "..hero.experience)
	end
	Runtime:addEventListener("key", heroAttack)

	-- Creates status window
	status.statusWindow(hero)
	
	-- Updates status window (HP, SP, atk, def, exp ...)
	local function updateStatusWindow( event )
		status.update(hero, expForNextLevel)
	end
	Runtime:addEventListener( "enterFrame", updateStatusWindow )

end

M.gameController = gameController

return M