-- Cargo Mission v2. you don't have to bring it back to a person.
-- Created: 15th Nov, 2005
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
	if (getExperience()<10) then return 0 end

	dropOffSystem = getYourSystem()
	dropOffStation = getYourDockedStation()

	local dockedAt = getYourDockedStation()
	
	local ok=false
	local closeCount=10
	while closeCount>0 do
		pickupSystem=getRandomSystem()
		pickupStation=getRandomStation(pickupSystem)
		if ((getDistanceToStation(pickupStation)/124000.0) < 40) then
			if pickupStation ~= dockedAt then 
				ok=true
				break
			end
		end
		closeCount = closeCount - 1
	end
	while ok==false do
		pickupSystem=getRandomSystem()
		pickupStation=getRandomStation(pickupSystem)
		if ((getDistanceToStation(pickupStation)/124000.0) < 60) then
			if pickupStation ~= dockedAt then 
				ok=true 
			end
		end
	end
	
	if (math.random(5)==1) then
		dangerous=1
	end
	
	prize = 15
	prize = prize + (getDistanceToStation(pickupStation)/124000.0)*0.2
	if (dangerous==1) then
		prize = prize * (math.random(1.1,1.3))
	end
	prize = math.floor(prize)
	prize = prize * 1000
	
	priceBoost = 0
	if (math.random(10)==1) then
		priceBoost = 1
		prize = prize * 2
	end

	deviceName="container "..math.random(23,44646)

	-- GET PACKAGE NAME/TYPE
	local t={}
	t[1]="importante"
	t[2]="alta seguridad"
	t[3]="baja seguridad"
	t[4]="muy importante"
	t[5]="poco importante"
	t[6]="urgente"
	t[7]="asegurado"
	packageName=t[math.random(table.getn(t))]	
		
	local t2={}
	t2[1]="contenedor"
	t2[2]="maquina empaquetada"
	t2[3]="maquinaa"
	t2[4]="paquete propulsado"
	t2[5]="armario empaquetado"
	t2[6]="silla de campitan"
	t2[7]="maquinaria inusual"
	t2[8]="componente mecanico"
	t2[9]="paquete"
	t2[10]="presente"
	t2[11]="regalo"
	t2[12]="articulo"
	t2[13]="regalo de bodas"
	t2[14]="ipod"
	t2[15]="nintendo ds"
	t2[16]="k610"
	t2[17]="dispositivo mk IV"
	t2[18]="reactor"
	t2[19]="wii"
	t2[20]="vino"
	t2[21]="cerveza"
	t2[22]="sake"
	packageName=packageName.." "..t2[math.random(table.getn(t2))]
	
	if math.random(0,1)==1 then
		local tractor={}
		tractor[1]="¿Tienes un rayo tractor?"
		tractor[2]="Se requiere un rayo tractor."
		tractor[3]="Necesitará un rayo tractor para transportar la carga."
		tractor[4]="Rayo tractor necesario."
		tractor[5]="¿Tienes un rayo tractor?"
		tractor[6]="Se requiere que tengas un rayo tractor."
		bigDesc=bigDesc.." "..tractor[math.random(table.getn(tractor))]
	end
		
	local t3={}
	t3[1]="Transporte de ".. packageName.." requerido."
	t3[2]=packageName.." para recoger en el sistema"..pickupSystem.."."
	t3[3]="¿Recogerias un contenedor en el sistema "..pickupSystem.. " por mi?"
	t3[4]="Necesito que recojan mi contenedor."
	t3[5]="Necesito que mi carga sea traída desde el sistema "..pickupSystem.." por mí."
	t3[6]="Trabajo de recogida de carga: "..packageName.."."
	t3[7]="Trae mi carga desde el sistema "..pickupSystem.."." 
	t3[8]="Necesito mi "..packageName.."."
	t3[9]="recoger mi "..packageName.."."
	smallDesc=t3[math.random(table.getn(t3))]
	
	if (dangerous==1) then
		smallDesc=smallDesc.." (Advertencia: Peligroso)"
	end
		
	--bigDesc=smallDesc -- make the longer description
		
	local t4={}
	t4[1]="Puedo darte ".. prize.. "$ por eso."
	t4[2]=prize.. "$ es todo lo que puedo ofrecer."
	t4[3]="Puedo ofrecerte una preciosa suma de ".. prize.. "$. ¿Te parece bien?"
	t4[4]="Puedo pagar "..prize.."$."		
	t4[5]="Tu remuneración será de "..prize.."$."
	t4[6]="No puedo ofrecer más que, tal vez "..prize.."$."
	t4[7]="Tal vez unos miserables "..prize.."$ bastarán."
	t4[8]="No tengo mucho dinero desde que murió mi hermano. "..prize.."$ es todo lo que tengo."
	t4[9]="¿Mencioné el pago? Oh, "..prize.."$ es todo lo que puedo pagar."		
	bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]
	
	local t6={}
	t6[1]="Tienes que recogerlo en la estacion "..pickupStation.. ", en el sistema "..pickupSystem.."."
	t6[2]="El destino final del paquete es aquí, pero la recogida es en la estacion "..pickupStation.." del sistema "..pickupSystem.."."
	t6[3]="Consigue mi contenedor de carga flotante en la estacion "..pickupStation.." del sistema "..pickupSystem.."."
	t6[4]="Necesitarás conseguirlo en la estacion"..pickupStation.." del sistema "..pickupSystem.."."
	t6[5]="Tráelo desde la estacion "..pickupStation..", del sistema"..pickupSystem.."."
	bigDesc=bigDesc.." "..t6[math.random(table.getn(t6))]	

	bigDesc=bigDesc.." Entonces tráelo de vuelta aquí, "..dropOffStation.." en el sistema "..dropOffSystem.."."
	
	bigDesc=bigDesc.." [br] Déjalo fuera de la estación y yo lo recogeré."
		
	local more=math.random(1)
	
	if (more==0) then
		local t5={}
		t5[1]="¿Aceptarás?"
		t5[2]="Entonces, ¿qué opinas?"
		t5[3]="Te recomendaré si puedes hacer esto"
		t5[4]="No debería ser demasiado difícil. ¿Hm?"	
		bigDesc=bigDesc.." "..t5[math.random(table.getn(t5))]		
	end	
	
	bigDesc=bigDesc.." Obviamente necesitarás un rayo tractor para el trabajo."
	
	return 1
