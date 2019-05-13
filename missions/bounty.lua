-- Bounty Mission
-- Created: 4nd Nov, 2005, updated: 13 sept, 2006
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
	
	system_name = getYourSystem()
	
	number=math.random(0,3)
	
	pirate_ship=getRandomShipID()
	pirate_name=getRandomName()
	pirate_skill=math.random(1,5)

    kills_required=0

	if (pirate_skill==1) then
	    kills_required=0
	    pirate_bounty=math.random(100,200)
		number=0
		pirate_bounty = pirate_bounty * 100
	    
	elseif (pirate_skill==2) then
	    kills_required=math.random(0,4)
	    pirate_bounty=math.random(200,400)
	    number=math.random(0,1)
		pirate_bounty = pirate_bounty + ( number * 15 )
		pirate_bounty = pirate_bounty * 100
	    
	elseif (pirate_skill==3) then
		kills_required=math.random(5,10)
		pirate_bounty=math.random(35,50)
		number=math.random(1,2)
		pirate_bounty = pirate_bounty + ( number * 3 )
		pirate_bounty = pirate_bounty * 1000
	
	elseif (pirate_skill==4) then
		kills_required=math.random(10,15)
		pirate_bounty=math.random(45,70)
		number=math.random(2,3)
		pirate_bounty = pirate_bounty + ( number * 4 )
		pirate_bounty = pirate_bounty * 1000
	
	elseif (pirate_skill==5) then
		kills_required=math.random(15,25)
		pirate_bounty=math.random(70,100)
		number=math.random(3,5)
		pirate_bounty = pirate_bounty + ( number * 5 )
		pirate_bounty = pirate_bounty * 1000
	end

	prize = math.floor(pirate_bounty)

	-- GET PIRATE DESCRIPTION
	local t={}
	t[1]="violento"
	t[2]="repugnante"
	t[3]="agresivo"
	t[4]="homicida"	
	t[5]="mortífero"
	t[6]="insensato"
	t[7]="enloquecido"
	t[8]="loco"
	t[9]="loco espacial"
	t[10]="coo-coo"
	t[11]="loco con espuma en la boca"
	t[12]="bastante loco"
	local about=t[math.random(table.getn(t))]	
		
	local t3={}
	t3[1]="Recompensa: pirata "..about.." buscado muerto."
	t3[2]="pirata "..about.." buscado muerto."
	t3[3]="Recompensa: pirata "..about.."."
	t3[4]="recompensa ofrecida."
	t3[5]=about.." pirata buscado muerto."
	t3[6]="requieren ayuda con pirata "..about.."."
	t3[7]="Mata a esta escoria."
	t3[8]="Necesito tu ayuda."
	t3[9]="¿tienes pelotas?"
	t3[10]="recompensa por oferta pirata "..about.."."
	smallDesc=t3[math.random(table.getn(t3))]

	--bigDesc=smallDesc -- make the longer description
		
	local t4={}
	t4[1]="Queremos a "..pirate_name.." muerto."
	t4[2]="Podemos ofrecer "..prize.."$ por la muerte de "..pirate_name.."."
	t4[3]=prize.."$ por la muerte de "..pirate_name.."."
	t4[4]="Hace algún tiempo un pirata, "..pirate_name.." atacó mi nave. Mató a mi esposa. Ahora lo quiero muerto."
	t4[5]="Por atacar a los cruceros públicos, ofrecemos una recompensa por "..pirate_name..". "..prize.."$ deberían bastar."
	t4[6]=prize.."$ ofrecidos por la muerte de "..pirate_name.."."
	t4[7]="tenemos que librar a este universo de un asesino. Mata a "..pirate_name.." y te daré "..prize.."$."
	t4[8]="¿Tienes algo de tiempo libre? Si su respuesta es sí, entonces este trabajo podría ser para usted. Se busca muerto."
	t4[9]="Pirata "..about.." buscado muerto. Se ofrecen "..prize.."$."
	t4[10]="A veces sólo quieres venganza. Quiero venganza y estoy dispuesto a pagar por ella. "..prize.."$."
	t4[11]="Algunos lo llaman asesinato, otros lo llaman homicidio. Yo lo llamo venganza. Mata a "..pirate_name.." por mi."
	t4[12]="Si tienes los medios, entonces mata a "..pirate_name.." y te daré "..prize.."$."
	t4[13]=pirate_ship.." es la nave que quiero que vuele por los aires. "..pirate_name.." la vuela. Lo quiero muerto."
	t4[14]="Por favor, caza a "..pirate_name.." vuela en la nave "..pirate_ship..", destruyelo."
	bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]
	
	if number > 0 then
		local t5={}
		t5[1]="Puede ser que tenga amistades con él. Mátalos a ellos también si quieres."
		t5[2]="Podría estar escoltado por otros piratas."
		t5[3]="Ten cuidado, puede que no esté solo."
		t5[4]="Puede que tenga algunos amigos."
		t5[5]="Fue visto por última vez con una manada de piratas."
		t5[6]="Ten cuidado con este, puede que no esté solo."
		t5[7]="Probablemente encontrarás más de su clase."
		t5[8]="Me han informado de que vuela con otros."
		t5[9]="Es posible que te encuentres con otros "..number.." también."
		t5[10]="Tiende a quedarse con su pandilla de "..number.." naves."
		t5[11]="Tendrás que enfrentarte a otras "..number.." naves."
		t5[12]="Hay una gran posibilidad de que esté con otros."
		t5[13]="Por favor, tenga en cuenta que tendrá una escolta de "..number.." naves."
		t5[14]="Se le unirán "..number.." naves."
		bigDesc=bigDesc.." "..t5[math.random(table.getn(t5))]			
	end
	
	local more=math.random(1)
	
	if (more==0) then
		local t5={}
		t5[1]="¿Aceptarás?"
		t5[2]="Entonces, ¿qué te parece?"
		t5[3]="¿Eres lo suficientemente hombre?"
		t5[4]="No es muy difícil para ti, ¿verdad?"	
		t5[5]="Si, no?"
		t5[6]="Haz eso por mí."
		t5[7]="¿Qué vas a decir?"
		t5[8]="Tengo el dinero si tú tienes los medios."
		t5[9]="Termina con esto y estaré encantado."
		t5[10]="¿Si?"
		t5[11]="¿Lo harás?"
		bigDesc=bigDesc.." "..t5[math.random(table.getn(t5))]		
	end	
	
	bigDesc=bigDesc.." [br] [br] Nave objetivo: "..pirate_ship.." pilotada por "..pirate_name..". [br] "
	
	if kills_required ~= 0 then
		local t6={}
		t6[1]="Necesitarás al menos "..kills_required.." muertes para asumir este trabajo. ¿Estás a la altura?"
		t6[2]="No aceptaré a ningún piloto con menos de "..kills_required.." muertes."
		t6[3]="Necesitas "..kills_required.." muertes para asumir esta misión."
		t6[4]="Para ahorrar mi tiempo no te lo ofreceré a menos que ya hayas matado a "..kills_required.."."
		t6[5]="Un índice de muerte de "..kills_required.." se requiere."
		t6[6]="Si has matado a "..kills_required.." naves, entonces eres la persona que estoy buscando."
		t6[7]="Necesitaré ver pruebas de una tasa de mortalidad de "..kills_required.." o superior."
		t6[8]="requisito de clasificación de mortalidad: >"..kills_required.."."
		bigDesc=bigDesc.." "..t6[math.random(table.getn(t6))]
	else
		local t6={}
		t6[1]="No es muy difícil, así que no necesitas ninguna muerte confirmada para aceptar este trabajo."
		t6[2]="Requisito de clasificación de muerte: 0"
		t6[3]="Esto es una corrida de leche. No se requieren muertes para tomarlo."
		t6[4]="Esto es para un piloto novato. No es necesario matar a nadie."
		t6[5]="No se requieren muertes."
		t6[6]="No es necesario matar a nadie."
		t6[7]="No necesito un profesional. Cualquiera lo hará."
		t6[8]="Cero muertes requeridas para tomar este trabajo."
		bigDesc=bigDesc.." "..t6[math.random(table.getn(t6))]
	end

	return 1
