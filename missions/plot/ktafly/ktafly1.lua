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
	
	smallDesc = "Contenedor de carga que necesita ser recogido"
	bigDesc = "Necesito que recojas el contenedor de carga 454 cerca de la estación 2 de Ckesera en el sistema Leesti y me lo traigas aquí en la estación 1 de Sha V en el sistema Sophiha. Necesitarás un rayo tractor. La tarifa es de 12.000 dólares. Déjalo fuera de la estación y lo recogeré más tarde."
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
	info2("Transmisión desde K'Ta Fly (señal portadora confirmada): Gracias por entregar mi contenedor. Por favor, ven a verme.")
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
	return dropOffStation.." en el sistema "..dropOffSystem.."."
end

function getDestination()
	return pickupStation.." en el sistema "..pickupSystem.."."
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
