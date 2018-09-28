-- Photograph person mission for even t'ny
-- Created: 14th dec, 2006
-- Written by: Matt

-- ========================================================
-- THE USUAL FUNCTIONS
-- ========================================================

function prototype()
	-- this is where you'll take the photo back to.
	dropOffSystem="tibefa"
	dropOffStation="qrima station 2"

	pickupSystem = "faedda [-73, 159]"
	pickupStation = "tia"	-- the station the person is on

	prize = 0

	photoPerson = "jek kek"
	contactPerson = "evan t'ny"
	advertPerson = "evan t'ny"

	bigDesc="Necesito que fotografíes a Jek Kek a bordo de Tia en el sistema "..pickupSystem..". Te daremos una cámara de reconocimiento. Simplemente párate cerca de él y toma una foto. Repórtese a mí aquí en la estación Qrima 2."
	smallDesc="Fotografía a Jek Kek en Tia."

	return 1
end


function canTakeMission() -- check to see if you can take this mission
	return ""
end


function takeMission() -- upon taking the mission set up things, like:
	if hasUpgrade("recon camera")==0 then
		giveUpgrade("recon camera")
		info("Se le ha proporcionado una cámara de reconocimiento para cumplir esta misión.")
	else
		info("Parece que ya tienes una cámara de reconocimiento. Úsala para cumplir esta misión.")
	end	

	-- add the photo person
	addPersonToStation("jek kek","tia","data/stations/special characters/bigCopAlien1_80x130_4.png")
	setPersonScriptFile("jek kek","data/scripts/plot/evantny/evantny3.txt")
	
	setPersonScriptFile("evan t'ny","data/scripts/plot/evantny/evantny2.txt") -- go get it...
	
	makeSystemVisible("faedda")
	
	createMissionBountyTrigger(getRandomShipID(),getRandomName(),4,math.random(1800,5280),0,dropOffSystem)	
	createMissionBountyTrigger(getRandomShipID(),getRandomName(),3,math.random(1800,5280),0,dropOffSystem)
	createMissionBountyTrigger(getRandomShipID(),getRandomName(),3,math.random(1800,5280),0,dropOffSystem)
	createMissionBountyTrigger(getRandomShipID(),getRandomName(),4,math.random(1800,5280),0,dropOffSystem)
	
	createMissionBountyTrigger(getRandomShipID(),getRandomName(),5,math.random(4800,15280),0,pickupSystem)
	createMissionBountyTrigger(getRandomShipID(),getRandomName(),5,math.random(4800,15280),0,pickupSystem)		
end


function update() -- update mission critical things here
	local photo_taken=0
		
	if photoContains(photoPerson)==1 then
		photo_taken=1
	end
		
	if photo_taken==1 then
		if youDocked(dropOffStation)==1 then
			setPersonScriptFile(contactPerson,"data/scripts/plot/evantny/evantny4.txt") -- ok, you completed it.
			
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
	setPersonScriptFile(contactPerson,"data/scripts/plot/evantny/evantny5.txt")    -- thanks, clue reminder
	cleanUp()
end

function finishFailure() -- clear up stuff here
	setPersonScriptFile(contactPerson,"data/scripts/plot/evantny/evantny6.txt")    -- start over again.
	cleanUp()
end

 -- ====================================================== CLEAN UP
function cleanUp()
	setPersonScriptFile(photoPerson,"freeform")	
	removePersonFromStation(photoPerson,pickupStation)

	if (stillHavePhotoMission()==0) then  -- check if there is a generic photo mission running, remove camera otherwise
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
	return pickupStation.." en el sistema "..pickupSystem.."."
end

function returnImageFile()
	return "data/images/hud/missions/photograph_person.png"
end

-- ========================================================
-- MAIN!
-- ========================================================

photoPerson = ""
contactPerson = ""
advertPerson = ""
prize = 0
haggleExtra = 0
smallDesc = ""
bigDesc = ""
people = 0

dropOffSystem = ""
dropOffStation = ""
pickupStation = ""
pickupSystem = ""

distanceToTarget = 0
reputation_required = 0.0

