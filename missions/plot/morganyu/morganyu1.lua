-- Morgan Yu's Courier Mission (timed)
-- Created: 7th Nov, 2006
-- Written by: Matt

-- ========================================================
-- THE USUAL FUNCTIONS
-- ========================================================

function prototype()
	dropOffSystem="daphice"
	dropOffStation="Estacion Ssinil 1"
	
    local dockedAt = getYourDockedStation()

    timerName = "MORGAN YU COURIER"
    timerNameWarning = "MORGAN YU WARNING [hidden]"
	prize = 20000
	packageName="artefacto religioso"
	smallDesc="Necesito que mi artefacto sea llevado a la estación de Ssinil en el sistema "..dropOffSystem.."."
    timeLimit="9:16"
    timeLimitWarning="4:25"
    hasSentWarning=0

	--bigDesc=smallDesc -- make the longer description
	bigDesc=bigDesc.." ".."Puedo pagar "..prize.."$."
	bigDesc=bigDesc.." ".."Necesita llegar a ".. dropOffStation.. ", en el sistema "..dropOffSystem.."."
	bigDesc=bigDesc.." ".."Sólo tienes que abordar la estación, y se eliminará automáticamente de tu inventario.."
    bigDesc=bigDesc.." ".."Esto es realmente urgente. Tendrás "..timeLimit.." para llegar allí."

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
    	newDesc= "por favor, desembarca para comenzar esta misión.."
    else
    	if (resumed==0) then 
			resumeTimer(timerName)
			resumeTimer(timerNameWarning)
			resumed=1
			paused=0 -- just in case you redock
		end
		
		if timerFinished(timerNameWarning)==1 and hasSentWarning==0 then
			info2("Transmisión de Morgan Yu (señal portadora confirmada): Mierda, ¿aún no has entregado el paquete? El tiempo se acaba, ¡llega rápido! ¡Ahora!")
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
	info2("Transmisión de Morgan Yu (señal portadora confirmada): Su cuenta ha sido acreditada "..prize.."$. K'ta Fly te da las gracias. Pronto se pondrá en contacto con usted.")
	
	-- Progress main story plot
	setStoryVar(100,12)
end

function finishFailure() -- clear up stuff here
	info2("El artefacto que recibiste de Morgan Yu empieza a chisporrotear. [br] [br] Estalla en llamas. [br] [br] Un segundo después, todo se ilumina.")
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
	    return "No se puede cancelar"
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