end


function canTakeMission() -- check to see if you can take this mission
	if getKills() < kills_required then 		
		return "No pareces lo suficientemente duro para aceptar este trabajo. Vuelve cuando tengas más experiencia en combate." 
	end
	return ""
end


function takeMission()
	createMissionBountyTrigger(pirate_ship,pirate_name,pirate_skill,pirate_bounty,1,getYourSystem())
	
	for i=1,number do
		skill=math.random(1,pirate_skill) 		
		bounty=(pirate_bounty/10)
		createMissionBountyTrigger(getRandomShipID(),getRandomName(),skill,bounty,0,getYourSystem())
	end	
end


function update() -- update mission critical things here
	local haveKilled=youHaveKilled(pirate_ship)
	-- 1 = yes
	-- 0 = no, still alive
	-- -1 = someone else killed him
	local hasntLeft=(getYourSystem()==system_name)
	
	if (hasntLeft==false) then
		completeMission(0, prize, advertPerson, smallDesc, bigDesc, "¿Te vas a ir? ¿Sin matarlo? Supongo que tendré que encontrar a alguien más que haga el trabajo.")
		cleanUp()
		return 1
	elseif (haveKilled==1) then
		finishSuccess()
		return 1
	elseif (haveKilled==-1) then
		completeMission(0, prize, advertPerson, smallDesc, bigDesc, "Bueno, alguien más lo mató así que no conseguirás nada de dinero. Haz un mejor intento la próxima vez.")
		cleanUp()
		return 1
	elseif (haveKilled==-2) then
		createMissionBountyTrigger(pirate_ship,pirate_name,pirate_skill,pirate_bounty,1,getYourSystem())
	end
	return 0
