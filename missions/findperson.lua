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
	t3[1]="I'm looking for "..person_name.."."
	t3[2]="Desperately seeking "..person_name.."."
	t3[3]="Can you help find "..person_name.."?"
	t3[4]="Seeking "..person_name..". Will pay for location."
	t3[5]=person_name.." is missing."
	smallDesc=t3[math.random(table.getn(t3))]
	
	local t={}
	t[1]="Hi. "
	t[2]="How are you?"
	t[3]="Howdy partner."
	t[4]=""	
	t[5]="Hey."
	t[6]="What up?"
	bigDesc=t[math.random(table.getn(t))]	
		
	local t2={}
	t2[1]="I'm looking for a person by the name of "..person_name.."."
	t2[2]=person_name.." is missing and I'd like someone to find them."
	t2[3]="I'm looking for someone to help me find my friend, "..person_name.."."
	bigDesc=bigDesc.." "..t2[math.random(table.getn(t2))]

    for i=1,numberOfClues do
        if (i==1) then 
			bigDesc=bigDesc.." Last I heard, he was near a"..getSunClassOfSystem(person_system).."."
		end
        if (i==2) then 
        	local planets=getNumberOfPlanetsInSystem(person_system)
        	if (planets==1) then
				bigDesc=bigDesc.." I think I remember him saying his system had just the single planet."
			else
			    bigDesc=bigDesc.." I think I remember him saying his system had "..planets.." planets & moons."
			end
		end
        if (i==3) then 
        	local stats=getNumberOfStationsInSystem(person_system)
        	if (stats==1) then
        		bigDesc=bigDesc.." and there was "..stats.." in his system."
        	else
				bigDesc=bigDesc.." and there were "..stats.." in his system."
			end
		end
        if (i==4) then 
			bigDesc=bigDesc.." When we talked last, his communication was garbled. All I heard "..getFirstLetterOfSystem(person_system).."."
		end		
	end

    bigDesc=bigDesc.." If you find him, talk to him to confirm his identity."

	local t4={}
	t4[1]="I can give you $".. prize.. " for your help."
	t4[2]="$" .. prize.. " is all I can offer."
	t4[3]="I can offer you a pricely sum of $".. prize.. ". That any good?"
	t4[4]="I can pay $"..prize.."."
	t4[5]="Your remuneration will be $"..prize.."."
	t4[6]="I can't offer any more than, maybe $"..prize.."."
	t4[7]="Perhaps a measly $"..prize.." will suffice."
	t4[8]="Did I mention the payment? Oh. $"..prize.." is all I can pay."
	bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]
	
	local t6={}
	-- when you find them come back and see me. generateThanksForMissingConvo....
	
	t6[1]="When you have found him come back and see me."
	t6[2]="Come back here and talk to me. I'll pay you and I can finally meet him again."
	bigDesc=bigDesc.." "..t6[math.random(table.getn(t6))]
	
	bigDesc=bigDesc.." You'll be able to find me here, "..home_station.." in the "..home_system.." system."
	bigDesc=bigDesc.." Oh, by the way, my name's "..advertPerson.."."

	return 1
end


function canTakeMission() -- check to see if you can take this mission
	if (( getSplitSpeed() == 0 ) and ( getDistanceToStation(person_station) > 50000 )) then
		return "No thanks. It's pretty far and your ship doesn't have a split drive."
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
			info("Seems you found "..person_name..". Better head back to "..home_station.." in the "..home_system.." system.")
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
	return "UNKNOWN"-- [ "..person_station.." - "..person_system.." ]"
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

