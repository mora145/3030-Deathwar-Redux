-- K'ta Fly has just met you. he gives you a mission to
-- get a cargo container from ckesera station 2 in the leesti system
-- reward $12,000

function prototype()
	dropOffSystem=getYourSystem()
	pickupStation="Ckesera Station 2"
	pickupSystem="leesti [-150, -62]"
	
	dropOffStation="sha v station 1"
	prize = 12000
	
	deviceName="container 454"
	
	smallDesc = "Cargo container in need of pickup"
	bigDesc = "I need you to pick up cargo container 454 from near ckesera station 2 in the leesti system. then bring it back to me here on sha v station 1 in the sophiha system. You will need a tractor beam. the fee is $12,000. Just leave it outside the station and I'll get it later."
	contactPerson = "k'ta fly"
	
	return 1
end

function canTakeMission()
	return "" -- always take it
end


function takeMission()
	putCargoContainerOutsideStation(deviceName,pickupStation,contactPerson)
	setPersonScriptFile("k'ta fly","data/scripts/plot/ktafly/ktafly2.txt")
	
   	createCleanerTrigger("scout",1,"leesti",1)
	createCleanerTrigger("scout",1,"leesti",1)
	createCleanerTrigger("scout",2,"leesti",1)
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
	info2("Transmission from K'Ta Fly (carrier signal confirmed): Thanks for delivering my container. Please come and see me.")
	setPersonScriptFile("k'ta fly","data/scripts/plot/ktafly/ktafly3.txt")
	givePlayerMoney(prize)
	cleanUp()
	clearAllCleanerShips()
end

function finishFailure() -- clear up stuff here
    setPersonScriptFile("k'ta fly","data/scripts/plot/ktafly/ktafly1.txt")
	cleanUp()
	clearAllCleanerShips()
end

function returnImageFile()
	return "data/images/hud/missions/cargo.png"
end

 -- ====================================================== CLEAN UP
function cleanUp()
    removeCargoContainer(deviceName)
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
	return dropOffStation.." in "..dropOffSystem.." system."
end

function getDestination()
	return pickupStation.." in "..pickupSystem.." system."
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
pickupStation = ""
pickupSystem = ""
distanceToTarget = 0
reputation_required = 0.0
deviceName = ""
