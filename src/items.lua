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
	

	-- Choosing frame from the png file

	local framePocaoVerdeGrande = {
	    -- consecutive frames sequence
	    {
	        name = "Poção Verde Grande",
	        frames = { 69 }
	    }
	}

	for count = 1, 3 do
	
		local pocaoVerdeGrande = display.newSprite(sheetPotions, framePocaoVerdeGrande)
		pocaoVerdeGrande.isVisible = true
		pocaoVerdeGrande.myName = "pocaoVerdeGrande"
		pocaoVerdeGrande.effect = 60 -- Recover 60 HP
		pocaoVerdeGrande.x = math.random(0 + pocaoVerdeGrande.width/2, 1024 - pocaoVerdeGrande.width/2 )
		pocaoVerdeGrande.y = math.random(0 + pocaoVerdeGrande.height/2, 768 - pocaoVerdeGrande.height/2 )
		itemsGroup:insert(pocaoVerdeGrande)
	end

	local framePocaoVerdeMedia = {
	    -- consecutive frames sequence
	    {
	        name = "Poção Verde Media",
	        frames = { 85 }
	    }
	}

	for count = 1, 3 do
	
		local pocaoVerdeMedia = display.newSprite(sheetPotions, framePocaoVerdeMedia)
		pocaoVerdeMedia.isVisible = true
		pocaoVerdeMedia.myName = "pocaoVerdeMedia"
		pocaoVerdeMedia.effect = 40 -- Recover 40 HP
		pocaoVerdeMedia.x = math.random(0 + pocaoVerdeMedia.width/2, 1024 - pocaoVerdeMedia.width/2 )
		pocaoVerdeMedia.y = math.random(0 + pocaoVerdeMedia.height/2, 768 - pocaoVerdeMedia.height/2 )
		itemsGroup:insert(pocaoVerdeMedia)
	end

	local framePocaoVerdePequena = {
	    -- consecutive frames sequence
	    {
	        name = "Poção Verde Pequena",
	        frames = { 21 }
	    }
	}

	for count = 1, 3 do
	
		local pocaoVerdePequena = display.newSprite(sheetPotions, framePocaoVerdePequena)
		pocaoVerdePequena.isVisible = true
		pocaoVerdePequena.myName = "pocaoVerdePequena"
		pocaoVerdePequena.effect = 20 -- Recover 20 HP
		pocaoVerdePequena.x = math.random(0 + pocaoVerdePequena.width/2, 1024 - pocaoVerdePequena.width/2 )
		pocaoVerdePequena.y = math.random(0 + pocaoVerdePequena.height/2, 768 - pocaoVerdePequena.height/2 )
		itemsGroup:insert(pocaoVerdePequena)
	end

	local framePocaoRosa = {
	    -- consecutive frames sequence
	    {
	        name = "Poção Rosa",
	        frames = { 173 }
	    }
	}

	for count = 1, 3 do
	
		local pocaoRosa = display.newSprite(sheetPotions, framePocaoRosa)
		pocaoRosa.isVisible = true
		pocaoRosa.myName = "pocaoRosa"
		pocaoRosa.effect = 2 -- Double walk speed
		pocaoRosa.time = 30 -- Last 30 seconds
		pocaoRosa.x = math.random(0 + pocaoRosa.width/2, 1024 - pocaoRosa.width/2 )
		pocaoRosa.y = math.random(0 + pocaoRosa.height/2, 768 - pocaoRosa.height/2 )
		itemsGroup:insert(pocaoRosa)
	end

	local framePocaoRosaGrande = {
	    -- consecutive frames sequence
	    {
	        name = "Poção Rosa Grande",
	        frames = { 237 }
	    }
	}

	for count = 1, 3 do
	
		local pocaoRosaGrande = display.newSprite(sheetPotions, framePocaoRosaGrande)
		pocaoRosaGrande.isVisible = true
		pocaoRosaGrande.myName = "pocaoRosaGrande"
		pocaoRosaGrande.effect = 3 -- Triple walk speed
		pocaoRosaGrande.time = 30 -- Last 30 seconds
		pocaoRosaGrande.x = math.random(0 + pocaoRosaGrande.width/2, 1024 - pocaoRosaGrande.width/2 )
		pocaoRosaGrande.y = math.random(0 + pocaoRosaGrande.height/2, 768 - pocaoRosaGrande.height/2 )
		itemsGroup:insert(pocaoRosaGrande)
	end

	local framePocaoRosaExtendida = {
	    -- consecutive frames sequence
	    {
	        name = "Poção Rosa Extendida",
	        frames = { 189 }
	    }
	}

	for count = 1, 3 do
	
		local pocaoRosaExtendida = display.newSprite(sheetPotions, framePocaoRosaExtendida)
		pocaoRosaExtendida.isVisible = true
		pocaoRosaExtendida.myName = "pocaoRosaExtendida"
		pocaoRosaExtendida.effect = 2 -- Double walk speed
		pocaoRosaExtendida.time = 60 -- Last 60 seconds
		pocaoRosaExtendida.x = math.random(0 + pocaoRosaExtendida.width/2, 1024 - pocaoRosaExtendida.width/2 )
		pocaoRosaExtendida.y = math.random(0 + pocaoRosaExtendida.height/2, 768 - pocaoRosaExtendida.height/2 )
		itemsGroup:insert(pocaoRosaExtendida)
	end

	local framePocaoAzulGrande = {
	    -- consecutive frames sequence
	    {
	        name = "Poção Azul Grande",
	        frames = { 72 }
	    }
	}

	for count = 1, 3 do
	
		local pocaoAzulGrande = display.newSprite(sheetPotions, framePocaoAzulGrande)
		pocaoAzulGrande.isVisible = true
		pocaoAzulGrande.myName = "pocaoAzulGrande"
		pocaoAzulGrande.effect = 30 -- Recover 30 SP
		pocaoAzulGrande.x = math.random(0 + pocaoAzulGrande.width/2, 1024 - pocaoAzulGrande.width/2 )
		pocaoAzulGrande.y = math.random(0 + pocaoAzulGrande.height/2, 768 - pocaoAzulGrande.height/2 )
		itemsGroup:insert(pocaoAzulGrande)
	end

	local framePocaoAzulMedia = {
	    -- consecutive frames sequence
	    {
	        name = "Poção Azul Media",
	        frames = { 88 }
	    }
	}

	for count = 1, 3 do
	
		local pocaoAzulMedia = display.newSprite(sheetPotions, framePocaoAzulMedia)
		pocaoAzulMedia.isVisible = true
		pocaoAzulMedia.myName = "pocaoAzulMedia"
		pocaoAzulMedia.effect = 20 -- -- Recover 20 SP
		pocaoAzulMedia.x = math.random(0 + pocaoAzulMedia.width/2, 1024 - pocaoAzulMedia.width/2 )
		pocaoAzulMedia.y = math.random(0 + pocaoAzulMedia.height/2, 768 - pocaoAzulMedia.height/2 )
		itemsGroup:insert(pocaoAzulMedia)
	end

	local framePocaoAzulPequena = {
	    -- consecutive frames sequence
	    {
	        name = "Poção Azul Pequena",
	        frames = { 24 }
	    }
	}

	for count = 1, 3 do
	
		local pocaoAzulPequena = display.newSprite(sheetPotions, framePocaoAzulPequena)
		pocaoAzulPequena.isVisible = true
		pocaoAzulPequena.myName = "pocaoAzulPequena"
		pocaoAzulPequena.effect = 10 -- Recover 10 SP
		pocaoAzulPequena.x = math.random(0 + pocaoAzulPequena.width/2, 1024 - pocaoAzulPequena.width/2 )
		pocaoAzulPequena.y = math.random(0 + pocaoAzulPequena.height/2, 768 - pocaoAzulPequena.height/2 )
		itemsGroup:insert(pocaoAzulPequena)
	end

	local framePocaoAmarela = {
	    -- consecutive frames sequence
	    {
	        name = "Poção Amarela",
	        frames = { 228 }
	    }
	}

	for count = 1, 3 do
	
		local pocaoAmarela = display.newSprite(sheetPotions, framePocaoAmarela)
		pocaoAmarela.isVisible = true
		pocaoAmarela.myName = "pocaoAmarela"
		pocaoAmarela.effect = 2 -- Double atack
		pocaoAmarela.time = 30 -- Last 30 seconds
		pocaoAmarela.x = math.random(0 + pocaoAmarela.width/2, 1024 - pocaoAmarela.width/2 )
		pocaoAmarela.y = math.random(0 + pocaoAmarela.height/2, 768 - pocaoAmarela.height/2 )
		itemsGroup:insert(pocaoAmarela)
	end

	local framePocaoVermelha = {
	    -- consecutive frames sequence
	    {
	        name = "Poção Vermelha",
	        frames = { 226 }
	    }
	}

	for count = 1, 3 do
	
		local pocaoVermelha = display.newSprite(sheetPotions, framePocaoVermelha)
		pocaoVermelha.isVisible = true
		pocaoVermelha.myName = "pocaoVermelha"
		pocaoVermelha.effect = 2 -- Double defense
		pocaoVermelha.time = 30 -- Last 30 seconds
		pocaoVermelha.x = math.random(0 + pocaoVermelha.width/2, 1024 - pocaoVermelha.width/2 )
		pocaoVermelha.y = math.random(0 + pocaoVermelha.height/2, 768 - pocaoVermelha.height/2 )
		itemsGroup:insert(pocaoVermelha)
	end

	return itemsGroup
