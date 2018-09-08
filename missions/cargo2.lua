-- Cargo Mission v2. you don't have to bring it back to a person.
-- Created: 15th Nov, 2005
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
	if (getExperience()<10) then return 0 end

	dropOffSystem = getYourSystem()
	dropOffStation = getYourDockedStation()

	local dockedAt = getYourDockedStation()
	
	local ok=false
	local closeCount=10
	while closeCount>0 do
		pickupSystem=getRandomSystem()
		pickupStation=getRandomStation(pickupSystem)
		if ((getDistanceToStation(pickupStation)/124000.0) < 40) then
			if pickupStation ~= dockedAt then 
				ok=true
				break
			end
		end
		closeCount = closeCount - 1
	end
	while ok==false do
		pickupSystem=getRandomSystem()
		pickupStation=getRandomStation(pickupSystem)
		if ((getDistanceToStation(pickupStation)/124000.0) < 60) then
			if pickupStation ~= dockedAt then 
				ok=true 
			end
		end
	end
	
	if (math.random(5)==1) then
		dangerous=1
	end
	
	prize = 15
	prize = prize + (getDistanceToStation(pickupStation)/124000.0)*0.2
	if (dangerous==1) then
		prize = prize * (math.random(1.1,1.3))
	end
	prize = math.floor(prize)
	prize = prize * 1000
	
	priceBoost = 0
	if (math.random(10)==1) then
		priceBoost = 1
		prize = prize * 2
	end

	deviceName="container "..math.random(23,44646)

	-- GET PACKAGE NAME/TYPE
	local t={}
	t[1]="important"
	t[2]="high security"
	t[3]="low security"
	t[4]="very important"
	t[5]="low importance"
	t[6]="urgent"
	t[7]="secured"
	packageName=t[math.random(table.getn(t))]	
		
	local t2={}
	t2[1]="container"
	t2[2]="contained engine"
	t2[3]="engine"
	t2[4]="thruster pack"
	t2[5]="packed wardrobe"
	t2[6]="captain's chair"
	t2[7]="difference engine"
	t2[8]="engine component"
	t2[9]="package"
	t2[10]="present"
	t2[11]="gift"
	t2[12]="item"
	t2[13]="wedding gift"
	t2[14]="ipod"
	t2[15]="nintendo ds"
	t2[16]="k610"
	t2[17]="mk IV device"
	t2[18]="reactor"
	t2[19]="wii"
	t2[20]="wine"
	t2[21]="beer"
	t2[22]="sake"
	packageName=packageName.." "..t2[math.random(table.getn(t2))]
	
	if math.random(0,1)==1 then
		local tractor={}
		tractor[1]="Do you have a tractor beam?"
		tractor[2]="A tractor beam is required."
		tractor[3]="You'll need to tractor beam this cargo."
		tractor[4]="tractor beam required."
		tractor[5]="do you own a tractor beam?"
		tractor[6]="tractor beam ownership required."
		bigDesc=bigDesc.." "..tractor[math.random(table.getn(tractor))]
	end
		
	local t3={}
	t3[1]="Transit of ".. packageName.." required."
	t3[2]=packageName.." to be picked up from " .. pickupSystem.."."
	t3[3]="Pick up a container in ".. pickupSystem.. " for me?"
	t3[4]="I need my container picked up."
	t3[5]="I need my cargo brought from the "..pickupSystem.." system for me."
	t3[6]="Cargo pickup job: "..packageName.."."
	t3[7]="get my cargo from "..pickupSystem.."."
	t3[8]="I need my "..packageName.."."
	t3[9]=packageName.." pickup."
	smallDesc=t3[math.random(table.getn(t3))]
	
	if (dangerous==1) then
		smallDesc=smallDesc.." (Warning: Dangerous)"
	end
		
	--bigDesc=smallDesc -- make the longer description
		
	local t4={}
	t4[1]="I can give you $".. prize.. " for it."
	t4[2]="$" .. prize.. " is all I can offer."
	t4[3]="I can offer you a pricely sum of $".. prize.. ". That any good?"
	t4[4]="I can pay $"..prize.."."		
	t4[5]="Your remuneration will be $"..prize.."."
	t4[6]="I can't offer any more than, maybe $"..prize.."."
	t4[7]="Perhaps a measly $"..prize.." will suffice."
	t4[8]="I don't have much money since my grandmother died. $"..prize.." is all I have."
	t4[9]="Did I mention the payment? Oh. $"..prize.." is all I can pay."	
	bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]
	
	local t6={}
	t6[1]="You need to pick it up from ".. pickupStation.. ", "..pickupSystem.."."
	t6[2]="The package's final destination is here, but you'll have to pick it up from "..pickupStation..", "..pickupSystem.."."
	t6[3]="Get my floating cargo container from "..pickupStation.." in the "..pickupSystem.." system."
	t6[4]="you'll need to get it from "..pickupStation.." in "..pickupSystem.."."
	t6[5]="Bring it from "..pickupStation..", "..pickupSystem.."."
	bigDesc=bigDesc.." "..t6[math.random(table.getn(t6))]	

	bigDesc=bigDesc.." Then bring it back here, "..dropOffStation.." in the "..dropOffSystem.." system."
	
	bigDesc=bigDesc.." [br] Just leave it outside the station and I'll pick it up."
		
	local more=math.random(1)
	
	if (more==0) then
		local t5={}
		t5[1]="Will you accept?"
		t5[2]="So, what do you think?"
		t5[3]="I'll recommend you if you can get this done."
		t5[4]="It shouldn't be too hard. Hm?"	
		bigDesc=bigDesc.." "..t5[math.random(table.getn(t5))]		
	end	
	
	bigDesc=bigDesc.." You'll obviously need a tractor beam for this job."
	
	return 1
