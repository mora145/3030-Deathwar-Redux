-- 433-2c scientist mission
-- Created: 2nd Jan, 2007
-- Written by: Matt

-- ========================================================
-- THE USUAL FUNCTIONS
-- ========================================================

function prototype()	
	dropOffStation="walker base"

	people=1
	people_on_board[1]="Dave Ramirez PhD"

	prize = 0
	
	smallDesc="Recoja al científico de KP-FQ1" 
	
	bigDesc="Recoger a Dave Ramírez, doctor en Filosofía y Letras de Qucieda en KP-FQ1. Automáticamente abordará su nave cuando atraque allí. Llévenlo de vuelta a la base de Walker tan pronto como sea posible."	
    	
	return 1
end


function canTakeMission() -- check to see if you can take this mission
	return "" -- you can take a courier mission
end


function takeMission() -- upon taking the mission set up things, like:
	pickedUpYet=0
	remindTip=0
	
	createCleanerTrigger("scout",1,"KP-FQ1",1)
	createCleanerTrigger("scout",1,"KP-FQ1",1)
	createCleanerTrigger("scout",2,"KP-FQ1",1)
end


function update() -- update mission critical things here
	if (youDocked("qucieda")==1) then
		if (getFreeCabins()>0) then
			if (pickedUpYet==0) then
				pickedUpYet=1
				addPassenger(people_on_board[1])
				info2("He abordado su nave. Por favor, llévame a la base Walker inmediatamente.")
			end			
		else
			if (remindTip==0) then
				remindTip=1
				info("Necesitarás un camarote libre para recogerme. Vuelve cuando tengas espacio en la cabina.",true)
			end
		end
	else
		remindTip=0
	end
	
	if (youDocked("walker base")==1) then
		if (pickedUpYet==1) then
			finishSuccess()
			return 1		
		end	
	end
	
	return 0 -- not complete yet
end

function finishSuccess() -- clear up stuff here 
	cleanUp()
	info("Gracias por traerme aquí. Me pondré a trabajar en el código del escudo. No debería llevar mucho tiempo.")
	clearAllCleanerShips()
end

function finishFailure() -- clear up stuff here
	cleanUp()
	clearAllCleanerShips()
end

 -- ====================================================== CLEAN UP
function cleanUp()
	removePassenger(people_on_board[1])
end
 -- ====================================================== CLEAN UP

function cancel()
	finishFailure()
	cleanUp()
end

function canCancel() -- can only cancel when docked!
	return "No se puede cancelar"
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
	return "Recogida en Qucieda en KP-FQ1, entrega en la base Walker."
end

function getPeople()
	return people.."-"
end

function returnImageFile()
	return "data/images/hud/missions/passenger.png"
end

-- ========================================================
-- MAIN!
-- ========================================================

people_on_board={}
advertPerson = "433-2c"
prize = 0
haggleExtra = 0
smallDesc = ""
bigDesc = ""
people = 0
dangerous=0

dropOffSystem = ""
dropOffStation = ""

pickedUpYet=0
remindTip=0

distanceToTarget = 0
reputation_required = 0.0

