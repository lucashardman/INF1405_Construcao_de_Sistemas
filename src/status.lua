local widget = require( "widget" )

local M = {}

local HP
local maxHP
local SP
local maxSP
local speed
local baseSpeed
local atk
local def
local experience
local level

local barHP = display.newRoundedRect( 0, 0, 150, 50, 3 )

local barSP = display.newRoundedRect( 0, 0, 150, 50, 3 )

local barExp = display.newRoundedRect( 0, 0, 150, 50, 3 )

local barWidth = 220

function statusWindow (hero)

	local headerSizeX = 350
	local headerSizeY = 20
	local headerX = 0 + headerSizeX/2
	local headerY = 0 + headerSizeY/2
	local header = display.newRect( headerX, headerY, headerSizeX, headerSizeY )
	local headerColor = {87/255, 120/255, 219/255}

	header.fill = headerColor
	header.x = headerX
	header.y = headerY
	header.width = headerSizeX
	header.hight = headerSizeY

	local windowGroup = display.newGroup()

	local windowSizeX = 350
	local windowSizeY = 150
	local windowX = headerX - headerSizeX/2 + windowSizeX/2
	local windowY = 0 + windowSizeY/2 + headerSizeY
	local window = display.newRect( windowX, windowY, windowSizeX, windowSizeY )
	windowGroup:insert(window)

	local backgroundBarHP = display.newRoundedRect( 0, 0, 150, 50, 3 )
	backgroundBarHP.x = 220 ; backgroundBarHP.y = 37
	local colorBarHP = {217/255, 217/255, 217/255}
	backgroundBarHP.fill = colorBarHP
	backgroundBarHP.height = 15
	backgroundBarHP.width = barWidth
	windowGroup:insert(backgroundBarHP)
	
	local backgroundBarSP = display.newRoundedRect( 0, 0, 150, 50, 3 )
	backgroundBarSP.x = 220 ; backgroundBarSP.y = 57
	local colorBarSP = {217/255, 217/255, 217/255}
	backgroundBarSP.fill = colorBarSP
	backgroundBarSP.height = 15
	backgroundBarSP.width = barWidth
	windowGroup:insert(backgroundBarSP)

	local backgroundBarExp = display.newRoundedRect( 0, 0, 150, 50, 3 )
	backgroundBarExp.x = 220 ; backgroundBarExp.y = 77
	local colorBarExp = {217/255, 217/255, 217/255}
	backgroundBarExp.fill = colorBarSP
	backgroundBarExp.height = 15
	backgroundBarExp.width = barWidth
	windowGroup:insert(backgroundBarExp)

	windowGroup:insert(barHP)
	windowGroup:insert(barSP)
	windowGroup:insert(barExp)

	HP = display.newText("HP ", 0, 0, native.systemFont, 12 )
	HP.x = 20 ; HP.y = 35
	HP:setFillColor( 0, 0, 0 )
	HP.anchorX = 0
	windowGroup:insert(HP)

	SP = display.newText("SP ", 0, 0, native.systemFont, 12 )
	SP.x = 20 ; SP.y = 57
	SP:setFillColor( 0, 0, 0 )
	SP.anchorX = 0
	windowGroup:insert(SP)

	atk = display.newText("atk ", 0, 0, native.systemFont, 12 )
	atk.x = 95 ; atk.y = 150
	atk:setFillColor( 0, 0, 0 )
	atk.anchorX = 0
	windowGroup:insert(atk)

	separator = display.newText("X", 0, 0, native.systemFont, 12 )
	separator.x = 165 ; separator.y = 150
	separator:setFillColor( 0, 0, 0 )
	separator.anchorX = 0
	windowGroup:insert(separator)

	def = display.newText("def ", 0, 0, native.systemFont, 12 )
	def.x = 185 ; def.y = 150
	def:setFillColor( 0, 0, 0 )
	def.anchorX = 0
	windowGroup:insert(def)

	experience = display.newText("Exp ", 0, 0, native.systemFont, 12 )
	experience.x = 20 ; experience.y = 77
	experience:setFillColor( 0, 0, 0 )
	experience.anchorX = 0
	windowGroup:insert(experience)

	level = display.newText("Level ", 0, 0, native.systemFont, 30 )
	level.x = 20 ; level.y =120
	level:setFillColor( 0, 0, 0 )
	level.anchorX = 0
	windowGroup:insert(level)

	windowGroupFlag = true

	local function minimizeButtonEvent( event )
	 
	    if ( "ended" == event.phase ) then
	        if (windowGroupFlag == true) then
	        	windowGroup.isVisible = false
	        	windowGroupFlag = false
	        elseif (windowGroupFlag == false) then
	        	windowGroup.isVisible = true
	        	windowGroupFlag = true
	        end
	    end
	end
	 
	-- Create the widget
	local minimizeButton = widget.newButton(
	    {
		label = "-",
		labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0 } },
        onEvent = minimizeButtonEvent,
        emboss = false,
        shape = "roundedRect",
        width = 20,
        height = 20,
        cornerRadius = 2,
        fillColor = { default={0,0,0,0}, over={0,0,0,0} },

	    }
	)
	minimizeButton.x = 335
	minimizeButton.y = 10

