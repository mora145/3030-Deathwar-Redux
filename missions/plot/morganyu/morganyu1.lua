-- Morgan Yu's Courier Mission (timed)
-- Created: 7th Nov, 2006
-- Written by: Matt

-- ========================================================
-- THE USUAL FUNCTIONS
-- ========================================================

function prototype()
	dropOffSystem="daphice"
	dropOffStation="Ssinil Station 1"
	
    local dockedAt = getYourDockedStation()

    timerName = "MORGAN YU COURIER"
    timerNameWarning = "MORGAN YU WARNING [hidden]"
	prize = 20000
	packageName="religious artefact"
	smallDesc="I need my artefact taken to ssinil station in the "..dropOffSystem.." system."
    timeLimit="9:16"
    timeLimitWarning="4:25"
    hasSentWarning=0

	--bigDesc=smallDesc -- make the longer description
	bigDesc=bigDesc.." ".."I can pay $"..prize.."."
	bigDesc=bigDesc.." ".."It needs to get to ".. dropOffStation.. ", "..dropOffSystem.."."
	bigDesc=bigDesc.." ".."Just board the station, it'll be automatically removed from your inventory."
    bigDesc=bigDesc.." ".."This is really urgent. You'll have "..timeLimit.." to get there."

	return 1
end


function canTakeMission() -- check to see if you can take this mission
	return "" -- you can take a courier mission
end


function takeMission() -- upon taking the mission set up things, like:
	local desc = "get to "..dropOffStation
	createTimer(timerName,desc,timeLimit)
	createTimer(timerNameWarning,desc,timeLimitWarning)
	giveYouPoss(packageName)
end


function update() -- update mission critical things here
	
   	local newDesc="" 
	local dockedNow=youDocked("jelnu station 1")   

    if (dockedNow==1) then
    	if (paused==0) then
			pauseTimer(timerName)
			pauseTimer(timerNameWarning)
    		resumed=0
    		paused=1
    	end
    	newDesc= "please undock to begin this mission."
    else
    	if (resumed==0) then 
			resumeTimer(timerName)
			resumeTimer(timerNameWarning)
			resumed=1
			paused=0 -- just in case you redock
		end
		
		if timerFinished(timerNameWarning)==1 and hasSentWarning==0 then
			info2("Transmission from Morgan Yu (carrier signal confirmed): Shit, you still haven't delivered the package? Time is running out, get there fast! Now!")
			hasSentWarning = 1
		end
		
		local fin=timerFinished(timerName)
		
		if (fin==1) then
			finishFailure()
			return 1
		end
	
		if youDocked(dropOffStation)==1 then
			finishSuccess()
			return 1
		end
		
		newDesc= "get to "..dropOffStation		
    end

    updateTimerDescription(timerName,newDesc) 

	return 0
end

function finishSuccess() -- clear up stuff here
	givePlayerMoney(prize)
	cleanUp()
	info2("Transmission from Morgan Yu (carrier signal confirmed): Your account has been credited $"..prize..". K'ta Fly sends his thanks. He'll contact you again soon.")
	
	-- Progress main story plot
	setStoryVar(100,12)
end

function finishFailure() -- clear up stuff here
	info2("The artefact you received from Morgan Yu begins to sizzle. [br] [br] It erupts into flame. [br] [br] A second later, everything goes bright.")
	killPlayerBlownUpByBomb()
	cleanUp()
end

 -- ====================================================== CLEAN UP
function cleanUp()
	removePoss(packageName)
	destroyTimer(timerName)
	destroyTimer(timerNameWarning)
end
 -- ====================================================== CLEAN UP

function cancel()
	finishFailure()
	cleanUp()
end

function canCancel()
	if (youDockedAtAll()==0) then
		return ""
	else
	    return "Can't Cancel"
	end
end

function returnSmallDesc()
	return smallDesc
end

function returnBigDesc()
	return bigDesc
end

function getContact()
	return "morgan yu"
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
	return dropOffStation.." in "..dropOffSystem.." system."
end

function returnImageFile()
	return "data/images/hud/missions/couriertimed.png"
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
timerName = ""
timerNameWarning = ""
timeLimit = 0
timeLimitWarning = 0
hasSentWarning = 0
resumed = 0
paused = 0

