
M =  {}

function handler(hero, character)

	hero.HP = 0 -- teste
	hero.SP = 0 -- teste

	hpFlag = 0 -- 0 if hp is incomplete, 1 if hp is full
	spFlag = 0 -- 0 if sp is incomplete, 1 if sp is full
	speedFlag = 0 -- 0 if poção rosa is unactive, 1 if poção rosa is active
	atkFlag = 0 -- 0 if poção amarela is unactive, 1 if poção amarela is active
	defFlag = 0 -- 0 if poção vermelha is unactive, 1 if poção vermelha is active

	function onLocalCollision( self, event )

 		-------------------------------------------------[[
		-- ITEMS                                         --
 		-------------------------------------------------]]

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

	    	-------------------------------------------------[[
			-- ENEMIES                                       --
 			-------------------------------------------------]]

 			if ( event.other.myType == "enemy" ) then

 				local function combatHandler ()
	 				if event.other.x - hero.x < 30 and event.other.y - hero.y < 30 and event.other.x - hero.x >= -30 and event.other.y - hero.y >= -30 then
	 					event.other.onCombat = true
	 				else
	 					event.other.onCombat = false
	 				end
 				end

				Runtime:addEventListener("enterFrame", combatHandler)

	    	end

	        print( self.myName .. ": collision began with " .. event.other.myName )
	    elseif ( event.phase == "ended" ) then
	        print( self.myName .. ": collision ended with " .. event.other.myName )
		end
	end
	hero.collision = onLocalCollision

	return character
end

M.handler = handler

return M