end

function itemsPickUp(hero, character)

	hero.HP = 0 -- teste
	hero.SP = 0 -- teste

	hpFlag = 0 -- 0 if hp is incomplete, 1 if hp is full
	spFlag = 0 -- 0 if sp is incomplete, 1 if sp is full
	speedFlag = 0 -- 0 if poção rosa is unactive, 1 if poção rosa is active
	atkFlag = 0 -- 0 if poção amarela is unactive, 1 if poção amarela is active
	defFlag =0 -- 0 if poção vermelha is unactive, 1 if poção vermelha is active

	function onLocalCollision( self, event )
 
	    if ( event.phase == "began" ) then
	    	
	    	if ( event.other.myName == "pocaoVerdeGrande" and hpFlag == 0 ) then
	    		if ( hero.HP + event.other.effect >= hero.maxHP) then
	    			hero.HP = hero.maxHP
	    			hpFlag = 1
	    		else
	    			hero.HP = hero.HP + event.other.effect
	    			hpFlag = 0
	    		end
	    		event.other:removeSelf()
	    		print( "HP updated: " .. hero.HP )
	    	end

	    	if ( event.other.myName == "pocaoVerdeMedia" and hpFlag == 0 ) then
	    		if ( hero.HP + event.other.effect >= hero.maxHP) then
	    			hero.HP = hero.maxHP
	    			hpFlag = 1
	    		else
	    			hero.HP = hero.HP + event.other.effect
	    			hpFlag = 0
	    		end
	    		event.other:removeSelf()
	    		print( "HP updated: " .. hero.HP )
	    	end

	    	if ( event.other.myName == "pocaoVerdePequena" and hpFlag == 0 ) then
	    		if ( hero.HP + event.other.effect >= hero.maxHP) then
	    			hero.HP = hero.maxHP
	    			hpFlag = 1
	    		else
	    			hero.HP = hero.HP + event.other.effect
	    			hpFlag = 0
	    		end
	    		event.other:removeSelf()
	    		print( "HP updated: " .. hero.HP )
	    	end
	    	
	    	
	    	if ( event.other.myName == "pocaoRosa" and speedFlag == 0) then
	    		print ("baseSpeed: "..hero.baseSpeed.." speed: "..hero.speed)

	    		hero.speed = hero.speed * event.other.effect
	    		hero = character.characterController(hero, hero.speed)
	    		speedFlag = 1

	    		event.other:removeSelf()
	    		print( "Speed updated: " .. hero.speed )
	    		timer.performWithDelay(event.other.time * 1000, function()

            		hero.speed = hero.baseSpeed / event.other.effect
            		hero.baseSpeed = hero.baseSpeed / event.other.effect 
            		print("Speed updated: "..hero.speed)
	    			hero = character.characterController(hero, hero.speed )
	    			speedFlag = 0
                end, 1)
	    	end

	    	if ( event.other.myName == "pocaoRosaGrande" and speedFlag == 0) then
	    		print ("baseSpeed: "..hero.baseSpeed.." speed: "..hero.speed)

	    		hero.speed = hero.speed * event.other.effect
	    		hero = character.characterController(hero, hero.speed)
	    		speedFlag = 1
	    		
	    		event.other:removeSelf()
	    		print( "Speed updated: " .. hero.speed )
	    		timer.performWithDelay(event.other.time * 1000, function()

            		hero.speed = hero.baseSpeed / event.other.effect
            		hero.baseSpeed = hero.baseSpeed / event.other.effect 
            		print("Speed updated: "..hero.speed)
	    			hero = character.characterController(hero, hero.speed )
	    			speedFlag = 0
                end, 1)
	    	end

	    	if ( event.other.myName == "pocaoRosaExtendida" and speedFlag == 0) then
	    		print ("baseSpeed: "..hero.baseSpeed.." speed: "..hero.speed)
	    
	    		hero.speed = hero.speed * event.other.effect
	    		hero = character.characterController(hero, hero.speed)
	    		speedFlag = 1
	    		
	    		event.other:removeSelf()
	    		print( "Speed updated: " .. hero.speed )
	    		timer.performWithDelay(event.other.time * 1000, function()

            		hero.speed = hero.baseSpeed / event.other.effect
            		hero.baseSpeed = hero.baseSpeed / event.other.effect 
            		print("Speed updated"..hero.speed)
	    			hero = character.characterController(hero, hero.speed )
	    			speedFlag = 0
                end, 1)
	    	end

	    	if ( event.other.myName == "pocaoAzulGrande" and spFlag == 0 ) then
	    		if ( hero.SP + event.other.effect >= hero.maxSP) then
	    			hero.SP = hero.maxSP
	    			spFlag = 1
	    		else
	    			hero.SP = hero.SP + event.other.effect
	    			spFlag = 0
	    		end
	    		event.other:removeSelf()
	    		print( "SP updated: " .. hero.SP )
	    	end

	    	if ( event.other.myName == "pocaoAzulMedia" and spFlag == 0 ) then
	    		if ( hero.SP + event.other.effect >= hero.maxSP) then
	    			hero.SP = hero.maxSP
	    			spFlag = 1
	    		else
	    			hero.SP = hero.SP + event.other.effect
	    			spFlag = 0
	    		end
	    		event.other:removeSelf()
	    		print( "SP updated: " .. hero.SP )
	    	end

	    	if ( event.other.myName == "pocaoAzulPequena" and spFlag == 0 ) then
	    		if ( hero.SP + event.other.effect >= hero.maxSP) then
	    			hero.SP = hero.maxSP
	    			spFlag = 1
	    		else
	    			hero.SP = hero.SP + event.other.effect
	    			spFlag = 0
	    		end
	    		event.other:removeSelf()
	    		print( "SP updated: " .. hero.SP )
	    	end
			
	    	if ( event.other.myName == "pocaoAmarela" and atkFlag == 0 ) then

	    		hero.atk = hero.atk * event.other.effect
	    		event.other:removeSelf()
	    		print("Attack updated: " .. hero.atk)
	    		atkFlag = 1

	    		timer.performWithDelay(event.other.time * 1000, function()

            		hero.atk = hero.atk / event.other.effect
            		print("Atack updated: "..hero.atk)
            		atkFlag = 0
                end, 1)
	    	end

	    	if ( event.other.myName == "pocaoVermelha" and defFlag == 0 ) then
	
	    		hero.def = hero.def * event.other.effect
	    		event.other:removeSelf()
	    		print("Defence updated: " .. hero.def)
	    		defFlag = 1

	    		timer.performWithDelay(event.other.time * 1000, function()

            		hero.def = hero.def / event.other.effect
            		print("Defence updated: "..hero.def)
            		defFlag = 0
                end, 1)
	    	end

	        print( self.myName .. ": collision began with " .. event.other.myName )
	    elseif ( event.phase == "ended" ) then
	        print( self.myName .. ": collision ended with " .. event.other.myName )
		end
	end
	hero.collision = onLocalCollision
	--hero:addEventListener( "collision" )
	--heroAux = hero

	return character
end

function getHeroUpdate (heroAux)
	hero = heroAux
end

M.generateItem = generateItem
M.itemsPickUp = itemsPickUp
M.getHeroUpdate = getHeroUpdate

return M