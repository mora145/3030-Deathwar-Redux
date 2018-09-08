-- Bounty Mission
-- Created: 4nd Nov, 2005, updated: 13 sept, 2006
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
	
	system_name = getYourSystem()
	
	number=math.random(0,3)
	
	pirate_ship=getRandomShipID()
	pirate_name=getRandomName()
	pirate_skill=math.random(1,5)

    kills_required=0

	if (pirate_skill==1) then
	    kills_required=0
	    pirate_bounty=math.random(100,200)
		number=0
		pirate_bounty = pirate_bounty * 100
	    
	elseif (pirate_skill==2) then
	    kills_required=math.random(0,4)
	    pirate_bounty=math.random(200,400)
	    number=math.random(0,1)
		pirate_bounty = pirate_bounty + ( number * 15 )
		pirate_bounty = pirate_bounty * 100
	    
	elseif (pirate_skill==3) then
		kills_required=math.random(5,10)
		pirate_bounty=math.random(35,50)
		number=math.random(1,2)
		pirate_bounty = pirate_bounty + ( number * 3 )
		pirate_bounty = pirate_bounty * 1000
	
	elseif (pirate_skill==4) then
		kills_required=math.random(10,15)
		pirate_bounty=math.random(45,70)
		number=math.random(2,3)
		pirate_bounty = pirate_bounty + ( number * 4 )
		pirate_bounty = pirate_bounty * 1000
	
	elseif (pirate_skill==5) then
		kills_required=math.random(15,25)
		pirate_bounty=math.random(70,100)
		number=math.random(3,5)
		pirate_bounty = pirate_bounty + ( number * 5 )
		pirate_bounty = pirate_bounty * 1000
	end

	prize = math.floor(pirate_bounty)

	-- GET PIRATE DESCRIPTION
	local t={}
	t[1]="violent"
	t[2]="nasty"
	t[3]="badass"
	t[4]="killer"	
	t[5]="murderous"
	t[6]="insane"
	t[7]="mad"
	t[8]="crazy"
	t[9]="space crazy"
	t[10]="coo-coo"
	t[11]="foaming mad"
	t[12]="quite quite mad"
	local about=t[math.random(table.getn(t))]	
		
	local t3={}
	t3[1]="Bounty: "..about.." pirate wanted dead."
	t3[2]=about.." pirate wanted dead."
	t3[3]="Bounty: "..about.." pirate."
	t3[4]="bounty offered."
	t3[5]=about.." pirate wanted dead."
	t3[6]="require assistance with "..about.." pirate."
	t3[7]="Kill this scum."
	t3[8]="I need your help."
	t3[9]="do you have balls?"
	t3[10]="bounty for "..about.." pirate offered."
	smallDesc=t3[math.random(table.getn(t3))]

	--bigDesc=smallDesc -- make the longer description
		
	local t4={}
	t4[1]="We want "..pirate_name.." dead."
	t4[2]="we can offer $"..prize.." for the death of "..pirate_name.."."
	t4[3]="$"..prize.." for the death of "..pirate_name.."."
	t4[4]="Some time ago a pirate, "..pirate_name.." attacked my ship. he killed my wife. now I want him dead."
	t4[5]="For attacking public cruise ships, we offer a bounty for "..pirate_name..". $"..prize.." should do."
	t4[6]="$"..prize.." offered for the death of "..pirate_name.."."
	t4[7]="we need to rid this universe of a murderer. Kill "..pirate_name.." and I'll give you $"..prize.."."
	t4[8]="have some time on your hands? If your answer is yes, then this job might be for you. Wanted dead."
	t4[9]=about.." pirated wanted dead. $"..prize.." offered."
	t4[10]="sometimes you just want revenge. I want revenge and I'm willing to pay for it. $"..prize.."."
	t4[11]="Some call is murder, some call it assassination. I call it revenge. Kill "..pirate_name.." for me."
	t4[12]="If you have the means then kill "..pirate_name.." and I'll give you $"..prize.."."
	t4[13]=pirate_ship.." is the ship I want blown up. "..pirate_name.." flies it. I want him dead."
	t4[14]="Please hunt down "..pirate_name.." flying "..pirate_ship.." and destroy it."
	bigDesc=bigDesc.." "..t4[math.random(table.getn(t4))]
	
	if number > 0 then
		local t5={}
		t5[1]="He might have friends with him. Kill them too if you want."
		t5[2]="He could be escorted by other pirates."
		t5[3]="Be careful, he might not be alone."
		t5[4]="He might have some friends."
		t5[5]="He was last seen with a pack of pirates."
		t5[6]="Take care with this one, he may not be alone."
		t5[7]="you'll probably encounter more of his kind."
		t5[8]="I have had reports he flies with others."
		t5[9]="You might possibly run into "..number.." others too."
		t5[10]="he tends to stick with his gang of "..number.." ships."
		t5[11]="You'll have to take on "..number.." other ships."
		t5[12]="There's a distinct possibility he'll be with others."
		t5[13]="Please note, he will have an escort of "..number.." ships."
		t5[14]="he will be joined by "..number.." ships."
		bigDesc=bigDesc.." "..t5[math.random(table.getn(t5))]			
	end
	
	local more=math.random(1)
	
	if (more==0) then
		local t5={}
		t5[1]="Will you accept?"
		t5[2]="So, what do you think?"
		t5[3]="Are you man enough?"
		t5[4]="It's not too difficult for you is it?"	
		t5[5]="Yes, no?"
		t5[6]="Do this for me."
		t5[7]="What will you say?"
		t5[8]="I have the money if you have the means."
		t5[9]="Get this done and I will be pleased."
		t5[10]="Yes?"
		t5[11]="Will do you do this?"
		bigDesc=bigDesc.." "..t5[math.random(table.getn(t5))]		
	end	
	
	bigDesc=bigDesc.." [br] [br] Target ship: "..pirate_ship.." flown by "..pirate_name..". [br] "
	
	if kills_required ~= 0 then
		local t6={}
		t6[1]="You'll need at least "..kills_required.." kills to take this job. You up to it?"
		t6[2]="I won't accept any pilot with less than "..kills_required.." kills."
		t6[3]="You need "..kills_required.." kills to take this mission."
		t6[4]="to save my time I shan't offer unless you have already killed "..kills_required.."."
		t6[5]="A kill rating of "..kills_required.." is required."
		t6[6]="If you've killed "..kills_required.." ships, then you're the person I'm looking for."
		t6[7]="I'll need to see proof of a kill rating of "..kills_required.." or higher."
		t6[8]="kill rating requirement: >"..kills_required.."."
		bigDesc=bigDesc.." "..t6[math.random(table.getn(t6))]
	else
		local t6={}
		t6[1]="It's not too difficult so you don't need any confirmed kills to take this job."
		t6[2]="Kill rating requirement: 0"
		t6[3]="This is a milk run. No kills are required to take it."
		t6[4]="This is for a novice pilot. No kill required."
		t6[5]="No kills required."
		t6[6]="No kills needed."
		t6[7]="I don't need a professional. Anyone will do."
		t6[8]="zero kills required to take this job."
		bigDesc=bigDesc.." "..t6[math.random(table.getn(t6))]
	end

	return 1
