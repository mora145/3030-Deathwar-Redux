-- Local Courier Mission
-- Created: 4nd Nov, 2005
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
	if (getExperience()>50) then return 0 end
	if countStationsInSystem()<2 then return 0 end-- for local courier jobs
	
	dropOffSystem = getYourSystem()
	local dockedAt = getYourDockedStation()
	
	contactPerson = getRandomName()
	advertPerson = getRandomName()
	
	-- ok, don't get the station we're already at. that wouldn't be very interesting, would it.
	local ok=false
	while ok==false do
		dropOffStation=getRandomStation(dropOffSystem)
		if dropOffStation ~= dockedAt then 
			ok=true 
		end
	end

	prize = (getDistanceToStation(dropOffStation)/124000.0)*55
	prize = math.floor(prize)
	prize = prize * 100
	prize = prize + 3500 + (math.random(1,9)*100)
	
	if math.random(1,2)==1 then
		if math.random(1,2)==1 then
			prize = prize + 50
		else
			prize = prize + (math.random(1,9)*10)
		end
	end

	if prize==0.0 then return 0 end

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
	t2[9]="megadisco"
	t2[10]="regalo"
	t2[11]="presentación"
	t2[12]="grabación de conferencia"
	t2[13]="disq sexo (tm)"
	packageName=packageName.." "..t2[math.random(table.getn(t2))]

	local more2=math.random(14)
	if (more2==20) then
		packageName=getDesktopFile()
	end
	
	-- will output something like:  "very important holo-cube"
		
	local t3={}
	t3[1]="Local Transit of ".. packageName.." required."
	t3[2]="Local job: ".. packageName.." to be taken to " .. dropOffStation.."."
	t3[3]="Think you can take ".. packageName.." to ".. dropOffStation.. " for me?"
	t3[4]="I need this "..packageName.." taken to "..dropOffStation.." for me."
	t3[5]="I need my ".. packageName.." taken to "..dropOffStation.."."
	t3[6]="local courier job: "..packageName.." to "..dropOffStation.."."
	smallDesc=t3[math.random(table.getn(t3))]
		
	--bigDesc=smallDesc -- make the longer description
		
	local t4={}
	t4[1]="As it's local, I can give you $".. prize.. " for it."
	t4[2]="$" .. prize.. " is all I can offer."
	t4[3]="I can offer you a pricely sum of $".. prize.. ". That any good?"
	t4[4]="I can pay $"..prize.."."		
	t4[5]="Your remuneration will be $"..prize.."."
	t4[6]="I can't offer any more than, maybe $"..prize.."."
	t4[7]="Perhaps a measly $"..prize.." will suffice."
	t4[8]="I don't have much money since my wife died. $"..prize.." is all I have."
	t4[9]="Did I mention the payment? Oh. $"..prize.." is all I can pay."	
	bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]
	
	local t6={}
	t6[1]="It needs to get to ".. dropOffStation.. "."
	t6[2]="The package's final destination is just over there; "..dropOffStation.."."
	t6[3]="So the destination again, in case you forgot, was "..dropOffStation.."."
	t6[4]="You can drop it off at "..dropOffStation.."."	
	t6[5]="Take it to "..dropOffStation.."."
	t6[4]="Just take the damn thing to "..dropOffStation..", will you."
	bigDesc=bigDesc.." "..t6[math.random(table.getn(t6))]	
	
	local con={}
	con[1]="friend"
	con[2]="brother"
	con[3]="father"
	con[4]="business partner"
	con[5]="acquaintance"
	con[6]="long time friend"
	con[7]="buddy"
	con[8]="contact"
	con[9]="slave droid"
	con[10]="droid"
	local connection=con[math.random(table.getn(con))]
	
	local t7={}
	t7[1]=contactPerson.." will be waiting there for you."
	t7[2]="I've told my "..connection..", "..contactPerson.." to be waiting for it."
	t7[3]="I've informed my "..connection..". Just give it to him when you get there. Oh, his name is "..contactPerson.."."
	t7[4]="Just give the package to my "..connection..", "..contactPerson.."."
	t7[5]="drop the package off with "..contactPerson.." who will be waiting for you."
	t7[6]="you can get in contact with "..contactPerson.." when you get there. he's my "..connection.."."
	t7[7]="get the package into the hands of "..contactPerson..". he'll be waiting for you there."
	bigDesc=bigDesc.." "..t7[math.random(table.getn(t7))]
		
	local more=math.random(1)
	
	if (more==0) then
		local t5={}
		t5[1]="Will you accept?"
		t5[2]="So, what do you think?"
		t5[3]="I'll recommend you if you can get this done."
		t5[4]="It shouldn't be too hard. Hm?"	
		t5[5]="It's not far away for god's sake."
		t5[6]="It's only across the way."
		bigDesc=bigDesc.." "..t5[math.random(table.getn(t5))]		
	end	
	
	return 1 -- success
end


function canTakeMission() -- check to see if you can take this mission
	if (( getSplitSpeed() == 0 ) and ( getDistanceToStation(dropOffStation) > 50000 )) then
		return "No thanks. It's pretty far and your ship doesn't have a split drive."
	end
	return "" -- you can take a courier mission
end


function takeMission() -- upon taking the mission set up things, like:
	addPersonToStation(contactPerson,dropOffStation,"random")
	setPersonScriptFile(contactPerson,getRandomFileFrom("data/scripts/missions/courier"))
	giveYouPoss(packageName)	
end


function update() -- update mission critical things here
	if youDocked(dropOffStation)==1 then
		if youTalkedTo(contactPerson)==1 then
			finishSuccess()
			return 1 -- mission complete.
		end
	end
	return 0 -- not complete yet
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
end
 -- ====================================================== CLEAN UP

function cancel()
	finishFailure()
	cleanUp()
end

function canCancel()-- can always cancel a courier mission
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
	return dropOffStation.." in "..dropOffSystem.." system."
end

function returnImageFile()
	return "data/images/hud/missions/courier.png"
end

-- ========================================================
-- MAIN!
-- ========================================================

contactPerson = ""
advertPerson = ""
packageName = ""
prize = 0
haggleExtra = 0
smallDesc = ""
bigDesc = ""
dropOffStation = ""
dropOffSystem = ""
distanceToTarget = 0
reputation_required = 0.0

