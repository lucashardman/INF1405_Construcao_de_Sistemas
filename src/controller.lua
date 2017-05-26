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
	hero.atk = 30
	hero.def = 30

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
	local fulano = enemies.generateEnemies("lopunny", 1, 350, 300, 1.5)
	enemiesGroup:insert(fulano)

	-- Add enemies to physics
	for count = 1, enemiesGroup.numChildren do
		physics.addBody(enemiesGroup[count])
		enemiesGroup[count].isFixedRotation = true
	end
	enemiesGroup[1].atk = 50
	print (enemiesGroup[1].myType.." HP: "..enemiesGroup[1].HP.." ATK: "..enemiesGroup[1].atk.." DEF: "..enemiesGroup[1].def)

	-- Create and respaw all items
	local respawItems = item.generateItem()

	-- Add items to physics
	for count = 1, respawItems.numChildren do
		physics.addBody(respawItems[count])
	end

	-- Enables hero to pick up items
	--character = item.itemsPickUp(hero, character)
	character = collisionHandler.handler(hero, character)
	hero:addEventListener( "collision" )

	local function oi ()
		if (enemiesGroup[1].onCombat == true) then
			--print ("On combat!!!!!")
			--enemies.pauseWalk(enemiesGroup[1], true)

			hero = combat.basicAttack(enemiesGroup[1], hero, 2)
		end
	end	
	timer.performWithDelay( 2000, oi, -1)
	--Runtime:addEventListener("enterFrame", oi)

	-- Creates status window
	status.statusWindow(hero)
	
	-- Updates status window (HP, SP, atk, def, exp ...)
	local function updateStatusWindow( event )
		status.update(hero)
	end
	Runtime:addEventListener( "enterFrame", updateStatusWindow )

end

M.gameController = gameController

return M