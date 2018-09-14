-- Local Passenger Mission
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
	if (getExperience()<5) then return 0 end

	if (countStationsInSystem()<2) then return 0 end-- for local passenger jobs

	dropOffSystem=getYourSystem()
	local dockedAt = getYourDockedStation()
	
	timerName = advertPerson.." PASAJERO LOCAL"

	local ok=false
	while ok==false do
		dropOffStation=getRandomStation(dropOffSystem)
		if dropOffStation ~= dockedAt then 
			ok=true 
		end
	end

	people=math.random(1,4)

	for i = 1,people do 
		people_on_board[i]=getRandomName()
	end


	if (math.random(4)==1) then
		dangerous=math.random(1,people)
	end
	
	prize = (getDistanceToStation(dropOffStation)/124000.0)*(40)
	prize = prize + (( people - 1 ) * 25 )
	if (dangerous==1) then
		prize = prize * math.random(1.2,3.4)
	end
	
	local diff=math.random(1,4)
	
	if (diff==1) then
  		timeLimit="4:00"
  		prize = prize * math.random(1.5,1.6)
		
	elseif (diff==2) then
  		timeLimit="4:30"
		prize = prize * math.random(1.3,1.5)
		
	elseif (diff==3) then
        timeLimit="5:00"
        prize = prize * math.random(1.1,1.3)
	    
	elseif (diff==4) then
        timeLimit="6:00"
        
	end

    prize = math.floor(prize)
	prize = prize * 100
	prize = prize + 2000 + (math.random(1,9)*100)
	
	if math.random(1,2)==1 then
		if math.random(1,2)==1 then
			prize = prize + 50
		else
			prize = prize + (math.random(1,9)*10)
		end
	end

	-- GET DESCRIPTION

	local t3={}
	if people ~= 1 then		
		-- more than one person
		t3[1]="Se necesita transporte para "..people.." personas a la estación ".. dropOffStation.."."
		t3[2]="A "..people.." personas les gustaría tener un pasaje a la estación " .. dropOffStation.."."
		t3[3]="¿Puedes llevar a nuestro grupo de "..people.." personas a la estación ".. dropOffStation.. "?"
		t3[4]=people.." personas están buscando un transporte a la estación "..dropOffStation.."."
		t3[5]="Nuestro grupo de "..people.." personas necesitan una nave para llegar a la estación"..dropOffStation.."."
		t3[6]="Se requiere pasaje: Grupo de "..people.." personas a la estación "..dropOffStation.."."
		t3[7]="Por favor lleva a "..people.." de nosotros a la estación "..dropOffStation.."."
	else
		-- one person only
		t3[1]="Necesita transporte a la estación ".. dropOffStation.."."
		t3[2]="Me gustaría llegar a la estación " .. dropOffStation.."."
		t3[3]="¿Puedes llevarme a la estación ".. dropOffStation.. "?"
		t3[4]="Estoy buscando un transporte a la estación "..dropOffStation.."."
		t3[5]="Estoy en necesidad de una nave para llegar a la estación"..dropOffStation.."."
		t3[6]="Pasaje requerido a la estación "..dropOffStation.."."
		t3[7]="Por favor, llévame a la estación "..dropOffStation.."."
		t3[8]="Necesito desesperadamente llegar a la estación "..dropOffStation.."."
		t3[9]="Pagaré el transporte a la estación "..dropOffStation.."."
	end
	smallDesc=t3[math.random(table.getn(t3))]
	
	local t={}
	t[1]="Hola. "
	t[2]="¿Cómo estas?"
	t[3]="Hola compañero."
	t[4]=""
	t[5]=""
	t[6]="¿Que onda amigo?"
	t[7]="Ey."
	t[8]="¿Qué hay de nuevo?"
	bigDesc=t[math.random(table.getn(t))]	
		
	local t2={}
	if people == 1 then	
		t2[1]="Necesito transporte."
		t2[2]="Me gustaría conseguir una nave."
		t2[3]="Necesito una nave ahora mismo."
		t2[4]="Llego tarde a una maldita boda."
		t2[5]="¿Alguna vez has llegado tarde a tu propia boda? Yo lo hago."
		t2[6]="Busco transporte."
		t2[7]="Busco pasaje en una nave rápida."
		t2[8]="Me gustaría alquilar una nave."
		t2[9]="Necesito subir a una nave."
		bigDesc=bigDesc.." "..t2[math.random(table.getn(t2))]
	else
		t2[1]="Necesitamos transporte. Hay "..people.." de nosotros."
		t2[2]="nos gustaría alquilar una nave. Somos un grupo de "..people.." personas."
		t2[3]="Necesitamos una nave ahora mismo. ¿Tiene espacio para "..people.." personas?"
		t2[4]="Llegamos tarde a una boda. El grupo es de "..people.." personas. ¿Tienes espacio?"
		t2[5]="Hay "..people.." personas de utilidad que necesitan llegar a un bautizo."
		t2[6]="Buscamos transporte, "..people.." de nosotros."
		t2[7]=people.." personas buscan pasaje en una nave rápida."
		t2[8]="Nos gustaría alquilar una nave. Hay "..people.." personas en nuestro grupo."
		t2[9]="Tenemos que conseguir una nave que se dirija hacia donde vamos. Hay "..people.." de nosotros."
		bigDesc=bigDesc.." "..t2[math.random(table.getn(t2))]
	end
	
	local more=math.random(0,1)
	if more==0 then
		local tm={}
		if people ~= 1 then
			tm[1]="¿Crees que puedes llevarnos allí?"
			tm[2]="¿Qué te parece?"
			tm[3]="¿Nos ayudarías?"
			tm[4]="Necesitamos ayuda, ya lo ves."
			tm[5]="Tenemos una reunión muy importante."
			tm[6]="No está muy lejos, ¿verdad?"
			tm[7]="Sólo le llevará unos minutos."
		else
			-- one
			tm[1]="¿Crees que puedes llevarme allí?"
			tm[2]="¿Qué te parece??"
			tm[3]="¿Me ayudarias?"
			tm[4]="Necesito ayuda, ya lo ves."
			tm[5]="Tengo una reunión muy importante."
			tm[6]="No está muy lejos, ¿verdad?"
			tm[7]="Sólo le llevará unos minutos."		
		end
		
		bigDesc=bigDesc.." "..tm[math.random(table.getn(tm))]
	end	
		
	local t4={}
	if people==1 then
		t4[1]="Te puedo dar ".. prize.. "$ por tu ayuda."
		t4[2]=prize.. "$ es todo lo que puedo ofrecer. ¿Quizás pague el combustible?"
		t4[3]="Puedo ofrecerte una preciosa suma de ".. prize.. "$. ¿Está bien eso?"
		t4[4]="Puedo pagar "..prize.."$."
		t4[5]="Tu remuneración será de "..prize.."$."
		t4[6]="No puedo ofrecer más de, tal vez "..prize.."$."
		t4[7]="Tal vez unos miserables "..prize.."$ bastarán."
		t4[8]="No tengo mucho dinero desde que murió mi esposa. "..prize.."$ es todo lo que tengo."
		t4[9]="¿Mencioné el pago? Oh. "..prize.."$ es todo lo que puedo pagar."
	else
		t4[1]="juntos podemos darte ".. prize.. "$."
		t4[2]=prize.. "$ es todo lo que podemos ofrecer."
		t4[3]="No estoy seguro de lo que es razonable, pero todo lo que podemos ofrecerte son ".. prize.. "$. ¿Eso está bien?"
		t4[4]="podemos pagarte "..prize.."$."
		t4[5]="Su remuneración será de "..prize.."$."
		t4[6]="No podemos ofrecer más que "..prize.."$."
		t4[7]="Tal vez unos miserables "..prize.."$, será suficiente."
		t4[8]="No tenemos mucho dinero. ¿"..prize.."$ serán?"
	end
	bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]
	
	local t5={}
	if people~=1 then
		t5[1]="Realmente necesitamos llegar allí dentro de "..timeLimit.."."
		t5[2]="Esto es realmente urgente. Tendrás "..timeLimit.." para llegar allí."
	else
		t5[1]="Realmente necesito llegar allí dentro de "..timeLimit.."."
		t5[2]="Esto es realmente urgente. Tendrás "..timeLimit.." para llegar allí."
	end

	bigDesc=bigDesc.." "..t5[math.random(table.getn(t5))]
			
	return 1
