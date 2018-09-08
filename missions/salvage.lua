-- Salvage Mission
-- Created: 3rd Dec, 2014
-- Written by: Matt

-- ========================================================
-- THE USUAL FUNCTIONS
-- ========================================================

function prototype()

		
	if math.random(0,1)==1 then
		local tractor={}
		tractor[1]="Do you have a thirst for salvage?"
		tractor[2]="Want to explore your own system?"
		tractor[3]="Salvage isn't going to explore itself!"
		tractor[4]="Get out there and take advantage of others' misfortunes!"
		bigDesc=bigDesc.." "..tractor[math.random(table.getn(tractor))]
	end
		
	local t3={}
	t3[1]="This is friendly reminder that salvage junks are out there!"
	t3[2]="Take the time to look for salvage missions in each system for great rewards."
	t3[3]="Salvage junks are out there!"
	t3[4]="Want free stuff?"
	t3[5]="Reminder: Salvage junks are available in your system right now"
	smallDesc=t3[math.random(table.getn(t3))]
		
	local t4={}
	t4[1]="This is just a reminder, check your system map for -grey- dots. They're salvage junks. Fly in to them to explore!"
	bigDesc=bigDesc.." "..t4[1]
		
	local t5={}
	t5[1]=" [br] [br] Are you ready for adventure?"
	t5[2]=" [br] [br] Get out there commander."
	bigDesc=bigDesc.." "..t5[math.random(table.getn(t5))]		

	return 1
end


function canTakeMission() -- check to see if you can take this mission
	return ""
end


function takeMission() -- upon taking the mission set up things, like:
end


function update() -- update mission critical things here
	return 1 -- not complete yet
end

function finishSuccess() -- clear up stuff here
	cleanUp()
end

function finishFailure() -- clear up stuff here
	cleanUp()
end

 -- ====================================================== CLEAN UP
function cleanUp()
end
 -- ====================================================== CLEAN UP

function cancel()
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
	return "This system"
end

function returnImageFile()
	return "data/images/hud/missions/salvage.png"
end

-- ========================================================
-- MAIN!
-- ========================================================

contactPerson = "System information"
advertPerson = "Automated service droid"
packageName = ""
prize = 0
haggleExtra = 0
smallDesc = ""
bigDesc = ""
dropOffSystem = ""
dropOffStation = ""

dangerous = 0

pickupStation = ""
pickupSystem = ""

distanceToTarget = 0
reputation_required = 0.0
deviceName = ""

--print("LUA -> contact Person: "..contactPerson)
--print("LUA -> advert Person: "..advertPerson)
--print("LUA -> Main run OK.")

