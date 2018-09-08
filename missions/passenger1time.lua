-- Passenger Mission timed
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
    if (getExperience()<15) then return 0 end
	
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

    timerName = advertPerson.." PASSENGER"

	people=1
	if math.random(1,3)==1 then	 -- more people
		people=2
	end

	for i = 1,people do 
		people_on_board[i]=getRandomName()
	end

	if (math.random(4)==1) then
		dangerous=math.random(1,people)
	end
	
	prize = 50
	prize = prize + (getDistanceToStation(dropOffStation)/124000.0)*(0.8)
	prize = prize + (( people - 1 ) * 25 )
	if (dangerous>0) then
		prize = prize * (dangerous*math.random(1.2,1.4))
	end

	local diff=math.random(1,4)

	if (diff==1) then
  		timeLimit="3:00"
  		prize = prize * math.random(1.7,1.8)

	elseif (diff==2) then
	    timeLimit="3:30"
		prize = prize * math.random(1.5,1.6)

	elseif (diff==3) then
    	timeLimit="4:00"
	    prize = prize * math.random(1.4,1.45)

	elseif (diff==4) then
    	timeLimit="5:00"
	    prize = prize * math.random(1.3,1.35)
	end
	
	prize = prize + (math.random(1,9))
	prize = math.floor(prize)
	prize = prize * 100

	-- GET DESCRIPTION
	local t3={}
	if people ~= 1 then		
		-- more than one person
		t3[1]="Need transport for "..people.." people to ".. dropOffSystem.."."
		t3[2]=people.." would like passage to the " .. dropOffSystem.." system."
		t3[3]="Can you take our group of "..people.." to the ".. dropOffSystem.. " system?"
		t3[4]="We "..people.." are looking for a transport to "..dropOffSystem.."."
		t3[5]="Our group of "..people.." are in need of a ship to the "..dropOffSystem.." system."
		t3[6]="Passage required: Group of "..people.." to the "..dropOffSystem.." system."
		t3[7]="Please take "..people.." of us to "..dropOffSystem.."."
	else
		-- one person only
		t3[1]="Need urgent transport to ".. dropOffSystem.."."
		t3[2]="I would like quick passage to the " .. dropOffSystem.." system."
		t3[3]="Can you take me to the ".. dropOffSystem.. " system?"
		t3[4]="I'm looking for quick transport to "..dropOffSystem.."."
		t3[5]="I am in need of a fast ship to the "..dropOffSystem.." system."
		t3[6]="Passage required to the "..dropOffSystem.." system."
		t3[7]="Please take me to "..dropOffSystem.."."
		t3[8]="I quickly need to get to the "..dropOffSystem.." system."
		t3[9]="I will pay for transport to the "..dropOffSystem.." system."		
	end
	smallDesc=t3[math.random(table.getn(t3))]
	
	local t={}
	t[1]="Hi. "
	t[2]="How are you?"
	t[3]="Howdy partner."
	t[4]=""	
	t[5]=""
	t[6]="Rock on dude."
	t[7]="Hey."
	t[8]="What up?"
	bigDesc=t[math.random(table.getn(t))]	
		
	local t2={}
	if people == 1 then	
		t2[1]="I'm in need of transport."
		t2[2]="I'd like to get a ship."
		t2[3]="I need a ship right now."
		t2[4]="I'm late for a damn wedding."	
		t2[5]="Have you ever been late for your own wedding? I am."
		t2[6]="I seek transport."
		t2[7]="I seek passage on a fast ship."
		t2[8]="I'd like to hire a ship."
		t2[9]="I need to get on a ship."
		bigDesc=bigDesc.." "..t2[math.random(table.getn(t2))]
	else
		t2[1]="We're in need of transport. There are "..people.." of us."
		t2[2]="we'd like to hire a ship. We're a group of "..people.."."
		t2[3]="We need a ship right now. Do you have room for "..people.." people?"
		t2[4]="We're late for a wedding."	
		t2[5]="We need to get to a christening."
		t2[6]="We seek transport. "..people.." of us."
		t2[7]="We seek passage on a fast ship."
		t2[8]="We'd like to hire a ship."
		t2[9]="We need to get on a ship."	
		bigDesc=bigDesc.." "..t2[math.random(table.getn(t2))]
	end
	
	local more=math.random(0,1)
	if more==0 then
		local tm={}
		if people ~= 1 then
			tm[1]="Do you think you can get us there?"
			tm[2]="What do you think?"
			tm[3]="Would you help us?"
			tm[4]="We need help, you see."			
			tm[5]="We've a very important meeting."
		else
			-- one
			tm[1]="Do you think you can get me there?"
			tm[2]="What do you think?"
			tm[3]="Would you help me?"
			tm[4]="I need help, you see."
			tm[5]="I've a very important meeting."
		end
		bigDesc=bigDesc.." "..tm[math.random(table.getn(tm))]
	end	
		
	local t4={}
	if people==1 then
		t4[1]="I can give you $".. prize.. " for your help."
		t4[2]="$" .. prize.. " is all I can offer. Perhaps it'll pay for the fuel?"
		t4[3]="I can offer you a pricely sum of $".. prize.. ". That any good?"
		t4[4]="I can pay $"..prize.."."		
		t4[5]="Your remuneration will be $"..prize.."."
		t4[6]="I can't offer any more than, maybe $"..prize.."."
		t4[7]="Perhaps a measly $"..prize.." will suffice."
		t4[8]="I don't have much money since my wife died. $"..prize.." is all I have."
		t4[9]="Did I mention the payment? Oh. $"..prize.." is all I can pay."	
	else
		t4[1]="together we can give you $".. prize.. "."
		t4[2]="$" .. prize.. " is all we can offer."
		t4[3]="I'm not sure what's fair, but all we can offer you is $".. prize.. ". That any good?"
		t4[4]="we can pay $"..prize.."."		
		t4[5]="Your remuneration will be $"..prize.."."
		t4[6]="We can't offer any more than $"..prize.."."
		t4[7]="Perhaps a measly $"..prize.." will suffice."
		t4[8]="We don't have much money, so will $"..prize.." do?"
	end
	bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]
	
	local t6={}
	if people~=1 then
		t6[1]="Our destination is ".. dropOffStation.. " in the "..dropOffSystem.." system."
		t6[2]="Our final destination is "..dropOffStation.." in the "..dropOffSystem.." system."
		t6[3]="We need dropping off in "..dropOffSystem..". At "..dropOffStation.." specifically."
		t6[4]="You can drop us off at "..dropOffStation..". That's in the "..	dropOffSystem.." system."
		t6[5]="Take us to "..dropOffStation.." in "..dropOffSystem.."."
		t6[6]="Get us to "..dropOffStation.." / "..dropOffSystem..", and we'll be in time for the engagement."
	else
		t6[1]="I need to get to ".. dropOffStation.. " in the "..dropOffSystem.." system."
		t6[2]="My meeting is on "..dropOffStation..". Do you know it? it's in the "..dropOffSystem.." system."
		t6[3]="Just drop me off at "..dropOffStation.." in the "..dropOffSystem.." system."
		t6[4]="Get me to my destination: "..dropOffStation.." / "..	dropOffSystem.."."
		t6[5]="If you can just take me to "..dropOffStation.." in the "..dropOffSystem.." system."
	end
	bigDesc=bigDesc.." "..t6[math.random(table.getn(t6))]	
	
	local t5={}
	if people~=1 then
		t5[1]="We really need to get there within "..timeLimit.."."
		t5[2]="This is really urgent. You'll have "..timeLimit.." to get there."
	else
		t5[1]="I really need to get there within "..timeLimit.."."
		t5[2]="This is really urgent. You'll have "..timeLimit.." to get there."
	end

	bigDesc=bigDesc.." "..t5[math.random(table.getn(t5))]
	
	return 1
end


function canTakeMission() -- check to see if you can take this mission
	if (( getSplitSpeed() == 0 ) and ( getDistanceToStation(dropOffStation) > 50000 )) then
		return "No thanks. It's pretty far and your ship doesn't have a split drive."
	end
	if (getFreeCabins() < people) then --or (getFreeCabins()==people) then
		return "You do not have enough cabin space to take this mission."
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

	local desc = "get to "..dropOffStation
	createTimer(timerName,desc,timeLimit)

	--print("LUA -> Adding passengers...")
	for i=1,people do
		addPassenger(people_on_board[i])
	end
end


function update() -- update mission critical things here
	local fin=timerFinished(timerName)

   	local newDesc= "get to "..dropOffStation
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
end

function canCancel() -- can only cancel when docked!
	if youDockedAtAll()==0 then
		return "Need to dock"
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

function getDropOff()
	return ""
end

function getDestination()
	return dropOffStation.." in "..dropOffSystem.." system."
end

function getPeople()
	return people.."-"
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

