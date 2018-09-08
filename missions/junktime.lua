-- Destroy X amount of junk in Y time
-- Created: 4th May, 2006
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

	dropOffSystem = getYourSystem()
	amount = math.random(15,25)

	timeLimit = ""
	
	if (amount <= 18) then
	    timeLimit = "4:00"
	elseif (amount <= 21) then
	    timeLimit = "5:00"
	else
	    timeLimit = "6:00"
	end

	prize = amount * 6
	prize = prize + math.random(16,21)
	prize = math.floor(prize)
	prize = prize*100
	
	if math.random(1,2)==1 then
		if math.random(1,2)==1 then
			prize = prize + 50
		else
			prize = prize + (math.random(1,9)*10)
		end
	end
	
	contactPerson = getRandomName()	
	advertPerson = getRandomName()		-- who you're talking to now

    timerName = contactPerson.." JUNK TIMER"

	-- GET DESCRIPTION

	local t3={}
	t3[1]="Immediate Junk clean-up required."
	t3[2]="Important Surplus junk job."
	t3[3]="Galactic clean-up job. Quick."
	t3[4]="Help clean-up our space today."
	t3[5]="Keep ".. dropOffSystem .." clean."
	t3[6]=dropOffSystem.." is getting dirty."
	t3[7]="Council job: Immediate Junk clean-up."
	smallDesc=t3[math.random(table.getn(t3))]
	
	local t={}
	t[1]="Afternoon. "
	t[2]="There seems to be a large build up of junk in this system."
	t[3]="I wonder if you can help."
	t[4]=""	
	t[6]="We could use a pilot like yourself."
	bigDesc=t[math.random(table.getn(t))]	

	local t6={}
	t6[1]="This is an important job. If my boss sees this mess he'll literally kill me. [br]"
	t6[2]="This has to be done quickly. Very quickly."
	t6[3]="I feel like giving you a challenge. You'll need to do this against the clock."
	t6[4]="Feel lucky? And fast?"
	t6[5]=dropOffSystem.." seems to be filling up with junk. It needs immediately clearing."
	bigDesc=t6[math.random(table.getn(t6))]
		
	local t2={}
	t2[1]="We just need you to destroy ".. amount.." pieces of junk in "..timeLimit.."."
	t2[2]="Destroy "..amount.." pieces of that floating junk for us within the allotted "..timeLimit.."."
	bigDesc=bigDesc.." "..t2[math.random(table.getn(t2))]
	
	local more=math.random(0,1)
	if more==0 then
		local tm={}
		tm[1]="It's not too difficult. Just shoot them down. Quickly."
		tm[2]=" [br] What do you think? You quick enough?"
		tm[3]="Would you help us out?"
		tm[4]="The system would be better off. Although, come to think of it. Maybe it wouldn't. There seems to be more junk everyday."
		tm[5]=dropOffSystem.." will be that little bit cleaner. Also you'll be $"..prize.." better off."
		bigDesc=bigDesc.." "..tm[math.random(table.getn(tm))]
	end	

	local t6={}
	t6[1]=" [br] Once you've destroyed them, we'll move the funds to your account."
	t6[2]=" [br] $".. prize .." will be added to your account upon completion."
	bigDesc=bigDesc.." "..t6[math.random(table.getn(t6))]

	return 1
end


function canTakeMission() -- check to see if you can take this mission
	if (hasWeapon()==0) then 
		return "Can't take this mission without a gun. How else are you going to shoot the junk?"
	end
    if (haveJunkMission()==1) then 
		return "You can only have one junk mission at a time. Council rules."
	end
	if (getCrimeCount()>0) then 
		return "You can't be doing junk cleanup with a criminal record. You'll need to pay your fines first."
	end
	return ""
end


function takeMission() -- upon taking the mission set up things, like:
	desc = "destroy "..amount.." pieces of junk"
	createTimer(timerName,desc,timeLimit)
	resetJunkDestroyed(amount)
end


function update() -- update mission critical things here
	local junk=junkDestroyed()
	local fin=timerFinished(timerName)

    newDesc=""
    
    if (amount-junk)==1 then
    	newDesc= "destroy 1 piece of junk"
    else
    	newDesc= "destroy "..(amount-junk).." pieces of junk"   	
    end
    
    updateTimerDescription(timerName,newDesc)

	if (fin==1) then
	   finishFailure()
	   return 1
	end
	
	if (junk>amount) or (junk==amount) then
	    finishSuccess()
	    return 1
	end
	return 0 -- not complete yet
end

function finishSuccess() -- clear up stuff here
	cleanUp()
	completeMission(1, prize, advertPerson, smallDesc, bigDesc, getGenericThanksQuote(prize).." "..dropOffSystem.." will be better off thanks to you.")
end

function finishFailure() -- clear up stuff here
	completeMission(0, prize, advertPerson, smallDesc, bigDesc, getGenericDisappointmentQuote(prize))
	cleanUp()	
end

 -- ====================================================== CLEAN UP
function cleanUp()
	destroyTimer(timerName)
	resetJunkDestroyed(0)
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
	return ""
end

function getDestination()
	return "This system"
end

function returnImageFile()
	return "data/images/hud/missions/junktimed.png"
end

-- ========================================================
-- MAIN!
-- ========================================================

contactPerson = ""
advertPerson = ""

timerName = ""

timeLimit = ""
amount =0
prize = 0
haggleExtra = 0
smallDesc = ""
bigDesc = ""
people = 0

dangerous=0

dropOffSystem = ""
dropOffStation = ""

pickupSystem = ""

distanceToTarget = 0
reputation_required = 0.0

