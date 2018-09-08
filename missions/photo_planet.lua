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
		t4[1]="The remuneration for this action will be $".. prize.. "."
		t4[2]="$" .. prize.. " is all we can offer."
		t4[3]="I've been ordered to pay you $".. prize.. " for your effort."
		t4[4]="we can pay $"..prize.."."		
		t4[5]="Your remuneration will be $"..prize.."."
		t4[6]="I think you'll find $"..prize.." is ample for this kind of work."
		bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]			
	end

	local t3={}
	t3[1]="Council Research: Scientific data required."
	t3[2]="Planetary data required."
	t3[3]="Do you like taking pictures of planets?"
	t3[4]="Scanning of planet required."
	t3[5]="Scanning of "..photoPlanet.." required."
	t3[6]="Planetary research photography required."
	t3[7]="Council research: "..photoPlanet.."."
	smallDesc=t3[math.random(table.getn(t3))]
	
	if (dangerous==1) then
		smallDesc=smallDesc.." (Warning: Dangerous)"
	end
	
	local t={}
	t[1]="Afternoon. "
	t[2]="We're looking for a scientific researcher to help us out."
	t[3]="Glad to see you're interested."
	t[4]=""	
	t[5]="We're researching possible reasons for the annihilation of "..photoPlanet.."."
	t[6]="We could use a pilot like yourself."
	bigDesc=t[math.random(table.getn(t))]	
		
	local t2={}
	t2[1]="You'll need to photograph "..photoPlanet..". It's in the "..pickupSystem.." system."
	t2[2]="The job's easy. Take a photo of "..photoPlanet..". You'll need to get to the "..pickupSystem.." system."
	t2[3]="Head over to "..pickupSystem.." and look for "..photoPlanet..". Take a photo of it then bring it back."
	t2[4]="We need a photo of the atmosphere from "..photoPlanet..". Get to "..pickupSystem.." and you'll find it there."
	t2[5]="It's a distinct planet. head over to "..photoPlanet.." and take a photo. It's in the "..pickupSystem.." system."
	bigDesc=bigDesc.." "..t2[math.random(table.getn(t2))]
	
	local more=math.random(0,1)
	if more==0 then
		local tm={}
		tm[1]="It's just a simple research mission. Think you can do it?"
		tm[2]="What do you think?"
		tm[3]="Would you help us out?"
		tm[4]="The results might help us to understand what happened."
		tm[5]="Are you willing?"
		bigDesc=bigDesc.." "..tm[math.random(table.getn(tm))]
	end	
		
	if moneyFirst~=1 then	
		local t4={}
		t4[1]="The remuneration for this action will be $".. prize.. "."
		t4[2]="$" .. prize.. " is all we can offer."
		t4[3]="I've been ordered to pay you $".. prize.. " for your effort."
		t4[4]="we can pay $"..prize.."."		
		t4[5]="Your remuneration will be $"..prize.."."
		t4[6]="I think you'll find $"..prize.." is ample for this kind of work."
		bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]
	end
	
	local t6={}
	t6[1]="Once you have the photo, bring it back to "..contactPerson.." at "..dropOffStation.." in "..dropOffSystem.."."
	t6[2]="Your job is complete when you take the photo back to "..contactPerson.." on board "..dropOffStation.." in "..dropOffSystem.."."
	t6[3]="I've got someone waiting for you at "..dropOffStation.." in "..dropOffSystem..". Give the photo to "..contactPerson.." once you get there."
	t6[4]="You can drop the evidence off at "..dropOffStation.." in "..dropOffSystem..". hand it to "..contactPerson.." and we'll pay you."
	t6[5]="I then want to see the photo in my friend's hands. "..contactPerson.." will be waiting for you at "..dropOffStation.." in "..dropOffSystem.."."
	bigDesc=bigDesc.." "..t6[math.random(table.getn(t6))]
	
	local t7={}
	t7[1]="a camera will be provided."
	t7[2]="We'll supply you with a camera."
	t7[3]="You'll also get a camera."
	t7[4]="A Camera is included."
	t7[5]="Don't worry, the camera's included."
	bigDesc=bigDesc.." "..t7[math.random(table.getn(t7))]
	
	return 1
end


function canTakeMission() -- check to see if you can take this mission
	if (( getSplitSpeed() == 0 ) and ( getDistanceToStation(dropOffStation) > 50000 )) then
		return "No thanks. It's pretty far and your ship doesn't have a split drive."
	end
 	if (stillHavePhotoMission()==1) then
		return "You can only have one photo mission at a time."
	end
	return ""
end


function takeMission() -- upon taking the mission set up things, like:
	if (dangerous==1) then
		skill=math.random(1,2)	
		bounty=(skill*(math.random(670,1290)))
		createMissionBountyTrigger(getRandomShipID(),getRandomName(),skill,bounty,0,pickupSystem)
	end

	if hasUpgrade("recon camera")==0 then
		giveUpgrade("recon camera")
		info2("You have been afforded a recon camera to accomplish this mission.")
	else
		info2("You already seem to have a recon camera. Use that to accomplish this mission.")
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
		removeUpgrade("recon camera") -- removes photos and stuff too.
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
	return dropOffStation.." in "..dropOffSystem.." system."
end

function getDestination()
	return photoPlanet.." in "..pickupSystem.." system."
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

