-- find a cargo container in certain hardcoded system's asteroid fields.
-- reward: $0

function prototype()
	dropOffSystem=getYourSystem()

	dropOffStation="walker base"
	prize = 0
	
	smallDesc = "Encontrar el contenedor de carga"
	bigDesc = "Tu cuadrícula de búsqueda te tiene buscando waessda y aresswa. Busque en los campos de asteroides de cada sistema un contenedor de carga. Escanéalo apuntándolo. Analizaremos su escaneo y le informaremos si se trata del contenedor que estamos buscando. Hazlo con el tractor y tráelo de vuelta a la base Walker. Déjalo fuera de la estación y sube a bordo."
	contactPerson = "4332c"
	
	return 1
end

function canTakeMission()
	return "" -- always take it
end


function takeMission()
end


function update() -- update mission critical things here
	local arrive = ItemIsOutsideStation("required equipment","walker base")

	if (youDocked("walker base") ==1) then
		if (arrive ==1) then
			finishSuccess()
			return 1 -- mission complete.
		end
	end
	return 0 -- not complete yet
end

function finishSuccess() -- clear up stuff here
	cleanUp()
end

function finishFailure() -- clear up stuff here
	cleanUp()
end

function returnImageFile()
	return "data/images/hud/missions/cargo.png"
end

 -- ====================================================== CLEAN UP
function cleanUp()
    removeCargoContainer("required equipment")
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
	return "waessda and aresswa asteroid fields"
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
