-- Find Person Mission
-- Created: 29nd Sept, 2006 / 5th April, 2007  / 13th Oct, 2007
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
	if (getExperience()<12) then return 0 end
	person_name = getRandomName()
	
	local dockedAt = getYourDockedStation()
	local ok=false
	while ok==false do
		person_system=getRandomSystem()
		person_station=getRandomStation(person_system)
		if ((getDistanceToStation(person_station)/124000.0) < 60) then
			if person_station ~= dockedAt then 
				ok=true 
			end
		end
	end
	
	numberOfClues = math.random(2,4)
	home_station = getYourDockedStation()
	home_system = getYourSystem()
	advertPerson = getRandomName()
	
    if (numberOfClues==2) then     
		prize = math.random(26,59)
		if (getExperience()<40) then return 0 end
	end
    if (numberOfClues==3) then 
		prize = math.random(16,39)
		if (getExperience()<20) then return 0 end
	end
    if (numberOfClues==4) then 
		prize = math.random(11,14)
		if (getExperience()<10) then return 0 end
	end

	prize = prize + (getNumberOfStationsInSystem(person_system) * 25000)
    prize = prize + (getDistanceToStation(person_station)/124000.0)
	prize = prize * 1.5
	prize = math.floor(prize)
	prize = prize * 1000
	

	local t3={}
	t3[1]="Estoy buscando a "..person_name.."."
	t3[2]="Estoy buscando desesperadamente "..person_name.."."
	t3[3]="¿Puedes ayudarme a encontrar a "..person_name.."?"
	t3[4]="Estoy buscando a "..person_name..". Pagaré por su ubicación."
	t3[5]=person_name.." está perdido."
	smallDesc=t3[math.random(table.getn(t3))]
	
	local t={}
	t[1]="Hola. "
	t[2]="¿Quien eres?"
	t[3]="Hola compañero."
	t[4]=""	
	t[5]="Hey."
	t[6]="¿Qué pasa?"
	bigDesc=t[math.random(table.getn(t))]	
		
	local t2={}
	t2[1]="Estoy buscando a una persona llamada "..person_name.."."
	t2[2]=person_name.."  ha desaparecido y me gustaría que alguien lo(a) encontrara."
	t2[3]="Estoy buscando a alguien que me ayude a encontrar a mi amigo(a), "..person_name.."."
	bigDesc=bigDesc.." "..t2[math.random(table.getn(t2))]

    for i=1,numberOfClues do
        if (i==1) then 
			bigDesc=bigDesc.." Lo último que supe es que estaba cerca de un"..getSunClassOfSystem(person_system).."."
		end
        if (i==2) then 
        	local planets=getNumberOfPlanetsInSystem(person_system)
        	if (planets==1) then
				bigDesc=bigDesc.." Creo que lo(a) recuerdo diciendo que su sistema tenía un solo planeta."
			else
			    bigDesc=bigDesc.." Creo que lo(a) recuerdo diciendo que su sistema tenía "..planets.." planetas y lunas."
			end
		end
        if (i==3) then 
        	local stats=getNumberOfStationsInSystem(person_system)
        	if (stats==1) then
        		bigDesc=bigDesc.." y había "..stats.." en su sistema."
        	else
				bigDesc=bigDesc.." y había "..stats.." en su sistema."
			end
		end
        if (i==4) then 
			bigDesc=bigDesc.." La última vez que hablamos, su comunicación era confusa. Todo lo que oí fue "..getFirstLetterOfSystem(person_system).."."
		end		
	end

    bigDesc=bigDesc.." Si lo encuentras, habla con él para confirmar su identidad."

	local t4={}
	t4[1]="Te puedo dar ".. prize.. "$ por tu ayuda."
	t4[2]=prize.. "$ es todo lo que puedo ofrecer."
	t4[3]="Puedo ofrecerte una preciosa suma de ".. prize.. "$. ¿Está bien?"
	t4[4]="Puedo pagarte "..prize.."$."
	t4[5]="Tu retribución será de "..prize.."$."
	t4[6]="No puedo ofrecer más que, tal vez "..prize.."$."
	t4[7]="Tal vez unos miserables "..prize.."$ bastarán."
	t4[8]="¿Mencioné el pago? Oh, "..prize.."$ es todo lo que puedo pagar."
	bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]
	
	local t6={}
	-- when you find them come back and see me. generateThanksForMissingConvo....
	
	t6[1]="Cuando lo hayas encontrado, vuelve a verme."
	t6[2]="Vuelve aquí y háblame. Te pagaré y finalmente podré volver a verle."
	bigDesc=bigDesc.." "..t6[math.random(table.getn(t6))]
	
	bigDesc=bigDesc.." Podrás encontrarme aquí, "..home_station.." en el sistema "..home_system.."."
	bigDesc=bigDesc.." Oh, por cierto, mi nombre es "..advertPerson.."."

	return 1
end


function canTakeMission() -- check to see if you can take this mission
	if (( getSplitSpeed() == 0 ) and ( getDistanceToStation(person_station) > 50000 )) then
		return "No, gracias. Está bastante lejos y tu nave no tiene un motor dividido."
	end
	return "" -- you can take a find mission
end


function takeMission() -- upon taking the mission set up things, like:
	addPersonToStation(person_name,person_station,"random")
	setPersonScriptFile(person_name,getRandomFileFrom("data/scripts/ohyoufoundme/found"))
	
	addPersonToStation(advertPerson,home_station,"random")
	setPersonScriptFile(advertPerson,"data/scripts/ohyoufoundme/notfound.txt")
end


function update() -- update mission critical things here
	if (youTalkedTo(person_name)==1) then -- OR (youDocked(person_station)==1) then -- you talked to the missing person

		if (found==0) then
			info("Parece que encontraste a "..person_name..". Mejor regresa a "..home_station.." en el sistema "..home_system..".")
            setPersonScriptFile(advertPerson,getRandomFileFrom("data/scripts/ohyoufoundme/finder"))
            setPersonScriptFile(person_name,"freeform")
			found=1
		end
	end
	
	if (found==1) then
		if (youTalkedTo(advertPerson)==1) then
            finishSuccess()
        	return 1
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
	setPersonScriptFile(advertPerson,"freeform")
	setPersonScriptFile(person_name,"freeform")

	removePersonFromStation(person_name,person_station)
	removePersonFromStation(advertPerson,home_station)
end
 -- ====================================================== CLEAN UP

function cancel()
	finishFailure()
	cleanUp()
end

function canCancel()
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
	return "DESCONOCIDA"-- [ "..person_station.." - "..person_system.." ]"
end

function returnImageFile()
	return "data/images/hud/missions/findperson.png"
end

-- ========================================================
-- MAIN!
-- ========================================================


numberOfClues = 0
person_name = ""
person_system = ""
person_station = ""
home_station = ""
home_system = ""

advertPerson = ""
prize = 0
haggleExtra = 0
smallDesc = ""
bigDesc = ""

found=0

dropOffSystem = ""
dropOffStation = ""

distanceToTarget = 0
reputation_required = 0.0

