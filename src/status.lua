local M = {}

--local heroStatus
local myText

function statusWindow (hero)

	myText = display.newText( hero.HP, 0, 0, native.systemFont, 12 )
	myText.x = 50 ; myText.y = 50
	myText:setFillColor( 1, 1, 1 )
	myText.anchorX = 0

end

function update(hero)
	myText.text = hero.HP
end

M.statusWindow = statusWindow
M.update = update

return M