end

function finishSuccess() -- clear up stuff here
	cleanUp()
	local t6={}
	t6[1]="Finalmente está muerto. Los operadores finalmente pueden descansar un poco mejor. ¡Gracias!"
	t6[2]="¡Por fin! ¡Gracias!"
	t6[3]="Ese es el último de ustedes, "..pirate_name.."."
	t6[4]="No más "..pirate_name..". Gracias."
	t6[5]="Ya era hora. Había causado tantos problemas."
	t6[6]="Gracias."
	t6[7]="Muerto, finalmente. Gracias."
	completeMission(1, prize, advertPerson, smallDesc, bigDesc, getGenericThanksQuote(prize).." "..t6[math.random(table.getn(t6))])
end

function finishFailure() -- clear up stuff here
	completeMission(0, prize, advertPerson, smallDesc, bigDesc, getGenericDisappointmentQuote(prize))
	cleanUp()
end

 -- ====================================================== CLEAN UP
function cleanUp()
end
 -- ====================================================== CLEAN UP

function cancel()
	finishFailure()
	cleanUp()
end

function canCancel()
	-- can always cancel a bounty mission
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
	return ( pirate_ship..", en el sistema, "..system_name.."." )
end

function returnImageFile()
	return "data/images/hud/missions/bounty.png"
end

-- ========================================================
-- MAIN!
-- ========================================================

contactPerson = getRandomName()
advertPerson = getRandomName()

number = 0 -- number of pirate friends
pirate_ship=""
pirate_name=""
pirate_skill="" 		
pirate_bounty=""
prize = 0
haggleExtra = 0
smallDesc = ""
bigDesc = ""
kills_required = 0
system_name = ""