-- Photograph ship recon mission
-- Created: 6th Nov, 2005
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
	if (getExperience()<60) then return 0 end

	-- this is where you'll take the photo back to.
	local dockedAt = getYourDockedStation()
	
	local ok=false
	local closeCount=10
	while closeCount>0 do
		dropOffSystem=getRandomSystem()
		dropOffStation=getRandomStation(dropOffSystem)
		if ((getDistanceToStation(dropOffStation)/124000.0) < 40) then
			if dropOffStation ~= dockedAt then 
				ok=true
				break
			end
		end
		closeCount = closeCount - 1
	end
	while ok==false do
		dropOffSystem=getRandomSystem()
		dropOffStation=getRandomStation(dropOffSystem)
		if ((getDistanceToStation(dropOffStation)/124000.0) < 60) then
			if dropOffStation ~= dockedAt then 
				ok=true 
			end
		end
	end
	
	ok=false
	while ok==false do
		pickupSystem=getRandomSystem()
		pickupStation=getRandomStation(pickupSystem)
		if ((getDistanceToStation(pickupStation)/124000.0) < 60) then
			if pickupStation ~= dockedAt then 
				if pickupStation ~= dropOffStation then 
					ok=true
				end
			end
		end
	end -- the station the person is on

	
	prize = 15
	prize = prize + (getDistanceToSystem(pickupSystem)/124000.0)*0.3
	--TODO This should use distance form pickup to dropoff station
	--prize = prize + (getDistanceToStation(dropOffStation)/124000.0)*2.5
	
	dangerous=math.random(0,1)
	if (dangerous==1) then
		prize = prize * math.random(1.2,1.4)
		prize = math.floor(prize)
	end
	prize = prize + math.random(0,3)
	prize = math.floor(prize)
	prize = prize * 1000
	
	priceBoost = 0
	if (math.random(10)==1) then
		priceBoost = 1
		prize = prize * 2
	end
	
	photoPerson = getRandomName()		-- who you're taking the photo of
	contactPerson = getRandomName()		-- who you give the photos back to
	advertPerson = getRandomName()		-- who you're talking to now

	-- GET DESCRIPTION
	local moneyFirst=math.random(0,1)
	
	if moneyFirst==1 then
		local t4={}
		t4[1]="La remuneración por esta acción será de "..prize.."$."
		t4[2]=..prize.."$ es todo lo que podemos ofrecer."
		t4[3]="Me han ordenado que le pague "..prize.."$ por su esfuerzo."
		t4[4]="Podemos pagarle "..prize.."$."		
		t4[5]="Su remuneración será de "..prize.."$."
		t4[6]="Creo que ganarás "..prize.."$, es suficiente para este tipo de trabajo."
		bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]			
	end

	local t3={}
	t3[1]="Un trabajo de reconocimiento para un buen candidato."
	t3[2]="Necesito información sobre una persona."
	t3[3]="foto requerida de ".. photoPerson.. " en la estación "..pickupStation
	t3[4]="Misión Secreta de Reconocimiento al sistema "..pickupSystem.."."
	t3[5]="Requiere un piloto leal para.... fotografía."
	t3[6]="Fotografía de "..photoPerson.." necesaria para investigación."
	t3[7]="¿Quieres echarnos una mano?"
	t3[8]="Ayúdanos y te ayudaremos. Con dinero."
	t3[9]="requerida foto de "..photoPerson.." en el sistema ".. pickupSystem .."."
	t3[10]="¿Dónde está mi hermano?"
	t3[11]="¿Has visto a este hombre?"
	t3[12]="Perdido: "..photoPerson.."."
	smallDesc=t3[math.random(table.getn(t3))]
	
	if (dangerous==1) then
		smallDesc=smallDesc.." (Advertencia: Peligroso)"
	end
	
	local t={}
	t[1]="Buen día. "
	t[2]="¿Eres leal y confiable? No se preocupe. Eso hará que te maten."
	t[3]="Me alegra ver que estás interesado."
	t[4]=""	
	t[5]=""
	t[6]="Me vendría bien un piloto como tú."
	bigDesc=t[math.random(table.getn(t))]	
		
	local t2={}
	t2[1]="Encontrarás a "..photoPerson.." en la estacion "..pickupStation..". Necesito pruebas de que esta persona está a bordo en este momento. Eso está en el sistema "..pickupSystem.."."
	t2[2]="Creo que alguien está tratando de matarme. ¿Realmente existe? Toma una foto de "..photoPerson.." está a abordo de la estación "..pickupStation.." en el sistema "..pickupSystem.."."
	t2[3]="No estoy seguro si "..photoPerson.." esta abordo de la estacion "..pickupStation.." en el sistema "..pickupSystem..". Quiero que me consigas una foto de él y luego enviaré a los chicos."
	t2[4]="Tengo problemas con algunas personas. En particular, "..photoPerson.." a bordo de la estacion "..pickupStation.." en el sistema "..pickupSystem..". Sácale una foto para mí."
	t2[5]="Quiero que me saques una foto. No quiero que se hagan preguntas. Aquí están los detalles: Persona: "	..photoPerson.." Estación: "..pickupStation.." en el sistema "..pickupSystem.."."
	bigDesc=bigDesc.." "..t2[math.random(table.getn(t2))]
	
	local more=math.random(0,1)
	if more==0 then
		local tm={}
	        tm[1]="¿Qué me dices?"
		tm[2]="¿Qué te parece?"
		tm[3]="¿Nos ayudarías?"
		tm[4]="¿Crees que tienes lo que se necesita?"
		tm[5]="¿Estás dispuesto?"
		bigDesc=bigDesc.." "..tm[math.random(table.getn(tm))]
	end	
		
	if moneyFirst~=1 then	
		local t4={}
		t4[1]="La remuneración por esta acción será de "..prize.."$."
		t4[2]=..prize.."$ es todo lo que podemos ofrecer."
		t4[3]="Me han ordenado que le pague ".. prize.. "$ por su esfuerzo."
		t4[4]="podemos pagar "..prize.."%."		
		t4[5]="Tu recompensa será de "..prize.."$."
		t4[6]="Creo que conseguirá "..prize.."$ es suficiente para este trabajo."
		bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]
	end
	
	-- who?
	local t6={}
	t6[1]="Una vez que tenga la foto, tráigala de vuelta a "..contactPerson.." en la estación "..dropOffStation.." del sistema "..dropOffSystem.."."
	t6[2]="Su trabajo estará completo cuando devuelva la foto a "..contactPerson.." que está a bordo de la estación "..dropOffStation.." en el sistema "..dropOffSystem.."."
	t6[3]="Tengo a alguien esperándote en la estación "..dropOffStation.." del sistema "..dropOffSystem..". Dale la foto a  "..contactPerson.." una vez que llegues allí."
	t6[4]="Puedes dejar las pruebas en la estación "..dropOffStation.." del sistema "..dropOffSystem..". Dáselos a "..contactPerson.." y te pagará."
	t6[5]="Luego quiero ver la foto en las manos de mi amigo "..contactPerson.." te estará esperando en la estación "..dropOffStation.." del sistema "..dropOffSystem.."."
	bigDesc=bigDesc.." "..t6[math.random(table.getn(t6))]
	
	local t7={}
	t7[1]="se le proporcionará una cámara."
	t7[2]="Te daremos una cámara."
	t7[3]="También obtendrás una cámara."
	t7[4]="Se incluyó una cámara."
	t7[5]="No te preocupes, la cámara está incluida."
	bigDesc=bigDesc.." "..t7[math.random(table.getn(t7))]

	return 1
