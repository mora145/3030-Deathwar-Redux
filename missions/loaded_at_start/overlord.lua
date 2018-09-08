function update()

	-- ################################## !!!!!! ATTENTION !!!!!! ##########################################
	-- Don't change these or add any without double checking in story.bmx first!!!
	-- Below 30 is only for tutorial purposes
	StoryExperienceIndex 	= 30
	StoryLargoCrashed		= 31
	
	VasquezIndex 			= 34
	MaijiaIndex 			= 35
	UganHiroIndex 			= 36
	QuaidIndex 				= 37
	Surveys4CashIndex 		= 38
	EvanTnyIndex			= 39
	GlorOps1Index 			= 40
	GlorOps2Index 			= 41
	GeriHgeIndex 			= 42
	TaoistBossIndex 		= 43
	WalkerPasswordIndex 	= 44
	
	WaessdaAsteroidIndex 		= 60
	KentStoryHasClearedStation1	= 62
	KentStoryHasClearedStation2	= 63
	KentStoryHasClearedStation3	= 64
	KentStoryHasTalkedBarDroid	= 65
	
	LargoStoryIndex 			= 96
	FrankStoryIndex 			= 97
	KentStoryIndex 				= 98
	BossStuffIndex 				= 99
	Index 						= 100
	-- ################################## !!!!!! ATTENTION !!!!!! ##########################################
	-- Don't change these or add any without double checking in story.bmx first!!!
	
	
	storyVar = getStoryVar(Index)
	storyOfBoss = getStoryVar(BossStuffIndex)
	storyOfKent = getStoryVar(KentStoryIndex)
	storyOfFrank = getStoryVar(FrankStoryIndex)
	storyOfLargo = getStoryVar(LargoStoryIndex)
	
	
	if (storyVar==0) then
	
		-- setup story vars here
		setStoryVar(LargoStoryIndex, 0)
		setStoryVar(FrankStoryIndex, 0)
		setStoryVar(KentStoryIndex, 0)
		setStoryVar(BossStuffIndex, 0)
		setStoryVar(StoryExperienceIndex, 0)
		setStoryVar(VasquezIndex, 0)
		setStoryVar(MaijiaIndex, 0)
		setStoryVar(UganHiroIndex, 0)
		setStoryVar(QuaidIndex, 0)
		setStoryVar(Surveys4CashIndex, 0)
		
		
		-- setup all the people you can meet here.
        giveDataDisc("captain's log 1.txt")

		-- FRANK ZOED
		addPersonToStation("frank zoed","rub ba station 2","data/stations/special characters/Frank1_50x108_4.png")
		setPersonScriptFile("frank zoed","freeform")	
	
		-- JIMMY CHOU
		addPersonToStation("jimmy chou","rub ba station 3","data/stations/special characters/JimmyChou_50x108_4.png")
		setPersonScriptFile("jimmy chou","freeform")		
		
		-- K'TA FLY
		addPersonToStation("k'ta fly","sha v station 1","data/stations/special characters/Plotmonk1Guy_50x108_4.png")
		setPersonScriptFile("k'ta fly","freeform")		
	
		-- MORGAN YU
		addPersonToStation("morgan yu","jelnu station 1","data/stations/standing_at_bar/traderDave_50x108_4.png")
		setPersonScriptFile("morgan yu","freeform")		


		-- CJI S'RI
		addPersonToStation("cji s'ri","wma station 1","data/stations/special characters/plotmonk2_50x108_4.png")
		setPersonScriptFile("cji s'ri","freeform")	

		-- RAAL
		addPersonToStation("raal","frija","data/stations/standing_at_bar/traderRoop_50x108_4.png")
		setPersonScriptFile("raal","freeform")
		
		
		-- EVAN T'NY (CLUE #1)
		addPersonToStation("evan t'ny","qrima station 2","data/stations/special characters/GebbosAquan_50x108_4.png")
		setPersonScriptFile("evan t'ny","freeform")		

		-- GLOR OPS (CLUE #2)
		addPersonToStation("glor ops","ula station 1","data/stations/standing_at_bar/BboxsitterShow_50x108_4.png")
		setPersonScriptFile("glor ops","freeform")	

		-- GERI H'GE (CLUE #3)
		addPersonToStation("geri h'ge","iviga","data/stations/standing_at_bar/BFronterBag_50x108_4.png")
		setPersonScriptFile("geri h'ge","freeform")

		-- RH 445 (CLUE #4)
		addPersonToStation("rh 445","jowe","data/stations/standing_at_bar/kryto_50x108_4.png")
		setPersonScriptFile("rh 445","freeform")
		
		-- 433-2C (TAOIST BOSS)
		addPersonToStation("433-2c","walker base","data/stations/standing_at_bar/robo1_50x108_4.png")
		setPersonScriptFile("433-2c","freeform")
		
		-- J'MES LEARNER (10 KILLS GUY)
		addPersonToStation("j'mes learner","qucieda","data/stations/standing_at_bar/zoidman2_50x130_4.png")
		setPersonScriptFile("j'mes learner","freeform")

		--- SOME SPECIAL PEOPLE LITTERED AROUND
		addPersonToStation("jim tapley","veronyeja","data/stations/standing_at_bar/suitPaper_50x108_4.png")
		--setPersonScriptFile("jim tapley","data/scripts/special/saywhat.txt")
        addPersonToStation("magic","veronyeja","data/stations/standing_at_bar/traderWanga_50x108_4.png")
		--setPersonScriptFile("magic","data/scripts/special/magicwand.txt")

		--- SIDE CHARS
		addPersonToStation("Gebbo","ysa rithelyi","data/stations/special characters/GebboSlug_50x108_4.png")
		setPersonScriptFile("Gebbo","freeform")

  		addPersonToStation("Maijia","ysa rithelyi","data/stations/special characters/Bboxsitter1_50x108_4.png")
		setPersonScriptFile("Maijia","freeform")
        setPersonScriptFile("Maijia","data/scripts/plot/Dealer/Dealer1.txt")

   		--addPersonToStation("Dealer","ysa rithelyi","data/stations/special characters/Bboxsitter1_50x108_4.png")
		--setPersonScriptFile("Dealer","freeform")
              --setPersonScriptFile("Dealer","data/scripts/plot/Dealer/Dealer1.txt")
 	
        	--addPersonToStation("Savanha G","ysa rithelyi","data/stations/special characters/BikiniBot_50x108_4.png")
              addPersonToStation("Savanha G","ysa rithelyi","data/stations/special characters/Bwww_50x108_4.png")
		setPersonScriptFile("Savanha G","data/scripts/plot/savanhaG/savanhaG1.txt")

              addPersonToStation("Peanuts","elesw","data/stations/special characters/Bwww2_50x108_4.png")
		setPersonScriptFile("Peanuts","data/scripts/plot/peanuts/peanuts1.txt")


              ---LAX GREEN
 		addPersonToStation("Lax Green","ckesera station 1","data/stations/special characters/Bjunk_50x130_4.png")
		setPersonScriptFile("Lax Green","data/scripts/plot/greendude/greenDude1.txt")

              ---PRrichE and PRjackP   -- and Gruff_ 
 		addPersonToStation("Gruff ","ckesera station 2","data/stations/special characters/Gruff_50x108_4.png")
		setPersonScriptFile("Gruff ","data/scripts/plot/gruff/gruff3.txt")
 		addPersonToStation("Rich E","ckesera station 2","data/stations/special characters/PRRichE_50x108_4.png")
		setPersonScriptFile("Rich E","data/scripts/plot/PRRichE/PRRichE1.txt")
 		addPersonToStation("Jack P","ckesera station 2","data/stations/special characters/PRJackP_50x108_4.png")
		setPersonScriptFile("Jack P","data/scripts/plot/PRjackP/PRjackP1.txt")



              ---Bsamo
 		addPersonToStation("Hato","rub ba station 2","data/stations/special characters/Bsamo_50x108_4.png")
		setPersonScriptFile("Hato","data/scripts/plot/samoDude/samoDude1.txt")

              ---Gruff
 		addPersonToStation("Gruff","ysa rithelyi","data/stations/special characters/Gruff_50x108_4.png")
		setPersonScriptFile("Gruff","data/scripts/plot/gruff/gruff1.txt")




 		addPersonToStation("Vasquez","ysa rithelyi","data/stations/special characters/Vasquez1_50x108_4.png")
		setPersonScriptFile("Vasquez","freeform")

		addPersonToStation("Kent","rub ba station 3","data/stations/special characters/Kent_50x108_8.png")
		setPersonScriptFile("Kent","freeform")
              
              ---MISC
  		----addPersonToStation("Yong","sha v station 1","data/stations/special characters/puncher1_80x108_4.png")
              addPersonToStation("Yong","rub ba station 2","data/stations/special characters/puncher1_80x108_4.png")
		setPersonScriptFile("Yong","freeform")
              setPersonScriptFile("Yong","data/scripts/plot/Yong/Yong1.txt")

  		addPersonToStation("Surveys4cash","rub ba station 3","data/stations/special characters/surveyDude1_50x108_4.png")
		setPersonScriptFile("Surveys4cash","freeform")
              setPersonScriptFile("Surveys4cash","data/scripts/plot/Surveys4cash/Surveys4cash1.txt")



              ---Quaid Bro One
		addPersonToStation("Quaid One","rub ba station 3","data/stations/special characters/KidBOOTS_50x108_4.png")
              setPersonScriptFile("Quaid One","data/scripts/plot/PairOfDudesA/PairOfDudesA1.txt")

              ---KidAandDadA
		addPersonToStation("Ugan","rub ba station 3","data/stations/special characters/KidA_50x108_4.png")
              setPersonScriptFile("Ugan","data/scripts/plot/KidAandDadA/KidAandDadA1.txt")

              ---MINERS ON ASTEROID BASE
       	  addPersonToStation("Mic Welbeck","ssinil station 1","data/stations/standing_at_bar/miner0_50x108_4.png")
		  setPersonScriptFile("Mic Welbeck","freeform") 
     		  addPersonToStation("Kelly Bebop","ssinil station 1","data/stations/standing_at_bar/miner1_50x108_4.png")
		  setPersonScriptFile("Kelly Bebop","freeform")   
   		  addPersonToStation("Chief Miner","ssinil station 1","data/stations/special characters/minerSpec_50x108_4.png")
	 	  setPersonScriptFile("Chief Miner","freeform")	
       	  addPersonToStation("Del Bebop","ssinil station 1","data/stations/standing_at_bar/miner2_50x108_4.png")
		  setPersonScriptFile("Del Bebop","freeform")         
       	  addPersonToStation("Bao Lang","ssinil station 1","data/stations/standing_at_bar/miner01_50x108_4.png")
		  setPersonScriptFile("Bao Lang","freeform") 

                ---HBE Cops 
                     --officer grah is added after talked to 1st cop (him)

        	addPersonToStation("Chun Ke","hbe","data/stations/special characters/bigCop1_80x108_4.png")
              setPersonScriptFile("Chun Ke","data/scripts/plot/PairOfDudesB/PairOfDudesB2.txt")
        	addPersonToStation("Swift","hbe","data/stations/police/police4_50x108_5.png")
              setPersonScriptFile("Swift","freeform")
       	addPersonToStation("Cpt. Gerald","hbe","data/stations/police/police3_50x108_5.png")
              setPersonScriptFile("Cpt. Gerald","freeform")


         	addPersonToStation("Cpt. John Brown","hbe","data/stations/police/visorPolice_50x108_5.png")
              setPersonScriptFile("Cpt. John Brown","freeform")
         
		-- OTHER INIT STUFF HERE

        setStoryVar(Index,2)
        storyVar=2
		
        storyOfBoss=-1
		
		setStoryVar(KentStoryIndex,-2)
        storyOfKent=-2
	end

	if (storyVar==500) then
			if (timesDocked() < 1) then

--startCutScene("data/cutscenes/act1PolBOSS.txt","ACT I: Police Boss")
--startCutScene("data/cutscenes/act1esta.txt","ACT I: establishing shot")	
--startCutScene("data/cutscenes/act1.txt","ACT I: Largo Cargo")
--print("There is a ship called Largo with gold on it. Bad Boss and Goons want it.") 
--startCutScene("data/cutscenes/frank1.txt","Gebbo Slug and A-quan get Frank to Cage fight")
--print("Gebbo Slug and A-quan get Frank to Cage fight") 

--The above now happens in the NewGame.bmx


--startCutScene("data/cutscenes/act1esta.txt","ACT I: establishing shot")	
--startCutScene("data/cutscenes/act1.txt","ACT I: Largo Cargo")
--startCutScene("data/cutscenes/frank1.txt","")

--startCutScene("data/cutscenes/frank2.txt","")

--startCutScene("data/cutscenes/act1aPre.txt","Pre Warning Idle Talk")
--startCutScene("data/cutscenes/act1a.txt","Warning")
--startCutScene("data/cutscenes/frank3.txt","")
--startCutScene("data/cutscenes/act1b.txt","The Hit ")
--startCutScene("data/cutscenes/act1c.txt","J-bo gone")
--startCutScene("data/cutscenes/frank4.txt","")

--startCutScene("data/cutscenes/act1d.txt","J-bo replacement")
--startCutScene("data/cutscenes/act1d2.txt","replacement dead")	


--startCutScene("data/cutscenes/dreamBigO.txt","")
--startCutScene("data/cutscenes/act2.txt","ACT 2:")
--startCutScene("data/cutscenes/act3.txt","")
--startCutScene("data/cutscenes/act3a.txt","")
--startCutScene("data/cutscenes/act3b.txt","")
--startCutScene("data/cutscenes/act3c.txt","")
--startCutScene("data/cutscenes/act4.txt","")
--startCutScene("data/cutscenes/act5.txt","")
--startCutScene("data/cutscenes/act5a.txt","")
--startCutScene("data/cutscenes/act5b.txt","")
--startCutScene("data/cutscenes/act5c.txt","")
--startCutScene("data/cutscenes/act6.txt","")
--startCutScene("data/cutscenes/act7.txt","")
--startCutScene("data/cutscenes/act8.txt","")
--startCutScene("data/cutscenes/act9a.txt","")
--startCutScene("data/cutscenes/act9b.txt","")
--startCutScene("data/cutscenes/act10.txt","")

				setStoryVar(Index,2)
				storyVar=2
			end
	end

	if (storyVar==2) then
		if (youTalkedTo("officer grah")==1) then 	
		   -- now change your ship
		   changeShipTo("shuttle") 
		   setShipHull(51,86)
		   givePlayerMoney(1500)
		   giveCargo("hydrogen fuel",2)
		   --giveUpgrade("show mission in map")
		   changeFuel(1)
                 setPersonScriptFile("Gebbo","data/scripts/plot/gebbo/gebbo1.txt")
                 setPersonScriptFile("Vasquez","data/scripts/plot/vasquez/vasquez1.txt")
                 setPersonScriptFile("Kent","data/scripts/plot/kent/kent1.txt")
		   setPersonScriptFile("frank zoed","data/scripts/plot/frank/frank1.txt")
                 setPersonScriptFile("Chief Miner","data/scripts/plot/ChiefMiner/ChiefMiner1.txt")
                 setPersonScriptFile("Kelly Bebop","data/scripts/plot/KellyBebop/KellyBebop1.txt")

                 --next Grah has space after name as it was switching to ovl2
        	   addPersonToStation("grah onhbe","hbe","data/stations/special characters/policeOfficerGrah_50x108_5.png")
                 setPersonScriptFile("grah onhbe","data/scripts/plot/OfficerGrah/OfficerGrah1.txt")

		   addContact("Frank zoed","????, andinti")
		   addContact("Kent the droid","On the loose, andinti")
                 addContact("Vasquez","Ysa rithelyi, andinti")
		   giveDataDisc("captain's log 2.txt")
	             
		   setStoryVar(Index,3)
		   storyVar=3
		end

	end
	


if (youTalkedTo("vasquez")==1) then
setPersonScriptFile("Vasquez","data/scripts/plot/vasquez/vasquez2.txt")	
removeContact("Vasquez")
end

-- This is when you talk to kent on Rub Ba Station 2
if (youTalkedTo("kent")==1) and getStoryVar(Index) < 35 then
	setPersonScriptFile("kent","data/scripts/plot/kent/kent2.txt")	
	removePersonFromStation("kent","rub ba station 3")
	removeContact("Kent the droid")
end

-- This is on the final boss planet, before having killed boss
if (youTalkedTo("kent")==1) and getStoryVar(Index) == 35 then
	setPersonScriptFile("kent","data/scripts/plot/kentfinal/kentfinal2.txt")
end




if (youTalkedTo("gebbo")==1) then
setPersonScriptFile("gebbo","data/scripts/plot/gebbo/gebbo2.txt")
end
if (youTalkedTo("Savanha G")==1) then
setPersonScriptFile("Savanha G","data/scripts/plot/SavanhaG/SavanhaG2.txt")
end
if (youTalkedTo("Peanuts")==1) then
setPersonScriptFile("Peanuts","data/scripts/plot/peanuts/peanuts2.txt")
end
if (youTalkedTo("Chief Miner")==1) then
 setPersonScriptFile("Chief Miner","data/scripts/plot/ChiefMiner/ChiefMiner2.txt")
end
if (youTalkedTo("Kelly Bebop")==1) then
 setPersonScriptFile("Kelly Bebop","data/scripts/plot/KellyBebop/KellyBebop2.txt")	
end
if (youTalkedTo("Yong")==1) then
 setPersonScriptFile("Yong","data/scripts/plot/Yong/Yong2.txt")
end
if (youTalkedTo("grah onhbe")==1) then
 setPersonScriptFile("grah onhbe","data/scripts/plot/OfficerGrah/OfficerGrah2.txt")
end
if (youTalkedTo("Injured Cop")==1) then
 setPersonScriptFile("Injured Cop","data/scripts/plot/dyingCop/dyingCop2.txt")
 removeContact("Stab Drones reported")
 addContact("Stab Drones - Danger","Multiple Stations, Aolbe")
end



if (youTalkedTo("Surveys4cash")==1) then
   if getStoryVar(Surveys4CashIndex)==0 then
		setPersonScriptFile("Surveys4cash","data/scripts/plot/Surveys4cash/Surveys4cash2.txt")
		removePersonFromStation("Surveys4cash","rub ba station 3")
		
		addPersonToStation("CoolK","rub ba station 3","data/stations/special characters/CoolK_50x108_4.png")
		setPersonScriptFile("CoolK","data/scripts/plot/CoolK/CoolK1.txt")
		setStoryVar(Surveys4CashIndex, 1)
	end
end

if (youTalkedTo("CoolK")==1) then
	setPersonScriptFile("CoolK","data/scripts/plot/CoolK/CoolK2.txt")
end

-----------------KIDA and DAD
if (youTalkedTo("Ugan")==1) then
   if getStoryVar(UganHiroIndex)==0 then
		setPersonScriptFile("Ugan","data/scripts/plot/KidAandDadA/KidAandDadA2.txt")
		addPersonToStation("Hiro","ysa rithelyi","data/stations/special characters/KidADad_50x108_4.png")
		setPersonScriptFile("Hiro","data/scripts/plot/KidAandDadB/KidAandDadB1.txt")
		--print("Falcon talked to Ugan who had missing Dad.")
		setStoryVar(UganHiroIndex, 1)
	end
end

if (youTalkedTo("Hiro")==1) then
   if getStoryVar(UganHiroIndex)==1 then
		setPersonScriptFile("Hiro","data/scripts/plot/KidAandDadB/KidAandDadB2.txt")
		removePersonFromStation("Hiro","ysa rithelyi")
		removePersonFromStation("Ugan","rub ba station 3")
		addPersonToStation("Ugan+Hiro","rub ba station 3","data/stations/special characters/KidAandDad_50x108_4.png")
		setPersonScriptFile("Ugan+Hiro","data/scripts/plot/KidAandDadA/KidAandDadA3.txt")
		 --print("Falcon found Ugan's missing Dad.")
		--addPersonToStation("Hiro","rub ba station 3","data/stations/special characters/KidADad_50x108_4.png")
		setStoryVar(UganHiroIndex, 2)
	end
end

if (youTalkedTo("Ugan+Hiro")==1) then
   if getStoryVar(UganHiroIndex)==3 then
		removePersonFromStation("Ugan+Hiro","rub ba station 3")
		setStoryVar(UganHiroIndex, 4)
	end
   if getStoryVar(UganHiroIndex)==2 then
		setPersonScriptFile("Ugan+Hiro","data/scripts/plot/KidAandDadA/KidAandDadA4.txt")
		setStoryVar(UganHiroIndex, 3)
	end
end
-------------------
-----------------Quaid Bros
if (youTalkedTo("Quaid One")==1) then
   if getStoryVar(QuaidIndex)==0 then
		setPersonScriptFile("Quaid One","data/scripts/plot/PairOfDudesA/PairOfDudesA2.txt")
		addPersonToStation("Quaid Two","rub ba station 2","data/stations/special characters/KidBOOTS_50x108_4.png")
		setPersonScriptFile("Quaid Two","data/scripts/plot/PairOfDudesB/PairOfDudesB1.txt")
		setStoryVar(QuaidIndex, 1)
	end
end

if (youTalkedTo("Quaid Two")==1) then
	setPersonScriptFile("Quaid Two","data/scripts/plot/PairOfDudesB/PairOfDudesB2.txt")
end
-------------------1st Trader from Jacket Maijia

if (youTalkedTo("Maijia")==1) then
   if getStoryVar(MaijiaIndex)==0 then
		setPersonScriptFile("Maijia","data/scripts/plot/Dealer/Dealer1b.txt")
		addPersonToStation("Maijia Seller","elesw","data/stations/special characters/BboxsitterW_50x108_4.png")
		setPersonScriptFile("Maijia Seller","data/scripts/plot/Dealer/Dealer2.txt")
		removePersonFromStation("Maijia","ysa rithelyi")
		
		addContact("Maija","Deal (20 cargo space), Elesw")
		setStoryVar(MaijiaIndex, 1)
   end
end

if (youTalkedTo("Maijia Seller")==1) then
	if getStoryVar(MaijiaIndex)==1 then 
		setPersonScriptFile("Maijia Seller","data/scripts/plot/Dealer/Dealer2b.txt")
		removePersonFromStation("Maijia Seller","elesw")
		addPersonToStation("Maijia the Seller","hbe","data/stations/special characters/BboxsitterD_50x108_4.png")
		setPersonScriptFile("Maijia the Seller","data/scripts/plot/Dealer/Dealer3.txt")
		
		removeContact("Maija")
		addContact("Maijia Seller","Diamonds deal. HBE station, Ceayti")
		makeSystemVisible("Ceayti")
		setStoryVar(MaijiaIndex, 2)
	end
 end

---------------

if (youTalkedTo("Maijia the Seller")==1) then
	if getStoryVar(MaijiaIndex)==2 then 
		setPersonScriptFile("Maijia the Seller","data/scripts/plot/Dealer/Dealer3b.txt")
		removeContact("Maijia Seller")
              removePersonFromStation("Maijia Seller","hbe")
		setStoryVar(MaijiaIndex, 3)
   end
end


if (youTalkedTo("Lax Green")==1) then
 setPersonScriptFile("Lax Green","data/scripts/plot/greendude/greenDude2.txt")
end

if (youTalkedTo("Gruff")==1) then
 setPersonScriptFile("Gruff","data/scripts/plot/gruff/gruff2.txt")
 removePersonFromStation("Gruff","ysa rithelyi")
end


if (youTalkedTo("Gruff ")==1) then
 setPersonScriptFile("Gruff ","data/scripts/plot/gruff/gruff4.txt")
 removePersonFromStation("Gruff ","ckesera station 2")
 removePersonFromStation("Gruff","ysa rithelyi")
end
if (youTalkedTo("Rich E")==1) then
 setPersonScriptFile("Rich E","data/scripts/plot/PRRichE/PRRichE2.txt")
 removePersonFromStation("Rich E","ckesera station 2")
end

if (youTalkedTo("Jack P")==1) then
 setPersonScriptFile("Jack P","data/scripts/plot/PRjackP/PRjackP2.txt")
 removePersonFromStation("Jack P","ckesera station 2")
end


if (youTalkedTo("Hato")==1) then
 setPersonScriptFile("Hato","data/scripts/plot/samoDude/samoDude2.txt")
end

      if (timesDocked()==1) then	
        if (storyOfBoss==-1) then                             
			-- startCutScene("data/cutscenes/frank2.txt","")               	-------frank 2 cutscene
                     -- print("Captain Liu and Crew confront Frank")
			-- startCutScene("data/cutscenes/act1esta.txt","ACT I: establishing shot")	
			-- startCutScene("data/cutscenes/act1.txt","ACT I: Largo Cargo")
			-- print("There is a ship called Largo with gold on it. Bad Boss and Goons want it.") 
	      --setStoryVar(Index,300)
	      --storyVar=300
             storyOfBoss=0
             
	  end
	end


	if (storyVar==3) then
		-- you now have the shuttle and a contact called frank zoed.
		if (youDockedAtAll()==1) then
	        if (youTalkedTo("frank zoed")==1) then
			
				awardAchievement("talkedFrank")
				
	            local answer=getMissionAnswer()
	        
	        	if (answer=="yes") then
	        		-- you have said yes to the mission.
	        		removeContact("frank zoed")
	        		addContact("jimmy chou","????, andinti")
                    setPersonScriptFile("frank zoed","data/scripts/plot/frank/frank2.txt") 
                    setPersonScriptFile("jimmy chou","data/scripts/plot/jimmy/jimmy1.txt")

					--givePlayerMission("data/missions/plot/frank/frank1.lua")
					setStoryVar(Index,5)
					storyVar=5
	        	else
	        		-- nothing, just wait until you answer yes.
	        		-- this script recaps and asks again. saves repeating yourself.
					setPersonScriptFile("frank zoed","data/scripts/plot/frank/frank3.txt")
	        	end
			else
				if ((timesDocked()>=10) and ( storyOfFrank==0 )) then
					setStoryVar(FrankStoryIndex,1)
					storyOfFrank=1
					info2("Transmission from Kent (carrier signal confirmed): Hey Chief, Remember Frank who sold us that stolen ship? He's on rub ba station 2 right now. Go find him quick in case he's still got our money!")
					removeContact("frank zoed")
					addContact("Frank zoed","rub ba station 2, andinti")
				end
	        end
		end
	end
	
	--Use this to correct old savegames, setting storyOfBoss to the final setting
	if (timesDocked()>=30) then
		storyOfBoss=7
	end

	if (storyOfBoss==0) then
		if (timesDocked()==2) then
                            --startCutScene("data/cutscenes/act1PolBOSS.txt","ACT I: Police Boss")      ---Police Boss here?
                            --startCutScene("data/cutscenes/frank3.txt","")              ----frank 3  Frank hides from cops interview
				
                            storyOfBoss=1
				setStoryVar(BossStuffIndex, storyOfBoss)
		end
	end
	
	if (storyOfBoss==1) then
		if (timesDocked() ==3) then	
                            -- add a variable to check if you have package?	
                            -- mod background so it looks like you were stopped on your way into the lift.
				-- startCutScene("data/cutscenes/act1aPre.txt","Pre Warning Idle Talk")
                            -- startCutScene("data/cutscenes/frank1.txt","Gebbo Slug and A-quan get Frank to Cage fight")
                            -- print("Gebbo Slug and A-quan get Frank to Cage fight") 
				startCutScene("data/cutscenes/act1a.txt","The Second Warning")  

			-- startCutScene("data/cutscenes/act1esta.txt","ACT I: establishing shot")	
			-- startCutScene("data/cutscenes/act1.txt","ACT I: Largo Cargo")
                            -- print("There is a ship called Largo with gold on it. Bad Boss and Goons want it.") 
				storyOfBoss=2
				setStoryVar(BossStuffIndex, storyOfBoss)	 -- save this to the array to save with the save game
				-- print("Pre Warning Idle Talk")
				--print("Second Warning given to Falcon")		
		end
	end

	if (storyOfBoss==2) then
		if (timesDocked()==6) then
                            --startCutScene("data/cutscenes/frank5.txt","")   ---frank 5 LingLiu
				--print("Ling Liu reveall she may have found the Largo")	
				startCutScene("data/cutscenes/act1b.txt","ACT I: The Hit")
				storyOfBoss=3
				setStoryVar(BossStuffIndex, storyOfBoss)
			       --print("The Hit on Falcon is ordered, sending J-Bo in jetsuit")
		end		
	end


	if (storyOfBoss==3) then
		if (timesDocked()==7) then
			--- after J-Bo (helmet guy) is dead/missing
			startCutScene("data/cutscenes/act1c.txt","ACT I: J-Bo gone")
			storyOfBoss=4
			setStoryVar(BossStuffIndex, storyOfBoss)
			-- print("J-Bo gone missing")
		end
	end

	if (storyOfBoss==4) then
		if (timesDocked()>=8) then
			if (youDockedAtAll()==0) then
				if (math.random(1,1000)==1) then
					storyOfBoss=5
					setStoryVar(BossStuffIndex, storyOfBoss)
					
					removePersonFromStation("Quaid One","rub ba station 3")
					removePersonFromStation("CoolK","rub ba station 3")
					removePersonFromStation("Surveys4cash","rub ba station 3")
					removePersonFromStation("Ugan","rub ba station 3")
					removePersonFromStation("Vasquez","ysa rithelyi")
					
					removeContact("Vasquez")

					if (storyOfKent<1) then
						removePersonFromStation("kent","rub ba station 3")
						removeContact("Kent the droid")
						addPersonToStation("kent largostory","rub ba station 3","data/stations/special characters/Kent_50x108_8.png")
						setPersonScriptFile("kent largostory","data/scripts/plot/kentLargo/kentLargo1.txt")
						addContact("Kent: Meet me at","rub ba station 3, andinti")
						info2("Transmission from Kent (carrier signal confirmed): Got some big news. Meet me at Rub Ba Station 3. I've sent you my contact. (Open Personal Screen, then select Contacts)")
					else
						info2("Transmission from Vasquez (carrier signal confirmed): I heard a rumor that the Largo is zooming around Andinti, and she's stuffed full of gold. Wanna bet who finds her first?")
						addContact("The Largo","????, andinti")
					end
				end
			end
		end
	end


if (youTalkedTo("kent largostory")==1) and (storyOfLargo<1) then
setPersonScriptFile("kent largostory","data/scripts/plot/kentLargo/kentLargo2.txt")
removeContact("Kent: Meet me at")
addContact("The Largo","????, andinti")

setStoryVar(LargoStoryIndex,1)
storyOfLargo=1
end


	
	if (storyOfBoss==5) then
		if (timesDocked()>=25) then
			if (youDockedAtAll()==0) then
		
			if (storyOfKent<1) then
				-- Remove Kent before the RubBa3 crash happens
				removePersonFromStation("kent largostory","rub ba station 3")
				removeContact("Kent: Meet me at")
				-- change to new 'after crash' Kent and script
				addPersonToStation("kent afterlargohit","rub ba station 3","data/stations/special characters/Kent_50x108_8.png")
				setPersonScriptFile("kent afterlargohit","data/scripts/plot/kentLargo/kentLargoHit3.txt")
				
				info2("Transmission from Kent (carrier signal confirmed): Chief, come see me at Rub Ba Station 3 quick! It's about the Largo!")
			else
				info2("Transmission from Vasquez (carrier signal confirmed): John, you need to come to Rub Ba Station 3 quick! It's about the Largo!")
			end
			
			removeContact("The Largo")
			addContact("News about Largo","rub ba station 3, andinti")
			
			addPersonToStation(" CoolK ","rub ba station 3","data/stations/special characters/CoolK_50x108_4.png")
		    setPersonScriptFile(" CoolK ","data/scripts/plot/CoolK/CoolK3.txt")

			storyOfBoss=6
			setStoryVar(BossStuffIndex, storyOfBoss)
			end
		end
	end

if (youTalkedTo("kent afterlargohit")==1) then
	setPersonScriptFile("kent afterlargohit","data/scripts/plot/kentLargo/kentLargoHit4.txt")
	removePersonFromStation("kent afterlargohit","rub ba station 3")

	if getStoryVar(VasquezIndex)==0 then
		addPersonToStation("Vasquez ","ysa rithelyi","data/stations/special characters/Vasquez1_50x108_4.png")
		setPersonScriptFile("Vasquez ","data/scripts/plot/vasquez/vasquez3.txt")
		
		setStoryVar(VasquezIndex, 1)
	end
end

if (youTalkedTo(" CoolK ")==1) then
setPersonScriptFile(" CoolK ","data/scripts/plot/CoolK/CoolK4.txt")
end

if (youTalkedTo("vasquez ")==1) then
	setPersonScriptFile("Vasquez ","data/scripts/plot/vasquez/vasquez4.txt")	
end
	
	if (storyOfBoss==6) then
		-- Wait for Player to dock at Rub Ba Station 3. Bmx code will change storyOfBoss to 7
	end
	
	if (storyOfBoss==7) then
		removeContact("News about Largo")
	end



	if (storyVar==5) then
		-- we're waiting for you to talk to jimmy

		if (youTalkedTo("jimmy chou")==1) then -- you've successfully completed this mission

			awardAchievement("talkedJimmy")
			
            giveDataDisc("captain's log 3.txt")
            
			removeContact("jimmy chou")
			addContact("k'ta fly","sha v station 1, sophiha")
			
			setPersonScriptFile("jimmy chou","data/scripts/plot/jimmy/jimmy2.txt")
			setPersonScriptFile("k'ta fly","data/scripts/plot/ktafly/ktafly1.txt")
			makeSystemVisible("sophiha")		

				--startCutScene("data/cutscenes/act1d.txt","J-bo replacement")
				--startCutScene("data/cutscenes/act1d2.txt","replacement dead")
				--print("Showed J-bo replacement killed.")

            setStoryVar(Index,6)
			storyVar=6
		end
	end
	
	if (storyVar==6) then
	    -- you now have to get a split drive capable ship... earn enough money, etc
	    -- now you get to talk to k'ta fly for the first time...
	    
		if (youDockedAtAll()==1) then
	        if (youTalkedTo("k'ta fly")==1) then
	        	if (getMissionAnswer()=="yes") then
	        		-- you have said yes to the mission.					
					givePlayerMission("data/missions/plot/ktafly/ktafly1.lua") 					
					makeSystemVisible("leesti")
					setStoryVar(Index,7)
					storyVar=7
					startCutScene("data/cutscenes/act2.txt","ACT II: The Prophecy") --Act 2
	        	else
	        		-- nothing, just wait until you answer yes.
	        	end
	        end
		end
	end

	if (storyVar==7) then
	   -- you have to get the cargo container from the station to k'ta fly
	   -- along the way you'll encounter some cleaner scout ships near the target system.
	   -- you'll attempt to fight but then just run.
	
		local complete=missionHasFinished("data/missions/plot/ktafly/ktafly1.lua")

		if (complete==1) then -- you've successfully completed this mission            
			if (youTalkedTo("k'ta fly")==1) then							
                giveDataDisc("captain's log 4.txt")
				setPersonScriptFile("k'ta fly","data/scripts/plot/ktafly/ktafly4.txt")
				removePersonFromStation("k'ta fly","sha v station 1")
				removeContact("k'ta fly")
				setStoryVar(Index,8)
				storyVar=8
			end
            
        elseif (complete==2) then -- failed/cancelled
           
			setPersonScriptFile("k'ta fly","data/scripts/plot/ktafly/ktafly1.txt")  -- restart mission dialogue.      	
			setStoryVar(Index,6)
			storyVar=6
		end
	end

	if (storyVar==8) then    
	    if (youDockedAtAll()==0) then
	    	startCutScene("data/cutscenes/act3.txt","ACT III: The Plot")
	        setStoryVar(Index,9)
	        storyVar=9
	    end		
	end

	if (storyVar==9) then
	    if (youDockedAtAll()==0) then
	    	if (math.random(1,6000)==1) then
                giveDataDisc("captain's log 5.txt")
				info2("Transmission from K'ta Fly (unsigned carrier signal): A friend of mine could use someone like you. I've added a contact to your contact list. See him, he can help you.")
	        	addContact("morgan yu","Jelnu Station 1, Edsoda")
	        	makeSystemVisible("edsoda")
	        	setPersonScriptFile("morgan yu","data/scripts/plot/morganyu/morganyu1.txt")	        	
	        	setStoryVar(Index,10)
	        	storyVar=10
	        end
	    end
	end
	
	if (storyVar==10) then
	    -- you go and se morgan yu. he offers you a mission to transport a package to Ssinil Station 1 in the daphice system
	    -- when you leave it explodes.

		if (youDockedAtAll()==1) then
	        if (youTalkedTo("morgan yu")==1) then
	        	if (getMissionAnswer()=="yes") then
	        		-- you have said yes to the mission.
					setPersonScriptFile("morgan yu","data/scripts/plot/morganyu/morganyu3.txt")
					givePlayerMission("data/missions/plot/morganyu/morganyu1.lua")

                    giveDataDisc("captain's log 6.txt")

					makeSystemVisible("daphice")
					
					makeNebulaVisible(7,6)
					makeNebulaVisible(7,5)
					
					makeNebulaVisible(6,5)
					makeNebulaVisible(6,6)
					
					makeNebulaVisible(6,7)
					makeNebulaVisible(6,8)
										
					setStoryVar(Index,11)
					storyVar=11
	        	else
	        		-- nothing, just wait until you answer yes.
	        		setPersonScriptFile("morgan yu","data/scripts/plot/morganyu/morganyu2.txt")
	        	end
	        end
		end
    end

	if (storyVar==11) then
	
        -- you have accepted morgan yu's mission. wait until you've completed it, and story is progressed
		
		-- for progressing story, check: morganyu1.lua >> finishSuccess()
    end

	if (storyVar==12) then
		
        -- wait til you undock then wait til you're far enough from daphice
        if (youDockedAtAll()==0) then
			if (getDistanceToSystem("daphice") > 89000) then
				removeContact("morgan yu")
				removePersonFromStation("morgan yu","jelnu station 1") -- gets rid of him forever.
				
                giveDataDisc("captain's log 7.txt")
				setShipHull(12,26)
	            setStoryVar(Index,13)
	            storyVar=13
			end
        end
	end
	
	if (storyVar==13) then
	    startCutScene("data/cutscenes/act3a.txt","ACT III: The Plot")
	    startCutScene("data/cutscenes/act3b.txt","ACT III: The Plot")
	    startCutScene("data/cutscenes/act3c.txt","ACT III: The Plot")	    
	    releaseNewsStory("data/text/news/plot/daphicesupernova.txt")

		-- Pause main story for now
		setStoryVar(Index,14)
		storyVar=14
			
		setStoryVar(KentStoryIndex,-1)
	end
	
	if (storyOfKent==-1) then
	    createTimer("kent call [hidden]","time till kent calls","0:20")
		setStoryVar(KentStoryIndex,1)
	end
	
	if (storyOfKent==1) then
	    if (timerFinished("kent call [hidden]")==1) then
            destroyTimer("kent call [hidden]")
			info2("Transmission from Kent (carrier signal confirmed): Hey Chief, I've gotten myself in some trouble. Swing by HBE station in the Ceayti System when you can.")
			addContact("Kent in trouble","HBE, Ceayti")
			makeSystemVisible("Ceayti")
			
			-- remove Kent on all stations he may be
			removePersonFromStation("Kent","rub ba station 3")
			removePersonFromStation("kent largostory","rub ba station 3")
			removePersonFromStation("kent afterlargohit","rub ba station 3")
			removeContact("Kent: Meet me at")
			removeContact("Kent the droid")
			removePersonFromStation("Chun Ke","hbe") 
			
			addPersonToStation("Kent KentStory","hbe","data/stations/special characters/KentCaged_50x256_8.png")
			setPersonScriptFile("Kent KentStory","data/scripts/plot/kentHbe/kent1.txt") -- "I'm in it deep. Really deep. Much worse than that time in the garbage compactor. Please talk to Grah and bust me out of here."
			
			--removePersonFromStation("Cpt. John Brown","hbe") 
			 --removePersonFromStation("Cpt. Gerald","hbe") 
			removePersonFromStation("grah onhbe","hbe") -- replaces him with Kent storyline Grah. Need this or else he goes into his OfficerGrah2 dialogue after you talk to him
			addPersonToStation("Grah KentStory","hbe","data/stations/special characters/policeOfficerGrah_50x108_5.png")
			setPersonScriptFile("Grah KentStory","data/scripts/plot/OfficerGrah/OfficerGrah3.txt") -- "Your friend over there is in a bunch of trouble. You should talk to him."
			
			setStoryVar(KentStoryIndex,2)
		end
	end
	
	if (storyOfKent==2) then
		if (youTalkedTo("Kent KentStory")==1) then
			removeContact("Kent in trouble")
			addContact("Officer Grah","HBE, Ceayti")
			setPersonScriptFile("Kent KentStory","data/scripts/plot/kentHbe/kent1a.txt") -- "Talk to Grah and get me out of here Chief!"
			setPersonScriptFile("Grah KentStory","data/scripts/plot/OfficerGrah/OfficerGrah4.txt") -- "Ok, there's one thing you could do. There are these crazy Drones all over the place and half my officers are dead or wounded from fighting them. If you can take enough of them out so they're not a threat, I will let your robotic friend go."
			setStoryVar(KentStoryIndex,3)
		end
	end
	
	if (storyOfKent==3) then
		if (youTalkedTo("Grah KentStory")==1) then
		
			setStoryVar(KentStoryHasClearedStation1,0)
			setStoryVar(KentStoryHasClearedStation2,0)
			setStoryVar(KentStoryHasClearedStation3,0)
			
			addContact("Stab Drones reported","brorelocci station 1, Aolbe")
			makeSystemVisible("aolbe")
			
			addPersonToStation("Injured Cop","brorelocci station 1","data/stations/special characters/KentCaged_50x256_8.png")
			setPersonScriptFile("Injured Cop","data/scripts/plot/dyingCop/dyingCop1.txt")
			
			setPersonScriptFile("Kent KentStory","data/scripts/plot/kentHbe/kent2.txt") -- "Sorry I got you caught up in this chief"
			setPersonScriptFile("Grah KentStory","data/scripts/plot/OfficerGrah/OfficerGrah5.txt") -- "Falcon. Why are you still here? Get out there and kill those Drones."
			
			giveDataDisc("captain's log 8.txt")
			
			setStoryVar(KentStoryIndex,4)
		end
	end
	
	if (storyOfKent==4) then
		
		if (youTalkedTo("bar droid")==1) and (getDistanceToStation("brorelocci station 1") < 100) and ( getStoryVar(KentStoryHasTalkedBarDroid) == 0 ) then
			removeContact("Stab Drones reported")
			addContact("Stab Drones - Danger","Multiple Stations, Aolbe")
			setStoryVar(KentStoryHasTalkedBarDroid,1)
		end
		
		if (getStoryVar(KentStoryHasClearedStation1) == 1) and (getStoryVar(KentStoryHasClearedStation2) == 1) then
	
			createTimer("grah call [hidden]","time till grah calls","0:04")
			setStoryVar(KentStoryIndex,5)
		end
	end
	
	if (storyOfKent==5) then
	    if (timerFinished("grah call [hidden]")==1) then
            destroyTimer("grah call [hidden]")
			
			removeContact("Stab Drones reported")
			removeContact("Stab Drones - Danger")
			
			addContact("Source of Drones","ulic station 2, ceenlia")
			makeSystemVisible("ceenlia")
			
			info2("Transmission from Officer Grah (carrier signal confirmed): Well done. We traced the source of the drones to ulic station 2 in the Ceenlia system. [br] [br] Head east through the gap in the nebula to get there quick. destroy the source!")
			
			makeNebulaVisible(6,11)
			makeNebulaVisible(6,12)
			
			makeNebulaVisible(7,11)
			makeNebulaVisible(7,12)
			
			setStoryVar(KentStoryIndex,6)
		end
	end
	
	if (storyOfKent==6) then
		if (getStoryVar(KentStoryHasClearedStation3) == 1) then
		
			removeContact("Source of Drones")
	
			createTimer("grah calls again [hidden]","time till grah calls again","0:05")
			setStoryVar(KentStoryIndex,7)
		end
	end
	
	if (storyOfKent==7) then
	    if (timerFinished("grah calls again [hidden]")==1) then
            destroyTimer("grah calls again [hidden]")
			info2("Transmission from Officer Grah (carrier signal confirmed): Falcon, Grah here. I've just received notice that the drone threat is under control. [br] [br] Come see me at HBE station at once.")
			
			removePersonFromStation("Grah KentStory","hbe")
			addPersonToStation("grah 2 kentstory","hbe","data/stations/special characters/policeOfficerGrah_50x108_5.png")
			setPersonScriptFile("grah 2 kentstory","data/scripts/plot/OfficerGrah/OfficerGrah6.txt") -- "well done, kent is free, take the gun, leave the cannoli"
			removePersonFromStation("Kent KentStory","hbe")
			addPersonToStation("Kent KentStory","hbe","data/stations/special characters/kentBalloon_50x256_8.png")
			setPersonScriptFile("Kent KentStory","data/scripts/plot/kentHbe/kent2a.txt") -- " well done, Grah wants to see you."
			
			addPersonToStation("Rich","hbe","data/stations/special characters/PRrichCaged_50x256_8.png")
			setPersonScriptFile("Rich","data/scripts/plot/PRrichE/PRrichHBE1.txt")

			setStoryVar(KentStoryIndex,8)
		end
	end
	
	if (storyOfKent==8) then	
		if (youTalkedTo("grah 2 kentstory")==1) then
			setPersonScriptFile("Kent KentStory","data/scripts/plot/kentHbe/kent3.txt") -- "thanks chief. Grah will let me out as soon as the paperwork's through. let's meet up on the ship."
			removePersonFromStation("Kent KentStory","hbe")
			removePersonFromStation("Injured Cop","brorelocci station 1")
			removePersonFromStation("Rich","hbe")
			removePersonFromStation("Vasquez ","ysa rithelyi")
			setPersonScriptFile("grah 2 kentstory","data/scripts/plot/OfficerGrah/OfficerGrah7.txt") -- "well done again, the force could use a fine gunslinger like you"
			
			removeContact("Officer Grah")
			removeContact("Vasquez")
			
			giveDataDisc("captain's log 9.txt")
			
			setStoryVar(KentStoryIndex,9)
		end
	end
	
	if (storyOfKent==9) then
		if (youDockedAtAll()==0) then
		
			-- TODO: Set "isKentFollowingYou" to true
			
			createTimer("after kent rescue [hidden]","time till next cutscene","0:03")
		
			setStoryVar(KentStoryIndex,10)
		end
	end
	
	if (storyOfKent==10) then
	    if (timerFinished("after kent rescue [hidden]")==1) then
            destroyTimer("after kent rescue [hidden]")
			
			setStoryVar(KentStoryIndex,999)
			
			
			-- Continue main story line
			setStoryVar(StoryExperienceIndex,getExperience())
			
            giveDataDisc("captain's log 10.txt")
			startCutScene("data/cutscenes/act4.txt","ACT IV: The Four Corner Stones")
			
		    setStoryVar(Index,15)
			storyVar=15
		end
	end
	
	if (storyVar==15) then
		-- we wait until your experience is a little higher.
		if (getExperience()>(getStoryVar(StoryExperienceIndex)+15)) then
		    startCutScene("data/cutscenes/act4a.txt","ACT IV: The Four Corner Stones")
		    setStoryVar(Index,16)
		    storyVar=16
		end
	end

	if (storyVar==16) then
        if (youDockedAtAll()==0) then
            if (math.random(1,6000)==1) then
                giveDataDisc("captain's log 11.txt")
				info2("Transmission from Cji S'ri (carrier signal confirmed): Please come and see me at Wma Station 1 in the P1257+12 system. I have important information for you.")
            	addContact("Cji S'ri","Wma Station 1, P1257+12")
            	setPersonScriptFile("cji s'ri","data/scripts/plot/cjisri/cjisri1.txt")
            	makeSystemVisible("P1257+12")
				setStoryVar(Index,17)
            	storyVar=17
            end
        end

	end
	
	if (storyVar==17) then
        -- cji s'ri has left you a message. you are to meet with him.
        
        if (youTalkedTo("cji s'ri")==1) then 		
			-- change your ship, reg code and give you some money
			-- add four contacts to your list
			
			giveDataDisc("captain's log 12.txt")
			
			addContact("Wormhole","Aenso I II to Beexen II")
			
			addContact("raal","Frija, Beexen")
            removeContact("cji s'ri")									
			
			setPersonScriptFile("cji s'ri","data/scripts/plot/cjisri/cjisri2.txt") -- reminder script			
			setPersonScriptFile("raal","data/scripts/plot/raal/raal1.txt")			
						
			makeSystemVisible("beexen")
			makeSystemVisible("aenso")
			
			setStoryVar(Index,18)
			storyVar=18
        end
	end
	
	if (storyVar==18) then
		if (youTalkedTo("raal")==1) then
			
			setPersonScriptFile("cji s'ri","freeform")
			
			-- info(getDialogueAnswer())
			
			if (getDialogueAnswer()=="ship1") then
				changeShipTo("Vison Class 6")
			elseif (getDialogueAnswer()=="ship2") then
				changeShipTo("Star 4 - Recon II")
			elseif (getDialogueAnswer()=="ship3") then
				changeShipTo("Lochu")
			end
		    --
			-- if player ship is more valuable than this ship, he is given the difference in price as compensation
			-- code for this is in lua.bmx
			
		    givePlayerMoney(10000)
		    setShipHull(98,100)
		    giveCargo("hydrogen fuel",5)    
		    changeFuel(1)
			
			addContact("Evan t'ny","Qrima Station 2, Tibefa")
			addContact("Glor Ops","Ula station 1, Enuray")
			addContact("Geri H'ge","Iviga, Waiool")
			addContact("Rh 445","Jowe, Badlands")
			
			-- assign these contacts with scripts...
			setPersonScriptFile("Evan t'ny","data/scripts/plot/evantny/evantny1.txt") -- done
			setPersonScriptFile("glor ops","data/scripts/plot/glorops/glorops1.txt") -- done
			setPersonScriptFile("Geri H'ge","data/scripts/plot/gerihge/gerihge1.txt") -- done
			setPersonScriptFile("Rh 445","data/scripts/plot/rh445/rh4451.txt") -- done
			
			makeSystemVisible("tibefa")
			makeSystemVisible("enuray")
			makeSystemVisible("waiool")
			makeSystemVisible("badlands")
			
			makeNebulaVisible(15,17)
			makeNebulaVisible(15,18)
			
			makeNebulaVisible(16,17)
			makeNebulaVisible(16,18)
			
			makeNebulaVisible(17,17)
			makeNebulaVisible(17,18)
			
			-- now clean up
            removeContact("raal")			
			setPersonScriptFile("raal","data/scripts/plot/raal/raal2.txt") -- reminder script			
			
			giveDataDisc("captain's log 13.txt")
			
			setStoryVar(Index,19)
			storyVar=19
		end
	
	end
	
	-- at this point you're attempting to reach and accomplish each of the four missions to get the clues	  	
	
	
	if ((storyVar==19) or (storyVar==20) or (storyVar==21)) then
		
		-------------------------------
		-- MISSION CLUE #1, Resseth
		-- Take photo
		-- DONE
		-------------------------------
		if (getStoryVar(EvanTnyIndex)==0) then
			if (youTalkedTo("evan t'ny")==1) then
				if (getMissionAnswer()=="yes") then
					setPersonScriptFile("evan t'ny","data/scripts/plot/evantny/evantny2.txt")
					givePlayerMission("data/missions/plot/evantny/evantny1.lua")
					setStoryVar(EvanTnyIndex,1)
				else
					setPersonScriptFile("data/scripts/plot/evantny/evantny6.txt")
				end
			end
		end
		
		if (getStoryVar(EvanTnyIndex)==1) then
			local complete=missionHasFinished("data/missions/plot/evantny/evantny1.lua")
			if (complete==1) then
				
				setStoryVar(EvanTnyIndex,2)
				
				addContact("follow the target", "Genka Planet, Waiool")
				makeSystemVisible("waiool")
				
			elseif (complete==2) then
				setPersonScriptFile("evan t'ny","data/scripts/plot/evantny/evantny6.txt")
				setStoryVar(EvanTnyIndex,0)
			end
		end

		if (getStoryVar(EvanTnyIndex)==2) then
			-- Make player able to land on planet
			-- Wait for player to listen to cutscene on JekKek planet
		end
		
		if (getStoryVar(EvanTnyIndex)==10) then
			if ( youDockedAtAll()==0 ) then
				createTimer("jekkek planet [hidden]","jekkek planet","0:03")
				
				setStoryVar(EvanTnyIndex,11)
			end
		end
	
		if (getStoryVar(EvanTnyIndex)==11) then
			if (timerFinished("jekkek planet [hidden]")==1) then
				destroyTimer("jekkek planet [hidden]")
				
				setStoryVar(EvanTnyIndex,999)
				
				info2("Transmission from Evan T'ny (carrier signal confirmed): I received your transmission. Well done, this will be very useful to us. [br] [br] I've sent you the clue you were looking for.")
				
				removeContact("follow the target")
				removeContact("evan t'ny")
				addOneToCluesFound()
				
				makeSystemVisible("resseth")
				addContact("Clue #1","resseth")

				giveDataDisc("captain's log 14.txt")
			end
		end

		-------------------------------
		-- MISSION CLUE #2, Faedda
		-- Give contact $25,000
		-- DONE
		-------------------------------	
		if (getStoryVar(GlorOps1Index)==0) then
			if (youDocked("ula station 1")==1) then
				if (getStoryVar(GlorOps2Index)==0) then	    	
					if (getMoney() >=25000) then
						setPersonScriptFile("glor ops","data/scripts/plot/glorops/glorops1.txt") -- enough money
					else
						setPersonScriptFile("glor ops","data/scripts/plot/glorops/glorops2.txt") -- not enough money
					end
				else
					if (getMoney() >=25000) then
						setPersonScriptFile("glor ops","data/scripts/plot/glorops/glorops4.txt") -- enough money
					else
						setPersonScriptFile("glor ops","data/scripts/plot/glorops/glorops5.txt") -- not enough money
					end			
				end
				
				if (youTalkedTo("glor ops")==1) then
					setStoryVar(GlorOps2Index,1)
					if (getMissionAnswer()=="yes") then                    

						giveDataDisc("captain's log 15.txt")
						
						removeContact("glor ops")
						addContact("Clue #2","Faedda")
						takePlayerMoney(25000)
						setPersonScriptFile("glor ops","data/scripts/plot/glorops/glorops3.txt")
						
						makeSystemVisible("faedda")
						addOneToCluesFound()
						
						setStoryVar(GlorOps1Index,1)
					end
				end
			end
		end
		
		-------------------------------
		-- MISSION CLUE #3, Aolol
		-- Simply speak to the bardroid for the clue (v1.1 onwards)
		-- DONE
		-------------------------------
		if (getStoryVar(GeriHgeIndex)==0) then
			if (youTalkedTo("Geri H'ge")==1) then
				if (getMissionAnswer()=="yes") then                    
						addContact("Megaball Bardroid","Dwelwa, Miareth")					
						setPersonScriptFile("Geri H'ge","freeform")  -- set him back to freeform
						makeSystemVisible("miareth")
						clearYouTalkedTo()
						removeContact("Geri H'ge")
						setStoryVar(GeriHgeIndex,1)
				end			
			end	
		end	
		
		if (getStoryVar(GeriHgeIndex)==1) then
			if (youTalkedTo("Bar Droid")==1) then
				if (getMissionAnswer()=="yes") then
					makeSystemVisible("aolol")
					addContact("Clue #3","Aolol")
					addOneToCluesFound() 
					giveDataDisc("captain's log 16.txt")
					setPersonScriptFile("bar droid #2266","freeform")
					removeContact("Megaball Bardroid")
					setStoryVar(GeriHgeIndex,2)
				end
			end
		end
		
		-------------------------------
		-- MISSION CLUE #4, BD-946
		-- fix his twisted circuit.
		-- DONE
		-------------------------------
		if (getStoryVar(TaoistBossIndex)==0) then
			if (youTalkedTo("Rh 445")==1) then
				if (getMissionAnswer()=="yes") then
					if (playLineGame(20)=="win") then
						addContact("Clue #4","BD-946")
						setPersonScriptFile("Rh 445","data/scripts/plot/rh445/rh4452.txt")  -- you won!
						removeContact("rh 445")
						  
						addOneToCluesFound()
						makeSystemVisible("bd-946")
						
						giveDataDisc("captain's log 17.txt")
						  
						clearYouTalkedTo()
						setStoryVar(TaoistBossIndex,1)
					else
						setPersonScriptFile("Rh 445","data/scripts/plot/rh445/rh4453.txt") -- oh, back are you?
					end
				else
					setPersonScriptFile("Rh 445","data/scripts/plot/rh445/rh4453.txt") -- oh, back are you?
				end
			end
		end
		
		if (getStoryVar(TaoistBossIndex)==1) then -- you already won
			if (youTalkedTo("Rh 445")==1) then
				setStoryVar(TaoistBossIndex,2)
			end
		end
		
		if (getStoryVar(TaoistBossIndex)==2) then
			if (youTalkedTo("Rh 445")==1) then
				setPersonScriptFile("Rh 445","data/scripts/plot/rh445/rh4454.txt") -- more games for money
				clearYouTalkedTo()
				setStoryVar(TaoistBossIndex,3)
			end
		end
		
		if (getStoryVar(TaoistBossIndex)==3) then -- want to play more?
			if (youTalkedTo("Rh 445")==1) then
			   if (getMissionAnswer()=="yes") then
					if (playLineGame(30)=="win") then
						givePlayerMoney(10000)
						info2("Rh 445: Thanks, here's your reward. If you want to try and unscramble any more, come back and see me.")
					end
				end
			end
		end
	end
	-- END OF CLUE MISSION SPECIFIC CODE
	

	if (storyVar==19) then
		if (cluesFound()==1) then -- set off the next cutscene and act						
			startCutScene("data/cutscenes/act5.txt","ACT V: Wanted Dead/Alive")					
			setStoryVar(Index,20)
			storyVar=20	
		end		
	end
	
	if (storyVar==20) then
		if (cluesFound()==2) then
			startCutScene("data/cutscenes/act5a.txt","ACT V: Wanted Dead/Alive")
			setStoryVar(Index,21)
			storyVar=21		
		end
	end	
	      	
	
	-----------------------------------------------------------------------------
	-- FROM HERE YOU CAN'T DOCK AT ANY COUNCIL STATIONS.
	-- YOU HAVE A MASSIVE BOUNTY ON YOUR HEAD.
	-----------------------------------------------------------------------------	
	
	
	if (storyVar==21) then
		if (cluesFound()==4) then -- we're monitoring your progress here too... 			
            giveDataDisc("captain's log 18.txt")

			startCutScene("data/cutscenes/act5b.txt","ACT V: Wanted Dead/Alive")
			startCutScene("data/cutscenes/act5c.txt","ACT V: Wanted Dead/Alive")
			
			addCriminalRecord("wanted dead/alive - $250000000")
			releaseNewsStory("data/text/news/plot/wanted.txt")

			info2("Transmission from Cji S'ri (carrier signal confirmed): Please come and see me at Wma Station 1 in the P1257+12 system. I have important information for you.")
			info2("Please be careful. There is now a $250 million bounty on your head. Police ships and station defences will shoot you on sight.")
			info2("Stock up on fuel now because chances are you won't be able to get it from anywhere but a pirate station.")
		    addContact("Cji S'ri","Wma Station 1, P1257+12")
            setPersonScriptFile("cji s'ri","data/scripts/plot/cjisri/cjisri3.txt")  -- you have clues, need password. j'mes learner.

		   	setStoryVar(Index,22)
			storyVar=22
		end			
	end	
	   	
	if (storyVar==22) then
		if (youTalkedTo("cji s'ri")==1) then
			giveDataDisc("captain's log 19.txt")
			startCutScene("data/cutscenes/act6.txt","ACT VI: The Password")
			addContact("J'mes Learner","KP-FQ1")			
			setPersonScriptFile("j'mes learner","data/scripts/plot/jmeslearner/jmeslearner1.txt") -- < 10 kills
			setPersonScriptFile("cji s'ri","data/scripts/plot/cjisri/cjisri4.txt")
			makeSystemVisible("kp-fq1")
			setStoryVar(Index,23)
			storyVar=23						
		end
	
	end
	
	
	if (storyVar==23) then
		local kills=getKills()
		
		if (youDocked("qucieda")==1) then
			if (kills >=10) then
				setPersonScriptFile("j'mes learner","data/scripts/plot/jmeslearner/jmeslearner2.txt") -- >= 10 kills
				setStoryVar(Index,24)
				storyVar=24
			else
			    setPersonScriptFile("j'mes learner","data/scripts/plot/jmeslearner/jmeslearner1.txt")
			end			
		end

	end

    if (storyVar==24) then
    	if (youTalkedTo("j'mes learner")==1) then
            giveDataDisc("captain's log 20.txt")
			addContact("Walker Base","around 10,1")
			startCutScene("data/cutscenes/act7.txt","ACT VII: Who Am I?")
			setStoryVar(WalkerPasswordIndex,2)   -- password known - activate script for graham line (password bloke)
			-- Boss taoist script meeting
			setPersonScriptFile("433-2c","data/scripts/plot/4332c/4332c1.txt")
			
			addContact("433-2c","Walker Base")
			removeContact("j'mes learner")
			-- you now have 10 kills...
			-- when you finally speak to jmes leaner he'll tell you the password, "in freedom, truth" (or whatever)
            clearYouTalkedTo()

        	setPersonScriptFile("j'mes learner","data/scripts/plot/jmeslearner/jmeslearner3.txt")

			setStoryVar(Index,25)
			storyVar=25                	
        end
    end
    
    if (storyVar==25) then    
		if (youTalkedTo("433-2c")==1) then	-- taoist boss
			-- he gives you a datadisc containing info on the cleaner ship shield codes
			removeContact("clue #1")
			removeContact("clue #2")
			removeContact("clue #3")
			removeContact("clue #4")
			
			removeContact("cji s'ri")
			removePersonFromStation("cji s'ri","wma station 1")
			
			if (getMissionAnswer()=="yes") then		    
                setPersonScriptFile("433-2c","data/scripts/plot/4332c/4332c1_a.txt")
				givePlayerMission("data/missions/plot/4332c/4332c1.lua")
			    setStoryVar(WaessdaAsteroidIndex,1) -- setup asteroid debris
				giveDataDisc("information1.txt")				
				giveDataDisc("information2.txt")
				startCutScene("data/cutscenes/act8.txt","ACT VIII: Searching Junk")
				makeSystemVisible("waessda")
				makeSystemVisible("aresswa")
                addContact("waessda","asteroid belts")
                addContact("aresswa","asteroid belts")
                
                giveDataDisc("captain's log 21.txt")

				setStoryVar(Index,26)
				storyVar=26
			else
				setPersonScriptFile("433-2c","data/scripts/plot/4332c/4332c2.txt")   -- you said no the first time. re-try!
			end
			
		end	
	end
	
	if (storyVar==26) then
		local complete=missionHasFinished("data/missions/plot/4332c/4332c1.lua")

		if (complete==1) then -- you've successfully completed this mission
		    removeContact("waessda")
            removeContact("aresswa")
			setPersonScriptFile("433-2c","data/scripts/plot/4332c/4332c3.txt")	-- successful first mission. now ask about passenger mission for scientist.
			setStoryVar(Index,27)
			storyVar=27	
					
		elseif (complete==2) then
            removeContact("waessda")
            removeContact("aresswa")		
			setPersonScriptFile("433-2c","data/scripts/plot/4332c/4332c2.txt") -- restart mission dialogue.	
			setStoryVar(WaessdaAsteroidIndex,0) -- reset asteroids.
			setStoryVar(Index,25)
			storyVar=25
		end	
	
	end
	

	if (storyVar==27) then
		if (youTalkedTo("433-2c")==1) then	-- taoist boss
			-- he suggests the scientist mission. you say...
			
			if (getMissionAnswer()=="yes") then	
				setPersonScriptFile("433-2c","data/scripts/plot/4332c/4332c3_a.txt")    -- get GOING!
				givePlayerMission("data/missions/plot/4332c/4332c2.lua")	
				setStoryVar(Index,28)
				storyVar=28 	
			end
		end
	
	end


	if (storyVar==28) then
		-- you're to pick up a scientist from KP-FQ1
		
		local complete=missionHasFinished("data/missions/plot/4332c/4332c2.lua")

		if (complete==1) then -- you've successfully completed this mission
        	giveDataDisc("captain's log 22.txt")

			setPersonScriptFile("433-2c","data/scripts/plot/4332c/4332c5.txt")
			startCutScene("data/cutscenes/act9a.txt","ACT IX: The End")
			startCutScene("data/cutscenes/act9b.txt","ACT IX: The End")
			
			setStoryVar(Index,29)
			storyVar=29	
		
		elseif (complete==2) then
			setPersonScriptFile("433-2c","data/scripts/plot/4332c/4332c4.txt") -- restart scientist mission dialogue.
			
			setStoryVar(Index,27)
			storyVar=27				
		end	
	
	end	
	
	
	if (storyVar==29) then
	    if (youDockedAtAll()==0) then
	    	createTimer("battle timer [hidden]","final battle","0:06")
			setStoryVar(Index,30)
			storyVar=30
  		end
	end
	
	if (storyVar==30) then
	    if (timerFinished("battle timer [hidden]")==1) then
            destroyTimer("battle timer [hidden]")
			setStoryVar(Index,31)
			storyVar=31
	    end
	end
	
	if (storyVar==31) then
        info2("Transmission from 433-2c (carrier signal confirmed): Here they come! Get ready!")
		
		-- start battle here...
		isFinalBattleWon = false
		createFinalBattleAtWalkerBase()
        createTimer("battle timer 2 [hidden]","final battle","0:10")
        
		setStoryVar(Index,32)
		storyVar=32

	
	end

    if (storyVar==32) then
		if (isFinalBattleWon==false) then
			if (timerFinished("battle timer 2 [hidden]")==1) then
				if (countCleanerShips()==0) then
					isFinalBattleWon = true
					destroyTimer("battle timer 2 [hidden]")
					createTimer("battle timer 3 [hidden]","final battle 3","0:03")
					
					setPersonScriptFile("433-2c","data/scripts/plot/4332c/4332c6.txt")
				end
			end
		else
			if (timerFinished("battle timer 3 [hidden]")==1) then
				clearCriminalRecord()
				info2("Transmission from 433-2c (carrier signal confirmed): Good work! Excellent work! Come and see me aboard walker base and we'll celebrate!")
				giveDataDisc("captain's log 23.txt")
				destroyTimer("battle timer 3 [hidden]")
				
				storyVar=33
				setStoryVar(Index,storyVar)
			end
		end
	end


    if (storyVar==33) then
    	if (youDocked("walker base")==1) then 
			
			releaseNewsStory("data/text/news/plot/battle.txt")
			
			storyVar=34
			setStoryVar(Index,storyVar)
		end
	end

    if (storyVar==34) then
    	if (youTalkedTo("433-2c")==1) then	-- taoist boss
			
			setPersonScriptFile("433-2c","data/scripts/plot/4332c/4332c6.txt")
			removePersonFromStation("433-2c","walker base") -- removes him. we never see him on a station again.
			giveDataDisc("captain's log 24.txt")
			addContact("Cleaner Base","????, Badlands")
			
			storyVar=35
			setStoryVar(Index,storyVar)
		end
	end

    if (storyVar==35) then
		-- wait for player to shoot boss
	end
	
    if (storyVar==36) then
		
		-- boss was just shot
		setPersonScriptFile("Squidman","data/scripts/plot/squidman/squidman3.txt")
		setPersonScriptFile("kent","data/scripts/plot/kentfinal/kentfinal3.txt")
		
		createTimer("thank you msg [hidden]","thank you msg","0:02")
		
		storyVar=37
		setStoryVar(Index,storyVar)
	end

    if (storyVar==37) then
    	if (timerFinished("thank you msg [hidden]")==1) then
		
			destroyTimer("thank you msg [hidden]")
		
			info2("Congratulations! You've completed the 3030 Deathwar Redux main story and saved everyone from the Cleaners. [br] [br] You are now free to explore the rest of the galaxy at your leisure, take jobs, or visit those nebula aliens that Kent keeps talking about.")
			
			info2("We hope you enjoyed the game. Thank you for supporting us and thanks for playing the game! [br] [br] Matt, Mike and Max [br] [br] Bird in Sky [br] Crunchy Leaf Games")
			
			giveDataDisc("captain's log 25.txt")
			removeContact("Cleaner Base")
			
			createTimer("walker base party [hidden]","walker base party","0:03")
			
			storyVar=38
			setStoryVar(Index,storyVar)
		end
	end

    if (storyVar==38) then
    	if (timerFinished("walker base party [hidden]")==1) then
		
			destroyTimer("walker base party [hidden]")
			
			info2("Transmission from 433-2c (carrier signal confirmed): You did it! You saved us all! I knew I could trust in you. Right from the start, there was no doubt in my circuit. [br] [br] We're kicking off an after party. Drop in at Walker Base if you have the chance.")
			
			addContact("After Party", "Walker Base")
			
			storyVar=39
			setStoryVar(Index,storyVar)
		end
	end
	
    if (storyVar==39) then
    	if (youDocked("walker base")==1) then 
	    	-- the end. 
	    	
	    	giveDataDisc("captain's log 26.txt")
	    	
			startCutScene("data/cutscenes/act10.txt","ACT X: The Beginning")
			givePlayerMoney(1500000)
			
			removeContact("After Party")
			removeContact("433-2c")
	
	        removePersonFromStation("frank zoed","elesw")
	        removePersonFromStation("jimmy chou","rub ba station 3")
	        removePersonFromStation("morgan yu","jelnu station 1")
	        removePersonFromStation("cji s'ri","wma station 1")
	        removePersonFromStation("raal","frija")
	        removePersonFromStation("evan t'ny","qrima station 2")
	        removePersonFromStation("glor ops","ula station 1")
	        removePersonFromStation("geri h'ge","iviga")
	        removePersonFromStation("rh 445","jowe")
	        removePersonFromStation("433-2c","walker base")
	        removePersonFromStation("j'mes learner","qucieda")
				
			setStoryVar(Index,99)
			storyVar=99
		end
	end
end

isFinalBattleWon = false
Index = 100
storyVar = 0
