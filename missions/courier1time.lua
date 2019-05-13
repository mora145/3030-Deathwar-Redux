-- Courier Mission (timed)
-- Created: 2nd Nov, 2005
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
	if (getExperience()<17) then return 0 end

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

    timerName = advertPerson.." COURIER"

	if (math.random(9)==1) then
		dangerous=1
	end
	
	prize = 100
	prize = prize + (getDistanceToStation(dropOffStation)/124000.0)*2.0
	if (dangerous==1) then
		prize = prize * (math.random(1.2,1.4))
	end
	prize = math.floor(prize)

	local diff=math.random(1,4)

	if (diff==1) then
  		timeLimit="3:00"
  		prize = prize * math.random(1.7,1.8)

	elseif (diff==2) then
	    timeLimit="3:30"
		prize = prize * math.random(1.5,1.6)

	elseif (diff==3) then
    	timeLimit="4:00"
	    prize = prize * math.random(1.4,1.45)

	elseif (diff==4) then
    	timeLimit="5:00"
	    prize = prize * math.random(1.3,1.35)
	end
	
	prize = prize + (math.random(1,9))
    prize = math.floor(prize)
	prize = prize * 100

	-- GET PACKAGE NAME/TYPE
	local t={}
	t[1]="pequeño"
	t[2]="minúsculo"
	t[3]="bien embalado"
	t[4]="codiciado"	
	t[5]="importante"
	t[6]="religioso"
	t[7]="simple"
	t[8]="codificado"
	t[9]="encriptado"
	t[10]="alta seguridad"
	t[11]="baja seguridad"
	t[12]="muy importante"
	t[13]="baja importancia"
	t[14]="urgente"
	t[15]="asegurado"
	packageName=t[math.random(table.getn(t))]	
		
	local t2={}
	t2[1]="paquete"
	t2[2]="presente"
	t2[3]="documento"
	t2[4]="cryo-cred"	
	t2[5]="holo-vid"
	t2[6]="video disco"
	t2[7]="informe"
	t2[8]="holocubo"
	t2[9]="megadiso"
	t2[10]="regalo"
	t2[11]="presentación"
	t2[12]="grabación de conferencia"
	t2[13]="disq sexo (tm)"
	packageName=packageName.." "..t2[math.random(table.getn(t2))]
	
	local more2=math.random(14)
	if (more2==20) then
		-- from desktop
		packageName=getDesktopFile()
	end

	local t3={}
	t3[1]="Transporte de ".. packageName.." requerido."
	t3[2]=packageName.." para recoger en el sistema"..pickupSystem.."."
	t3[3]="¿Crees que puedes llevar ".. packageName.." por mi, al sistema ".. dropOffSystem.."?"
	t3[4]="Necesito que este/a "..packageName.." sea llevado al sistema "..dropOffSystem.."."
	t3[5]="Necesito que mi ".. packageName.." sea llevado al sistema "..dropOffSystem.."."
	t3[6]="Trabajo de entrega: "..packageName.." al sistema "..dropOffSystem.."."
	smallDesc=t3[math.random(table.getn(t3))]
		
	--bigDesc=smallDesc -- make the longer description
		
	local t4={}
	t4[1]="Puedo darte ".. prize.. "$ por eso."
	t4[2]=prize.. "$ es todo lo que puedo ofrecer."
	t4[3]="Puedo ofrecerte una preciosa suma de ".. prize.. "$. ¿Te parece bien?"
	t4[4]="Puedo pagar "..prize.."$."		
	t4[5]="Tu remuneración será de "..prize.."$."
	t4[6]="No puedo ofrecer más que, tal vez "..prize.."$."
	t4[7]="Tal vez unos miserables "..prize.."$ bastarán."
	t4[8]="No tengo mucho dinero desde que murió mi esposa. "..prize.."$ es todo lo que tengo."
	t4[9]="¿Mencioné el pago? Oh, "..prize.."$ es todo lo que puedo pagar."	
	bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]
	
	local t6={}
	t6[1]="Necesita llegar a ".. dropOffStation.. ", del sistema "..dropOffSystem.."."
	t6[2]="El destino final del paquete es "..dropOffStation..", en el sistema"..dropOffSystem.."."
	t6[3]="Así que el destino (otra vez, en caso de que lo olvidaras) era "..dropOffStation.." en el sistema "..dropOffSystem.."."
	t6[4]="Puedes dejarlo en "..dropOffStation.." en el sistema "..dropOffSystem.."."
	t6[5]="Llévelo a "..dropOffStation..", "..dropOffSystem.."."
	t6[4]="Sólo lleva la maldita cosa a "..dropOffStation..", ¿quieres?. Eso está en "..dropOffSystem.."."
	bigDesc=bigDesc.." "..t6[math.random(table.getn(t6))]	
	
	local con={}
	con[1]="amigo"
	con[2]="hermano"
	con[3]="padre"
	con[4]="socio de negocios"
	con[5]="conocido"
	con[6]="amigo de siempre"
	con[7]="amigo"
	con[8]="contacto"
	con[9]="droide esclavo"
	con[10]="droide"
	local connection=con[math.random(table.getn(con))]
	
	local t7={}
	t7[1]=contactPerson.." estará esperándote allí."
	t7[2]="Le he dicho a mi "..connection..", "..contactPerson.." que lo espere."
	t7[3]="He informado a mi "..connection..". Oh, su nombre es "..contactPerson.."."
	t7[4]="Sólo dele el paquete a mi "..connection..", "..contactPerson.."."
	t7[5]="entregue el paquete a "..contactPerson.." que te estará esperando."
	t7[6]="Puedes ponerte en contacto con "..contactPerson.." cuando llegues allí. Es mi "..connection.."."
	t7[7]="Pon el paquete en manos de "..contactPerson..". Te estará esperando allí.."
	bigDesc=bigDesc.." "..t7[math.random(table.getn(t7))]
		
	local more=math.random(1)
	
	if (more==0) then
		local t5={}
		t5[1]="¿Aceptarás?"
		t5[2]="Entonces, ¿qué te parece?"
		t5[3]="Te recomendaré, si puedes hacerlo."
		t5[4]="No debería ser tan difícil. ¿Hm?"	
		bigDesc=bigDesc.." "..t5[math.random(table.getn(t5))]		
	end	

	local f5={}
	f5[1]="tienes "..timeLimit.." para completar esta carrera."
	f5[2]="Esto es realmente urgente. Tendrás "..timeLimit.." para llegar allí."

	bigDesc=bigDesc.." "..f5[math.random(table.getn(f5))]

	return 1