end


function canTakeMission() -- check to see if you can take this mission
	if (( getSplitSpeed() == 0 ) and ( getDistanceToStation(dropOffStation) > 50000 )) then
		return "No, gracias. Está bastante lejos y tu nave no tiene un motor divisor."
	end
 	if (stillHavePhotoMission()==1) then
		return "Sólo puedes tener una misión fotográfica a la vez."
	end
	return ""
end

function takeMission() -- upon taking the mission set up things, like:
	if hasUpgrade("camara de reconocimiento")==0 then
		giveUpgrade("camara de reconocimiento")
		info2("Se te ha proporcionado una cámara de reconocimiento para cumplir esta misión.")
	else
		info2("Parece que ya tienes una cámara de reconocimiento. Úsala para cumplir esta misión.")
	end	

	-- add the photo person
	addPersonToStation(photoPerson,pickupStation,"random")
	setPersonScriptFile(photoPerson,"freeform")

	-- add the contact person
	addPersonToStation(contactPerson,dropOffStation,"random")
	setPersonScriptFile(contactPerson,"freeform")
	
	if (dangerous==1) then
		-- send someone out to get you in the target system...
		which = math.random(0,1) 
		if (which==0) then
			createMissionBountyTrigger(getRandomShipID(),getRandomName(),math.random(3,5),math.random(800,1280),0,dropOffSystem)	
		elseif (which==1) then
		    createMissionBountyTrigger(getRandomShipID(),getRandomName(),math.random(3,5),math.random(800,1280),0,pickupSystem)
		end
	end	
end


function update() -- update mission critical things here
	local photo_taken=0
		
	if photoContains(photoPerson)==1 then
		photo_taken=1
		if (youDockedAtAll()==0) then
			setPersonScriptFile(contactPerson,getRandomFileFrom("data/scripts/missions/photo"))
		end
	end
		
	if photo_taken==1 then
		if youDocked(dropOffStation)==1 then
			if youTalkedTo(contactPerson)==1 then
				-- that's all that's needed...
				finishSuccess()			
				return 1
			end
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
	setPersonScriptFile(photoPerson,"freeform")
	setPersonScriptFile(contactPerson,"freeform")
	
	removePersonFromStation(photoPerson,pickupStation)
	removePersonFromStation(contactPerson,dropOffStation)

 	if (stillHavePhotoMission()==0) then
		-- since you were given the camera and you didnt buy it, it gets taken away.
		removeUpgrade("camara de reconocimiento") -- removes photos and stuff too.
	end
end
 -- ====================================================== CLEAN UP

function cancel()
	finishFailure()
	cleanUp()
end

function canCancel() -- always able to cancel
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
	return "data/images/hud/missions/photograph_person.png"
end

function hasPriceBoost()
	return priceBoost
end

-- ========================================================
-- MAIN!
-- ========================================================

photoPerson = getRandomName()
contactPerson = getRandomName()
advertPerson = getRandomName()
prize = 0
haggleExtra = 0
priceBoost = 0
smallDesc = ""
bigDesc = ""
people = 0

dangerous = 0

dropOffSystem = ""
dropOffStation = ""
pickupStation = ""
pickupSystem = ""

distanceToTarget = 0
reputation_required = 0.0

