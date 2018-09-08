-- Courier Mission
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
	if (getExperience()<10) then return 0 end

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

	if (math.random(9)==1) then
		dangerous=1
	end
	
	prize = (getDistanceToStation(dropOffStation)/124000.0)*2.0
	if (dangerous==1) then
		prize = prize * (math.random(1.2,1.4))
	end
	prize = prize + (math.random(1,9))
	prize = math.floor(prize)
	prize = prize * 100
	prize = prize + 5000

	-- GET PACKAGE NAME/TYPE
	local t={}
	t[1]="small"
	t[2]="tiny"
	t[3]="well wrapped"
	t[4]="coveted"	
	t[5]="important"
	t[6]="religious"
	t[7]="single"
	t[8]="encoded"
	t[9]="encrypted"
	t[10]="high security"
	t[11]="low security"
	t[12]="very important"
	t[13]="low importance"
	t[14]="urgent"
	t[15]="secured"
	packageName=t[math.random(table.getn(t))]	
		
	local t2={}
	t2[1]="bundle"
	t2[2]="present"
	t2[3]="document"
	t2[4]="cryo-cred"	
	t2[5]="holo-vid"
	t2[6]="vid disk"
	t2[7]="report"
	t2[8]="holo-cube"
	t2[9]="megadisq"
	t2[10]="gift"
	t2[11]="presentation"
	t2[12]="conference recording"
	t2[13]="sex-disq (tm)"
	packageName=packageName.." "..t2[math.random(table.getn(t2))]
	
	local more2=math.random(14)
	if (more2==20) then
		packageName=getDesktopFile()
	end
	
	
	local t3={}
	t3[1]="Transit of ".. packageName.." required."
	t3[2]=packageName.." to be taken to " .. dropOffSystem.."."
	t3[3]="Think you can take ".. packageName.." to ".. dropOffSystem.. " for me?"
	t3[4]="I need this "..packageName.." taken to "..dropOffSystem.." for me."
	t3[5]="I need my ".. packageName.." taken to the "..dropOffSystem.." system for me."
	t3[6]="courier job: "..packageName.." to the "..dropOffSystem.." system."
	smallDesc=t3[math.random(table.getn(t3))]
		
	--bigDesc=smallDesc -- make the longer description
		
	local t4={}
	t4[1]="I can give you $".. prize.. " for it."
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
	t6[1]="It needs to get to ".. dropOffStation.. ", "..dropOffSystem.."."
	t6[2]="The package's final destination is "..dropOffStation..", "..dropOffSystem.."."
	t6[3]="So the destination again, in case you forgot, was "..dropOffStation.." in the "..dropOffSystem.." system."
	t6[4]="You can drop it off at "..dropOffStation.." in "..dropOffSystem.."."
	t6[5]="Take it to "..dropOffStation..", "..dropOffSystem.."."
	t6[4]="Just take the damn thing to "..dropOffStation..", will you. That's in "..dropOffSystem.."."
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
		bigDesc=bigDesc.." "..t5[math.random(table.getn(t5))]		
	end	
	
	return 1
end


function canTakeMission() -- check to see if you can take this mission
	if (( getSplitSpeed() == 0 ) and ( getDistanceToStation(dropOffStation) > 50000 )) then
		return "No thanks. It's pretty far and your ship doesn't have a split drive."
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
		    createMissionBountyTrigger(getRandomShipID(),getRandomName(),skill,bounty,0,getYourSystem())
		end
	end

	addPersonToStation(contactPerson,dropOffStation,"random")
	setPersonScriptFile(contactPerson,getRandomFileFrom("data/scripts/missions/courier"))
	giveYouPoss(packageName)
end


function update() -- update mission critical things here
	if youDocked(dropOffStation)==1 then
		if youTalkedTo(contactPerson)==1 then
			finishSuccess()
			return 1
		end
	end
	return 0
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

function canCancel()
	-- can always cancel a courier mission
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

contactPerson = getRandomName()
advertPerson = getRandomName()
packageName = ""
prize = 0
haggleExtra = 0
smallDesc = ""
bigDesc = ""
dropOffSystem = ""
dropOffStation = ""
distanceToTarget = 0
reputation_required = 0.0
dangerous =0

--print("LUA -> contact Person: "..contactPerson)
--print("LUA -> advert Person: "..advertPerson)
--print("LUA -> Main run OK.")

