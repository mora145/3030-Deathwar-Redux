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
	if (getExperience()<50) then return 0 end

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
		if ((getDistanceToSystem(pickupSystem)/124000.0) < 60) then
			ok=true 
		end
	end

	photoPlanet = getRandomPlanet(pickupSystem)	-- the planet to photograph

	if (math.random(9)==1) then
		dangerous=1
	end
	
	prize = 10
	prize = prize + (getDistanceToSystem(pickupSystem)/124000.0)*0.3
	--TODO This should use distance form pickup to dropoff station
	--prize = prize + (getDistanceToStation(dropOffStation)/124000.0)*1.4
	if (dangerous==1) then
		prize = prize * (math.random(1.2,1.5))
	end
	prize = prize + math.random(0,3)
	prize = math.floor(prize)
	prize = prize * 1000
	
	priceBoost = 0
	if (math.random(10)==1) then
		priceBoost = 1
		prize = prize * 2
	end

	contactPerson = getRandomName()		-- who you give the photos back to
	advertPerson = getRandomName()		-- who you're talking to now

	-- GET DESCRIPTION
	local moneyFirst=math.random(0,1)
	
	if moneyFirst==1 then
		local t4={}
		t4[1]="La remuneración por esta acción será de ".. prize.."$."
		t4[2]=prize.. "$ es todo lo que podemos ofrecer."
		t4[3]="Me han ordenado que le pague ".. prize.. "$ por su esfuerzo."
		t4[4]="Podemos pagarle "..prize.."$."		
		t4[5]="Su remuneración será de "..prize.."$."
		t4[6]="Creo que ganarás "..prize.."$, es suficiente para este tipo de trabajo."
		bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]			
	end

	local t3={}
	t3[1]="Investigación del Consejo: Datos científicos requeridos."
	t3[2]="Datos planetarios requeridos."
	t3[3]="¿Te gusta tomar fotos de planetas?"
	t3[4]="Escaneo planetario requerido."
	t3[5]="Escaneo del planeta "..photoPlanet.." requerido."
	t3[6]="Se requiere fotografía para investigación planetaria."
	t3[7]="Investigación del Consejo: "..photoPlanet.."."
	smallDesc=t3[math.random(table.getn(t3))]
	
	if (dangerous==1) then
		smallDesc=smallDesc.." (Advertencia: Peligroso)"
	end
	
	local t={}
	t[1]="Tarde. "
	t[2]="Buscamos a un investigador científico que nos ayude."
	t[3]="Me alegra ver que estás interesado."
	t[4]=""	
	t[5]="Estamos investigando las posibles razones de la aniquilación del planeta "..photoPlanet.."."
	t[6]="Nos vendría bien un piloto como tú."
	bigDesc=t[math.random(table.getn(t))]	
		
	local t2={}
	t2[1]="Necesitarás fotografiar el planeta "..photoPlanet..". Está en el sistema "..pickupSystem.."."
	t2[2]="El trabajo es fácil. Toma una foto del planeta "..photoPlanet..". Necesitarás llegar al sistema "..pickupSystem.."."
	t2[3]="Dirígete al sistema "..pickupSystem.." y busca el planeta "..photoPlanet..". Tómale una foto y tráela de vuelta."
	t2[4]="Necesitamos una foto de la atmósfera del planeta "..photoPlanet..". Dirígete al sistema "..pickupSystem.." y lo encontrarás allí."
	t2[5]="Es un planeta distinto. Dirígete al planeta "..photoPlanet.." y tomale una foto. Está en el sistema "..pickupSystem.."."
	bigDesc=bigDesc.." "..t2[math.random(table.getn(t2))]
	
	local more=math.random(0,1)
	if more==0 then
		local tm={}
		tm[1]="Es una simple misión de investigación. ¿Crees que puedes hacerlo?"
		tm[2]="¿Qué opinas tú?"
		tm[3]="¿Nos ayudarías?"
		tm[4]="Los resultados podrían ayudarnos a entender lo que pasó."
		tm[5]="¿Estás dispuesto?"
		bigDesc=bigDesc.." "..tm[math.random(table.getn(tm))]
	end	
		
	if moneyFirst~=1 then	
		local t4={}
		t4[1]="La remuneración por esta acción será de "..prize.."$."
		t4[2]=prize.. "$ es todo lo que podemos ofrecer"
		t4[3]="Me han ordenado que le pague "..prize.."$ por su esfuerzo."
		t4[4]="podemos pagar "..prize.."$."		
		t4[5]="Su remuneración será de "..prize.."$."
		t4[6]="Creo que encontrarás "..prize.."$ es suficiente para este tipo de trabajo."
		bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]
	end
	
	local t6={}
	t6[1]="Una vez que tenga la foto, tráigala de vuelta a "..contactPerson.." en la estación "..dropOffStation.." del sistema "..dropOffSystem.."."
	t6[2]="Su trabajo estará completo cuando devuelva la foto a "..contactPerson.." en la estación "..dropOffStation.." del sistema "..dropOffSystem.."."
	t6[3]="Tengo a alguien esperándote en la estación "..dropOffStation.." del sistema "..dropOffSystem..". Dale la foto a "..contactPerson.." una vez que llegues allí."
	t6[4]="Puedes dejar las pruebas en la estación "..dropOffStation.." del sistema "..dropOffSystem..". dáselas a "..contactPerson.." y te pagaremos."
	t6[5]="Después quiero ver la foto en las manos de mi amigo "..contactPerson.." te estará esperando en la estación "..dropOffStation.." del sistema "..dropOffSystem.."."
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
	if (dangerous==1) then
		skill=math.random(1,2)	
		bounty=(skill*(math.random(670,1290)))
		createMissionBountyTrigger(getRandomShipID(),getRandomName(),skill,bounty,0,pickupSystem)
	end

	if hasUpgrade("camara de reconocimiento")==0 then
		giveUpgrade("camara de reconocimiento")
		info2("Se te ha proporcionado una cámara de reconocimiento para cumplir esta misión.")
	else
		info2("Parece que ya tienes una cámara de reconocimiento. Úsala para cumplir esta misión.")
	end	

	-- add the contact person
	addPersonToStation(contactPerson,dropOffStation,"random")
	setPersonScriptFile(contactPerson,"freeform")
end


function update() -- update mission critical things here
	local photo_taken=0
		
	if photoContains(photoPlanet)==1 then
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
	setPersonScriptFile(contactPerson,"freeform")
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
	return photoPlanet.." en el sistema "..pickupSystem.."."
end

function returnImageFile()
	return "data/images/hud/missions/photograph_planet.png"
end

function hasPriceBoost()
	return priceBoost
end

-- ========================================================
-- MAIN!
-- ========================================================

contactPerson = getRandomName()
advertPerson = getRandomName()
photoPlanet = ""

prize = 0
haggleExtra = 0
priceBoost = 0
smallDesc = ""
bigDesc = ""
people = 0
dangerous = 0

dropOffSystem = ""
dropOffStation = ""

pickupSystem = ""

distanceToTarget = 0
reputation_required = 0.0

