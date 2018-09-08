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
	if (getExperience()<60) then return 0 end

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
		pickupStation=getRandomStation(pickupSystem)
		if ((getDistanceToStation(pickupStation)/124000.0) < 60) then
			if pickupStation ~= dockedAt then 
				if pickupStation ~= dropOffStation then 
					ok=true
				end
			end
		end
	end -- the station the person is on

	
	prize = 15
	prize = prize + (getDistanceToSystem(pickupSystem)/124000.0)*0.3
	--TODO This should use distance form pickup to dropoff station
	--prize = prize + (getDistanceToStation(dropOffStation)/124000.0)*2.5
	
	dangerous=math.random(0,1)
	if (dangerous==1) then
		prize = prize * math.random(1.2,1.4)
		prize = math.floor(prize)
	end
	prize = prize + math.random(0,3)
	prize = math.floor(prize)
	prize = prize * 1000
	
	priceBoost = 0
	if (math.random(10)==1) then
		priceBoost = 1
		prize = prize * 2
	end
	
	photoPerson = getRandomName()		-- who you're taking the photo of
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
	t3[1]="Recon job for good candidate."
	t3[2]="I need some information about a person."
	t3[3]="photo required of ".. photoPerson.. " on "..pickupStation
	t3[4]="Secret Recon Mission to "..pickupSystem.."."
	t3[5]="Require loyal pilot for... photography."
	t3[6]="Photograph of "..photoPerson.." required for research."
	t3[7]="Want to give us a hand?"
	t3[8]="Help us out and we'll help you out. With money"
	t3[9]="photo of "..photoPerson.." required in ".. pickupSystem .."."
	t3[10]="Where is my brother?"
	t3[11]="Have you seen this man?"
	t3[12]="Missing: "..photoPerson.."."
	smallDesc=t3[math.random(table.getn(t3))]
	
	if (dangerous==1) then
		smallDesc=smallDesc.." (Warning: Dangerous)"
	end
	
	local t={}
	t[1]="Good day. "
	t[2]="Are you loyal and trustful? Don't be. It'll get you killed."
	t[3]="Glad to see you're interested."
	t[4]=""	
	t[5]=""
	t[6]="I could use a pilot like yourself."
	bigDesc=t[math.random(table.getn(t))]	
		
	local t2={}
	t2[1]="You'll find "..photoPerson.." on board "..pickupStation..". I need evidence that this person is on-board at this time. That's in the ".. pickupSystem.." system."
	t2[2]="I think someone's trying to kill me. Does he really exist? Take a photo of "..photoPerson.." on board "..pickupStation.." in the "..pickupSystem.." system."
	t2[3]="I'm not sure if "..photoPerson.." is on board "..pickupStation.." in "..pickupSystem..". I want you to get me a picture of him then I'll send the boys around."
	t2[4]="I'm having trouble with a few people. In particular, "..photoPerson.." on board "..pickupStation.." in the "..pickupSystem.." system. Take a photo of him for me."
	t2[5]="I want a photo taken. I don't want questions asked. Here are the details: Person: "	..photoPerson.." Station: "..pickupStation.." in the "..pickupSystem.." system."
	bigDesc=bigDesc.." "..t2[math.random(table.getn(t2))]
	
	local more=math.random(0,1)
	if more==0 then
		local tm={}
		tm[1]="What do you say?"
		tm[2]="What do you think?"
		tm[3]="Would you help us?"
		tm[4]="You think you got what it takes?"
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
		t4[6]="I think you'll find $"..prize.." is ample for this work."
		bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]
	end
	
	-- who?
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
	if hasUpgrade("recon camera")==0 then
		giveUpgrade("recon camera")
		info2("You have been afforded a recon camera to accomplish this mission.")
	else
		info2("You already seem to have a recon camera. Use that to accomplish this mission.")
	end	

	-- add the photo person
	addPersonToStation(photoPerson,pickupStation,"random")
	setPersonScriptFile(photoPerson,"freeform")

	-- add the contact person
	addPersonToStation(contactPerson,dropOffStation,"random")
	setPersonScriptFile(contactPerson,"freeform")
	
	if (dangerous==1) then
		-- send someone out to get you in the target system...
		which = math.random(0,1) 
		if (which==0) then
			createMissionBountyTrigger(getRandomShipID(),getRandomName(),math.random(3,5),math.random(800,1280),0,dropOffSystem)	
		elseif (which==1) then
		    createMissionBountyTrigger(getRandomShipID(),getRandomName(),math.random(3,5),math.random(800,1280),0,pickupSystem)
		end
	end	
end


function update() -- update mission critical things here
	local photo_taken=0
		
	if photoContains(photoPerson)==1 then
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
	setPersonScriptFile(photoPerson,"freeform")
	setPersonScriptFile(contactPerson,"freeform")
	
	removePersonFromStation(photoPerson,pickupStation)
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
	return pickupStation.." in "..pickupSystem.." system."
end

function returnImageFile()
	return "data/images/hud/missions/photograph_person.png"
end

function hasPriceBoost()
	return priceBoost
end

-- ========================================================
-- MAIN!
-- ========================================================

photoPerson = getRandomName()
contactPerson = getRandomName()
advertPerson = getRandomName()
prize = 0
haggleExtra = 0
priceBoost = 0
smallDesc = ""
bigDesc = ""
people = 0

dangerous = 0

dropOffSystem = ""
dropOffStation = ""
pickupStation = ""
pickupSystem = ""

distanceToTarget = 0
reputation_required = 0.0