end


function canTakeMission() -- check to see if you can take this mission
	if (( getSplitSpeed() == 0 ) and ( getDistanceToStation(dropOffStation) > 50000 )) then
		return "No, gracias. Está bastante lejos y tu nave no tiene un motor divisor."
	end
	if (getFreeCabins() < people) then --or (getFreeCabins()==people) then
		return "No tienes suficiente espacio en la cabina para llevar a cabo esta misión."
	end
	return "" -- you can take a courier mission
end


function takeMission() -- upon taking the mission set up things, like:
	if (dangerous>0) then
		for i=1,dangerous do
			skill=math.random(1,2)	
			bounty=(skill*(math.random(670,1290)))
			createMissionBountyTrigger(getRandomShipID(),getRandomName(),skill,bounty,0,dropOffSystem)
		end
	end

	local desc = "llegar a "..dropOffStation
	createTimer(timerName,desc,timeLimit)

	for i=1,people do
		addPassenger(people_on_board[i])
	end
end


function update() -- update mission critical things here
	local fin=timerFinished(timerName)

   	local newDesc= "llegar a "..dropOffStation
    updateTimerDescription(timerName,newDesc)
    
	if (fin==1) then
		finishFailure()
		return 1
	end	
	
	if youDocked(dropOffStation)==1 then
		-- that's all that's needed...
		finishSuccess()
		completedMission("taxi")
		return 1
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
	for i=1,people do
		removePassenger(people_on_board[i])
	end
	destroyTimer(timerName)	
end
 -- ====================================================== CLEAN UP

function cancel()
	finishFailure()
	cleanUp()
	info2(getGenericDisappointmentQuote(prize))
end

function canCancel() -- can only cancel when docked!
	if youDockedAtAll()==0 then
		return "Necesita atracar"
	else	
		return ""
	end
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

function getPeople()
	return people.."-"
end

function getDropOff()
	return ""
end

function getDestination()
	return "estación " ..dropOffStation.." en el sistema "..dropOffSystem.."."
end

function returnImageFile()
	return "data/images/hud/missions/passengertimed.png"
end

-- ========================================================
-- MAIN!
-- ========================================================

people_on_board={}
advertPerson = getRandomName()
prize = 0
haggleExtra = 0
smallDesc = ""
bigDesc = ""
people = 0
dangerous=0
timerName = ""
timeLimit = 0

dropOffSystem = ""
dropOffStation = ""

distanceToTarget = 0
reputation_required = 0.0