end


function canTakeMission() -- check to see if you can take this mission
	if (( getSplitSpeed() == 0 ) and ( getDistanceToStation(pickupStation) > 50000 )) then
		return "No thanks. It's pretty far and your ship doesn't have a split drive."
	end
	
	local hasTractor1 = hasUpgrade("m1 yacon mk 1 tractor beam")
	local hasTractor2 = hasUpgrade("m2 winchester tractor beam")
	local hasTractor3 = hasUpgrade("m3 yokohama cruise tractor beam")
	if (( hasTractor1 + hasTractor2 + hasTractor3 ) == 0 ) then
		return "You'll need a tractor beam. Come back when you have one."
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
		    createMissionBountyTrigger(getRandomShipID(),getRandomName(),skill,bounty,0,pickupSystem)
		end		
	end

	-- add a cargo item outside destination station
	putCargoContainerOutsideStation(deviceName,pickupStation,contactPerson)
	--print("cargo container "..deviceName.." has been made outside "..pickupStation.." in LUA")
end


function update() -- update mission critical things here
	local arrive = ItemIsOutsideStation(deviceName,dropOffStation)

	if (youDocked(dropOffStation) ==1) then
		if (arrive ==1) then
			finishSuccess()
			return 1 -- mission complete.
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
	removeCargoContainer(deviceName)
end
 -- ====================================================== CLEAN UP

function cancel()
	-- we don't want to make the cargo container disappear if you have it so
	-- just make the guy you're supposed to meet go away and leave the cargo container to float always.
	finishFailure()
end

function canCancel()
	-- can always cancel a cargo mission
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
	return "data/images/hud/missions/cargo.png"
end

function hasPriceBoost()
	return priceBoost
end

-- ========================================================
-- MAIN!
-- ========================================================

contactPerson = getRandomName()
advertPerson = getRandomName()
packageName = ""
prize = 0
haggleExtra = 0
priceBoost = 0
smallDesc = ""
bigDesc = ""
dropOffSystem = ""
dropOffStation = ""
dangerous =0
pickupStation = ""
pickupSystem = ""

distanceToTarget = 0
reputation_required = 0.0
deviceName = ""

--print("LUA -> contact Person: "..contactPerson)
--print("LUA -> advert Person: "..advertPerson)
--print("LUA -> Main run OK.")

