local tiled = require "com.ponywolf.ponytiled"
local physics = require "physics"
local json = require "json"
local character = require "character"

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
	physics.addBody( hero, "dynamic", { density=3.0, friction=0.5, bounce=0.3 } )
	hero.isFixedRotation = true

	-- Adding borders to the map
	local borderRight = map:findObject("borderRight")
	local borderLeft = map:findObject("borderLeft")
	local borderUp = map:findObject("borderUp")
	local borderDown = map:findObject("borderDown")
	
	physics.addBody( borderRight, "static", { density=3.0, friction=0.5, bounce=0.3 } )
	physics.addBody( borderLeft, "static", { density=3.0, friction=0.5, bounce=0.3 } )
	physics.addBody( borderUp, "static", { density=3.0, friction=0.5, bounce=0.3 } )
	physics.addBody( borderDown, "static", { density=3.0, friction=0.5, bounce=0.3 } )

	-- Adding Trees
	local arvore1 = map:findObject("arvore1")
	physics.addBody( arvore1, "static", { density=3.0, friction=0.5, bounce=0.3 } )
	local arvore2 = map:findObject("arvore2")
	physics.addBody( arvore2, "static", { density=3.0, friction=0.5, bounce=0.3 } )
	local arvore3 = map:findObject("arvore3")
	physics.addBody( arvore3, "static", { density=3.0, friction=0.5, bounce=0.3 } )
end

M.gameController = gameController

return M