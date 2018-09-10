-- Salvage Mission
-- Created: 3rd Dec, 2014
-- Written by: Matt

-- ========================================================
-- THE USUAL FUNCTIONS
-- ========================================================

function prototype()

		
	if math.random(0,1)==1 then
		local tractor={}
		tractor[1]="¿Tienes sed de rescates?"
		tractor[2]="¿Quieres explorar tu propio sistema?"
		tractor[3]="¡El salvamento no se va a explorar solo!"
		tractor[4]="Sal y aprovecha las desgracias de los demás!"
		bigDesc=bigDesc.." "..tractor[math.random(table.getn(tractor))]
	end
		
	local t3={}
	t3[1]="Este es un recordatorio amistoso de que hay chatarra recuperable por ahí!"
	t3[2]="Tómese el tiempo para buscar misiones de salvamento en cada sistema y obtener grandes recompensas."
	t3[3]="La chatarra recuperable está ahí fuera!"
	t3[4]="¿Quieres cosas gratis?"
	t3[5]="Recordatorio: Hay chatarra recuperable disponible ahora mismo en su sistema."
	smallDesc=t3[math.random(table.getn(t3))]
		
	local t4={}
	t4[1]="Esto es sólo un recordatorio, revise el mapa de su sistema para ver si hay puntos grises. Son chatarra recuperable. Regresa para explorarla!"
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
	return "data/images/hud/missions/salvage.png"
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

