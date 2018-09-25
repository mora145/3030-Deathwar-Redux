-- Destroy X amount of junk in Y time
-- Created: 4th May, 2006
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
	if (getExperience()<15) then return 0 end

	dropOffSystem = getYourSystem()
	amount = math.random(15,25)

	timeLimit = ""
	
	if (amount <= 18) then
	    timeLimit = "4:00"
	elseif (amount <= 21) then
	    timeLimit = "5:00"
	else
	    timeLimit = "6:00"
	end

	prize = amount * 6
	prize = prize + math.random(16,21)
	prize = math.floor(prize)
	prize = prize*100
	
	if math.random(1,2)==1 then
		if math.random(1,2)==1 then
			prize = prize + 50
		else
			prize = prize + (math.random(1,9)*10)
		end
	end
	
	contactPerson = getRandomName()	
	advertPerson = getRandomName()		-- who you're talking to now

    timerName = contactPerson.." CONOMETRO DE LIMPIEZA"

	-- GET DESCRIPTION

	local t3={}
	t3[1]="Se requiere limpieza inmediata de la basura."
	t3[2]="Importante trabajo de Excedente de basura."
	t3[3]="Un trabajo de limpieza galáctica. Rápido."
	t3[4]="Ayude a limpiar nuestro espacio hoy."
	t3[5]="Conservar ".. dropOffSystem .." limpia."
	t3[6]=dropOffSystem.." se está ensuciando."
	t3[7]="Trabajo del Consejo: Limpieza inmediata de chatarra."
	smallDesc=t3[math.random(table.getn(t3))]
	
	local t={}
	t[1]="Tarde. "
	t[2]="Parece que hay una gran acumulación de basura en este sistema."
	t[3]="Me pregunto si puede ayudarme."
	t[4]=""	
	t[6]="Nos vendría bien un piloto como tú."
	bigDesc=t[math.random(table.getn(t))]	

	local t6={}
	t6[1]="Este es un trabajo importante. Si mi jefe ve este desastre, literalmente me matará. [br]"
	t6[2]="Esto tiene que hacerse rápidamente. Muy rápido."
	t6[3]="Tengo ganas de retarte. Tendrás que hacerlo a contrarreloj."
	t6[4]="¿Te sientes afortunado? ¿Y veloz?"
	t6[5]=dropOffSystem.." parece que se está llenando de basura. Necesita ser despejado inmediatamente."
	bigDesc=t6[math.random(table.getn(t6))]
		
	local t2={}
	t2[1]="Sólo necesitamos que destruyas ".. amount.." pedazos de chatarra en "..timeLimit.."."
	t2[2]="Destruye para nosotros "..amount.." pedazos de esa basura flotante que esta dentro de la zona asignada en "..timeLimit.."."
	bigDesc=bigDesc.." "..t2[math.random(table.getn(t2))]
	
	local more=math.random(0,1)
	if more==0 then
		local tm={}
		tm[1]="No es muy difícil. Sólo dispararles. Rápidamente."
		tm[2]=" [br] ¿Qué opinas tú? ¿Eres lo suficientemente rápido?"
		tm[3]="¿Nos ayudarías?"
		tm[4]="El sistema quedaría mejor. Aunque, ahora que lo pienso. Tal vez no lo haría. Parece que cada día hay más basura."
		tm[5]=dropOffSystem.." estará un poco más limpio. También serás "..prize.."$ mas rico."
		bigDesc=bigDesc.." "..tm[math.random(table.getn(tm))]
	end	

	local t6={}
	t6[1]=" [br] Una vez que las hayas destruido, transferiremos los fondos a tu cuenta.."
	t6[2]=" [br] ".. prize .."$ se añadirá a su cuenta una vez completada."
	bigDesc=bigDesc.." "..t6[math.random(table.getn(t6))]

	return 1
end


function canTakeMission() -- check to see if you can take this mission
	if (hasWeapon()==0) then 
		return "No puedes tomar esta misión sin un arma. ¿De qué otra forma vas a disparar a la basura?"
	end
    if (haveJunkMission()==1) then 
		return "Sólo puedes tener una misión basura a la vez. Reglas del Consejo."
	end
	if (getCrimeCount()>0) then 
		return "No puedes estar haciendo limpieza de chatarra con antecedentes penales. Primero tendrás que pagar tus multas."
	end
	return ""
end


function takeMission() -- upon taking the mission set up things, like:
	desc = "destruye "..amount.." piezas de basura"
	createTimer(timerName,desc,timeLimit)
	resetJunkDestroyed(amount)
end


function update() -- update mission critical things here
	local junk=junkDestroyed()
	local fin=timerFinished(timerName)

    newDesc=""
    
    if (amount-junk)==1 then
    	newDesc= "destruye 1 pieza de basura"
    else
    	newDesc= "destruye "..(amount-junk).." piezas de basura"   	
    end
    
    updateTimerDescription(timerName,newDesc)

	if (fin==1) then
	   finishFailure()
	   return 1
	end
	
	if (junk>amount) or (junk==amount) then
	    finishSuccess()
	    return 1
	end
	return 0 -- not complete yet
end

function finishSuccess() -- clear up stuff here
	cleanUp()
	completeMission(1, prize, advertPerson, smallDesc, bigDesc, getGenericThanksQuote(prize).." "..dropOffSystem.." estará mejor gracias a ti.")
end

function finishFailure() -- clear up stuff here
	completeMission(0, prize, advertPerson, smallDesc, bigDesc, getGenericDisappointmentQuote(prize))
	cleanUp()	
end

 -- ====================================================== CLEAN UP
function cleanUp()
	destroyTimer(timerName)
	resetJunkDestroyed(0)
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
	return ""
end

function getDestination()
	return "Este sistema"
end

function returnImageFile()
	return "data/images/hud/missions/junktimed.png"
end

-- ========================================================
-- MAIN!
-- ========================================================

contactPerson = ""
advertPerson = ""

timerName = ""

timeLimit = ""
amount =0
prize = 0
haggleExtra = 0
smallDesc = ""
bigDesc = ""
people = 0

dangerous=0

dropOffSystem = ""
dropOffStation = ""

pickupSystem = ""

distanceToTarget = 0
reputation_required = 0.0

