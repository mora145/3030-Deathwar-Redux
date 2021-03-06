-- ok, frank's first mission is this:

-- take a holo cube to rub ba station 3
-- you'll meet jimmy chou
-- reward $2,600

function prototype()
	dropOffSystem=getYourSystem()
	dropOffStation=getYourDockedStation()
	pickupStation = getRandomStation(pickupSystem)
	
	prize = 2600
	packageName="holocube"
	
	smallDesc = "Llévale este holocubo a Jimmy Chou. Estará esperando en una de las estaciones de este sistema. Encuéntralo y dale este holocubo. Te dará 2.600 dólares."
	
	contactPerson = "jimmy chou"
	
	--print("prototyping of jimmy chou's mission has been successful.")
	
	return 1
end

function canTakeMission() -- check to see if you can take this mission
	return "" -- you can take a courier mission
end


function takeMission() -- upon taking the mission set up things, like:
	giveYouPoss(packageName)
end


function update() -- update mission critical things here
	if youDocked(dropOffStation)==1 then
		if youTalkedTo(contactPerson)==1 then
			finishSuccess()
			return 1 -- mission complete.
		end
	end
	return 0 -- not complete yet
end

function finishSuccess() -- clear up stuff here
	givePlayerMoney(prize)
	cleanUp()
end

function finishFailure() -- clear up stuff here
	cleanUp()
end

 -- ====================================================== CLEAN UP
function cleanUp()
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
	return dropOffStation.." en el sistema "..dropOffSystem.."."
end

function returnImageFile()
	return "data/images/hud/missions/courier.png"
end

contactPerson = ""
advertPerson = ""
prize = 0
haggleExtra = 0
smallDesc = ""
bigDesc = ""
dropOffSystem = ""
dropOffStation = ""
packageName = ""