end


function canTakeMission() -- check to see if you can take this mission
	if (( getSplitSpeed() == 0 ) and ( getDistanceToStation(dropOffStation) > 50000 )) then
		return "No, gracias. Está bastante lejos y tu nave no tiene un motor dividido."
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
		    createMissionBountyTrigger(getRandomShipID(),getRandomName(),skill,bounty,0,getYourSystem())
		end
	end

	local desc = "llegar a "..dropOffStation
	createTimer(timerName,desc,timeLimit)

	addPersonToStation(contactPerson,dropOffStation,"random")
	setPersonScriptFile(contactPerson,getRandomFileFrom("data/scripts/missions/courier"))
	giveYouPoss(packageName)
end


function update() -- update mission critical things here

	if youDocked(dropOffStation)==1 then
		if youTalkedTo(contactPerson)==1 then
			finishSuccess()
			return 1
		end
	end
	
	if isInAConversation()==0 then
		local fin=timerFinished(timerName)

		local newDesc= "llegar a "..dropOffStation
		updateTimerDescription(timerName,newDesc)

		if (fin==1) then
			finishFailure()
			return 1
		end
	end
	return 0
end

function finishSuccess() -- clear up stuff here
	cleanUp()
	completedMission("courier")
	completeMission(1, prize, advertPerson, smallDesc, bigDesc, getGenericThanksQuote(prize))
end

function finishFailure() -- clear up stuff here
	if (youDockedAtAll()==0) then
		completeMission(0, prize, advertPerson, smallDesc, bigDesc, getGenericDisappointmentQuote(prize).." The package will get picked up when you next dock.")
	else
		completeMission(0, prize, advertPerson, smallDesc, bigDesc, getGenericDisappointmentQuote(prize).." I'll get someone to pickup the package from you.")
	end
	
	cleanUp()	
end

 -- ====================================================== CLEAN UP
function cleanUp()
	setPersonScriptFile(contactPerson,"freeform")
	removePersonFromStation(contactPerson,dropOffStation)
	removePoss(packageName)
	destroyTimer(timerName)
end
 -- ====================================================== CLEAN UP

function cancel()
	finishFailure()
end

function canCancel()
	-- can always cancel a courier mission
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
	return dropOffStation.." en el sistema "..dropOffSystem.."."
end

function returnImageFile()
	return "data/images/hud/missions/couriertimed.png"
end

-- ========================================================
-- MAIN!
-- ========================================================

contactPerson = getRandomName()
advertPerson = getRandomName()
dangerous =0
packageName = ""
prize = 0
haggleExtra = 0
smallDesc = ""
bigDesc = ""
dropOffSystem = ""
dropOffStation = ""
distanceToTarget = 0
reputation_required = 0.0
timerName = ""
timeLimit = 0

