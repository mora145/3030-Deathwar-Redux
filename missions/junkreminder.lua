-- Junk reminder Mission
-- Created: 3rd Dec, 2014
-- Written by: Matt

-- ========================================================
-- THE USUAL FUNCTIONS
-- ========================================================

function prototype()

	haggleExtra=1000
	if (math.random(3)==1) then haggleExtra = haggleExtra + 50 end
	if (math.random(3)==1) then haggleExtra = haggleExtra + 50 end
	if (math.random(5)==1) then haggleExtra = haggleExtra + 500 end
	if (math.random(3)==1) then haggleExtra = haggleExtra + 200 end
	if (math.random(3)==1) then haggleExtra = haggleExtra + 100 end
	if (math.random(10)==1) then haggleExtra = haggleExtra + 1000 end
	if (math.random(20)==1) then haggleExtra = haggleExtra + 1000 end
	if (math.random(30)==1) then haggleExtra = haggleExtra + 1000 end

		
	if math.random(0,1)==1 then
		local tractor={}
		tractor[1]="¿Tienes tiempo libre?"
		tractor[2]="¿Quieres explorar tu propio sistema?"
		tractor[3]="¿Te gusta disparar? ¿Odias la basura?"
		tractor[4]="¿Quieres ayudar a limpiar tu propio sistema por buen dinero?"
		bigDesc=bigDesc.." "..tractor[math.random(table.getn(tractor))]
	end
		
	local t3={}
	t3[1]="Si quieres ganar dinero rápido, entonces dispara a cualquier basura espacial que veas."
	t3[2]="Tómese el tiempo para buscar chatarra alrededor del sistema y obtener pequeñas recompensas."
	smallDesc=t3[math.random(table.getn(t3))]
		
	local t4={}
	t4[1]="No hay necesidad de aceptar esta misión, siempre y cuando tengas un historial criminal limpio, con cada pedazo de chatarra que le dispares obtendrás 250$!"
	bigDesc=bigDesc.." "..t4[1]
		
	local t5={}
	t5[1]=" [br] [br] ¿Estás listo para la aventura?"
	t5[2]=" [br] [br] Salga, comandante."
	bigDesc=bigDesc.." "..t5[math.random(table.getn(t5))]		

	return 1
end


function canTakeMission() -- check to see if you can take this mission
	return ""
end


function takeMission() -- upon taking the mission set up things, like:
end


function update() -- update mission critical things here
	return 1 -- not complete yet
end

function finishSuccess() -- clear up stuff here
	cleanUp()
end

function finishFailure() -- clear up stuff here
	cleanUp()
end

 -- ====================================================== CLEAN UP
function cleanUp()
end
 -- ====================================================== CLEAN UP

function cancel()
end

function canCancel()
	-- can always cancel a cargo mission
	return ""
end

function returnSmallDesc()
	return smallDesc
end

function returnBigDesc()
	return bigDesc
end

function getContact()
	return advertPerson
end

function getPrize()
	return prize
end

function getHaggleExtra()
	return haggleExtra
end

function activateHaggleExtra()
	prize = prize + haggleExtra
end

function loseHaggle()
	prize = prize - ( haggleExtra / 10 )
end

function getDropOff()
	return ""
end

function getDestination()
	return "Este sistema"
end

function returnImageFile()
	return "data/images/hud/missions/junk.png"
end

-- ========================================================
-- MAIN!
-- ========================================================

contactPerson = "Información del sistema"
advertPerson = "Droide de servicio automatizado"
packageName = ""
prize = 0
haggleExtra = 0
smallDesc = ""
bigDesc = ""
dropOffSystem = ""
dropOffStation = ""

dangerous = 0

pickupStation = ""
pickupSystem = ""

distanceToTarget = 0
reputation_required = 0.0
deviceName = ""

--print("LUA -> contact Person: "..contactPerson)
--print("LUA -> advert Person: "..advertPerson)
--print("LUA -> Main run OK.")