end


function canTakeMission() -- check to see if you can take this mission
	if getKills() < kills_required then 		
		return "You don't look tough enough to take this job. Come back when you've got more combat experience." 
	end
	return ""
end


function takeMission()
	createMissionBountyTrigger(pirate_ship,pirate_name,pirate_skill,pirate_bounty,1,getYourSystem())
	
	for i=1,number do
		skill=math.random(1,pirate_skill) 		
		bounty=(pirate_bounty/10)
		createMissionBountyTrigger(getRandomShipID(),getRandomName(),skill,bounty,0,getYourSystem())
	end	
end


function update() -- update mission critical things here
	local haveKilled=youHaveKilled(pirate_ship)
	-- 1 = yes
	-- 0 = no, still alive
	-- -1 = someone else killed him
	local hasntLeft=(getYourSystem()==system_name)
	
	if (hasntLeft==false) then
		completeMission(0, prize, advertPerson, smallDesc, bigDesc, "You're leaving? Without killing him? Guess I'll have to find someone else to do the job.")
		cleanUp()
		return 1
	elseif (haveKilled==1) then
		finishSuccess()
		return 1
	elseif (haveKilled==-1) then
		completeMission(0, prize, advertPerson, smallDesc, bigDesc, "Well, someone else killed him so you don't get any money. Try harder next time.")
		cleanUp()
		return 1
	elseif (haveKilled==-2) then
		createMissionBountyTrigger(pirate_ship,pirate_name,pirate_skill,pirate_bounty,1,getYourSystem())
	end
	return 0
end

function finishSuccess() -- clear up stuff here
	cleanUp()
	local t6={}
	t6[1]="He's finally dead. Traders can finally rest a little bit easier. thank you!"
	t6[2]="Finally! thank you!"
	t6[3]="That's the last of you, "..pirate_name.."."
	t6[4]="No more "..pirate_name..". Thank you."
	t6[5]="It's about time. He'd caused so much trouble."
	t6[6]="Thank you."
	t6[7]="Dead, finally. Thank you."
	completeMission(1, prize, advertPerson, smallDesc, bigDesc, getGenericThanksQuote(prize).." "..t6[math.random(table.getn(t6))])
end

function finishFailure() -- clear up stuff here
	completeMission(0, prize, advertPerson, smallDesc, bigDesc, getGenericDisappointmentQuote(prize))
	cleanUp()
end

 -- ====================================================== CLEAN UP
function cleanUp()
end
 -- ====================================================== CLEAN UP

function cancel()
	finishFailure()
	cleanUp()
end

function canCancel()
	-- can always cancel a bounty mission
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
	return ( pirate_ship..", in this system, "..system_name.."." )
end

function returnImageFile()
	return "data/images/hud/missions/bounty.png"
end

-- ========================================================
-- MAIN!
-- ========================================================

contactPerson = getRandomName()
advertPerson = getRandomName()

number = 0 -- number of pirate friends
pirate_ship=""
pirate_name=""
pirate_skill="" 		
pirate_bounty=""
prize = 0
haggleExtra = 0
smallDesc = ""
bigDesc = ""
kills_required = 0
system_name = ""