end


function canTakeMission() -- check to see if you can take this mission
	if (( getSplitSpeed() == 0 ) and ( getDistanceToStation(pickupStation) > 50000 )) then
		return "No, gracias. Está bastante lejos y tu nave no tiene un motor dividido."
	end
	
	local hasTractor1 = hasUpgrade("m1 yacon mk 1 tractor beam")
	local hasTractor2 = hasUpgrade("m2 winchester tractor beam")
	local hasTractor3 = hasUpgrade("m3 yokohama cruise tractor beam")
	if (( hasTractor1 + hasTractor2 + hasTractor3 ) == 0 ) then
		return "Necesitarás un rayo tractor. Vuelve cuando tengas uno."
	end
	
	return "" -- you can take a courier mission
end


function takeMission() -- upon taking the mission set up things, like:

	if (dangerous==1) then
		skill=math.random(1,2)	
		bounty=(skill*(math.random(670,1290)))
		
		which = math.random(0,1)
		
		if (which==0) then		
			createMissionBountyTrigger(getRandomShipID(),getRandomName(),skill,bounty,0,dropOffSystem)
		elseif (which==1) then
		    createMissionBountyTrigger(getRandomShipID(),getRandomName(),skill,bounty,0,pickupSystem)
		end		
	end

	-- add a cargo item outside destination station
	putCargoContainerOutsideStation(deviceName,pickupStation,contactPerson)
	--print("cargo container "..deviceName.." has been made outside "..pickupStation.." in LUA")
end


function update() -- update mission critical things here
	local arrive = ItemIsOutsideStation(deviceName,dropOffStation)

	if (youDocked(dropOffStation) ==1) then
		if (arrive ==1) then
			finishSuccess()
			return 1 -- mission complete.
		end
	end
	return 0 -- not complete yet
end

function finishSuccess() -- clear up stuff here
	cleanUp()
	completeMission(1, prize, advertPerson, smallDesc, bigDesc, getGenericThanksQuote(prize))
end

function finishFailure() -- clear up stuff here
	completeMission(0, prize, advertPerson, smallDesc, bigDesc, getGenericDisappointmentQuote(prize))
	cleanUp()	
end

 -- ====================================================== CLEAN UP
function cleanUp()
	removeCargoContainer(deviceName)
end
 -- ====================================================== CLEAN UP

function cancel()
	-- we don't want to make the cargo container disappear if you have it so
	-- just make the guy you're supposed to meet go away and leave the cargo container to float always.
	finishFailure()
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
	return dropOffStation.." en el sistema "..dropOffSystem.."."
end

function getDestination()
	return pickupStation.." en el sistema "..pickupSystem.."."
end

function returnImageFile()
	return "data/images/hud/missions/cargo.png"
end

function hasPriceBoost()
	return priceBoost
end

-- ========================================================
-- MAIN!
-- ========================================================

contactPerson = getRandomName()
advertPerson = getRandomName()
packageName = ""
prize = 0
haggleExtra = 0
priceBoost = 0
smallDesc = ""
bigDesc = ""
dropOffSystem = ""
dropOffStation = ""
dangerous =0
pickupStation = ""
pickupSystem = ""

distanceToTarget = 0
reputation_required = 0.0
deviceName = ""

--print("LUA -> contact Person: "..contactPerson)
--print("LUA -> advert Person: "..advertPerson)
--print("LUA -> Main run OK.")

