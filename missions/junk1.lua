-- Destroy X amount of junk
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
	if (getExperience()<5) then return 0 end
	
	dropOffSystem = getYourSystem()
	amount = math.random(10,15)
	
	prize = amount * 5
	prize = prize + math.random(20,30)
	prize = math.floor(prize)
	prize = prize*100
	
	if math.random(1,2)==1 then
		if math.random(1,2)==1 then
			prize = prize + 50
		else
			prize = prize + (math.random(1,9)*10)
		end
	end

	contactPerson = getRandomName()		-- who you give the photos back to
	advertPerson = getRandomName()		-- who you're talking to now

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
	t[5]=dropOffSystem.." parece que se está llenando de basura."
	t[6]="Nos vendría bien un piloto como tú."
	bigDesc=t[math.random(table.getn(t))]	
		
	local t2={}
	t2[1]="Sólo necesitamos que destruyas ".. amount.." piezas de basura."
	t2[2]="Destruye por nosotros "..amount.." pedazos de esa basura flotante."
	bigDesc=bigDesc.." "..t2[math.random(table.getn(t2))]
	
	local more=math.random(0,1)
	if more==0 then
		local tm={}
		tm[1]="No es muy difícil. Sólo derribarlas."
		tm[2]=" [br] ¿que te parece?"
		tm[3]="¿Nos ayudarías?"
		tm[4]="El sistema estaría mejor. Aunque, ahora que lo pienso. Tal vez no lo haría. Parece que cada día hay más basura."
		tm[5]=dropOffSystem.." será un poco más limpio. También serás "..prize.."$ mas rico."
		bigDesc=bigDesc.." "..tm[math.random(table.getn(tm))]
	end	

	local t6={}
	t6[1]=" [br] Una vez que los hayas destruido, moveremos los fondos a tu cuenta."
	t6[2]=" [br] ".. prize .."$ se añadirá a tu cuenta cuando la completes."
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
		return "No puedes estar haciendo limpieza de chatarra con antecedentes penales. Tendrá que pagar sus multas primero."
	end
	return ""
end


function takeMission() -- upon taking the mission set up things, like:
	resetJunkDestroyed(amount)
end


function update() -- update mission critical things here
	local junk=junkDestroyed()
	if (junk>amount) or (junk==amount) then
	    finishSuccess()
	    return 1
	end
	return 0 -- not complete yet
end

function finishSuccess() -- clear up stuff here
	cleanUp()
	completeMission(1, prize, advertPerson, smallDesc, bigDesc, getGenericThanksQuote(prize).." El sistema "..dropOffSystem.." estará mejor gracias a ti.")
end

function finishFailure() -- clear up stuff here
	completeMission(0, prize, advertPerson, smallDesc, bigDesc, getGenericDisappointmentQuote(prize))
	cleanUp()	
end

 -- ====================================================== CLEAN UP
function cleanUp()
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
	return "data/images/hud/missions/junk.png"
end

-- ========================================================
-- MAIN!
-- ========================================================

contactPerson = ""
advertPerson = ""

amount =0
prize = 0
haggleExtra = 0
smallDesc = ""
bigDesc = ""
people = 0

dropOffSystem = ""
dropOffStation = ""

pickupSystem = ""

distanceToTarget = 0
reputation_required = 0.0