end

function update(hero, expForNextLevel)

	expForNextLevel = hero.expForNextLevel
	HP.text = "HP "..hero.HP.."/"..hero.maxHP
	SP.text = "SP "..hero.SP.."/"..hero.maxSP
	atk.text = "Attack "..hero.atk
	experience.text = "Exp "..hero.experience.."/"..expForNextLevel
	level.text = "Lv. "..hero.level
	def.text = "Defence "..hero.def

	local percentageHP = hero.HP/hero.maxHP
	local percentageSP = hero.SP/hero.maxSP
	local percentageExp = hero.experience/expForNextLevel

	local colorBarHP = {0/255, 230/255, 0/255}
	barHP.height = 15
	barHP.width = 220
	barHP.fill = colorBarHP
	barHP.width = percentageHP * barWidth
	barHP.x = barWidth/2 + barHP.width/2 ; barHP.y = 37

	local colorBarSP = {26/255, 117/255, 255/255}
	barSP.height = 15
	barSP.width = 220
	barSP.fill = colorBarSP
	barSP.width = percentageSP * barWidth
	barSP.x = barWidth/2 + barSP.width/2 ; barSP.y = 57

	local colorBarExp = {255/255, 178/255, 0/255}
	barExp.height = 15
	barExp.width = 220
	barExp.fill = colorBarExp
	barExp.width = percentageExp * barWidth
	barExp.x = barWidth/2 + barExp.width/2 ; barExp.y = 77

end


local function updateLevel(hero)
	if hero.experience >= hero.expForNextLevel and hero.level == 1 then
		hero.level = hero.level + 1
		hero.experience = 0
		hero.expForNextLevel = 100

		hero.HP = 200
		hero.maxHP = 200
		hero.SP = 100
		hero.maxSP = 100
		hero.atk = 4
		hero.def = 4

	elseif hero.experience >= hero.expForNextLevel and hero.level == 2 then
		hero.level = hero.level + 1
		hero.experience = 0
		hero.expForNextLevel = 200

		hero.HP = 300
		hero.maxHP = 300
		hero.SP = 100
		hero.maxSP = 100
		hero.atk = 4
		hero.def = 4

	elseif hero.experience >= hero.expForNextLevel and hero.level == 3 then
		hero.level = hero.level + 1
		hero.experience = 0
		hero.expForNextLevel = 300

		hero.HP = 200
		hero.maxHP = 200
		hero.SP = 100
		hero.maxSP = 100
		hero.atk = 4
		hero.def = 4

	elseif hero.experience >= hero.expForNextLevel and hero.level == 4 then
		hero.level = hero.level + 1
		hero.experience = 0
		hero.expForNextLevel = 400

		hero.HP = 200
		hero.maxHP = 200
		hero.SP = 100
		hero.maxSP = 100
		hero.atk = 4
		hero.def = 4

	elseif hero.experience >= hero.expForNextLevel and hero.level == 5 then
		hero.level = hero.level + 1
		hero.experience = 0
		hero.expForNextLevel = 500

		hero.HP = 200
		hero.maxHP = 200
		hero.SP = 100
		hero.maxSP = 100
		hero.atk = 4
		hero.def = 4

	elseif hero.experience >= hero.expForNextLevel and hero.level == 6 then
		hero.level = hero.level + 1
		hero.experience = 0
		hero.expForNextLevel = 600

		hero.HP = 200
		hero.maxHP = 200
		hero.SP = 100
		hero.maxSP = 100
		hero.atk = 4
		hero.def = 4

	elseif hero.experience >= hero.expForNextLevel and hero.level == 7 then
		hero.level = hero.level + 1
		hero.experience = 0
		hero.expForNextLevel = 700

		hero.HP = 200
		hero.maxHP = 200
		hero.SP = 100
		hero.maxSP = 100
		hero.atk = 4
		hero.def = 4

	elseif hero.experience >= hero.expForNextLevel and hero.level == 8 then
		hero.level = hero.level + 1
		hero.experience = 0
		hero.expForNextLevel = 800

		hero.HP = 200
		hero.maxHP = 200
		hero.SP = 100
		hero.maxSP = 100
		hero.atk = 4
		hero.def = 4

	elseif hero.experience >= hero.expForNextLevel and hero.level == 9 then
		hero.level = hero.level + 1 -- Max level 9 + 1 = 10
	end
	return hero
end

M.statusWindow = statusWindow
M.update = update
M.updateLevel = updateLevel

return M