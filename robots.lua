-- Use Shift + Click to select a robot
-- When a robot is selected, its variables appear in this editor

-- Use Ctrl + Click (Cmd + Click on Mac) to move a selected robot to a different location

-- Wait GGH


-- Put your global variables here

-- Swarm Implementation -- 

function driveAsCar(forwardSpeed, angularSpeed)

  -- We have an equal component, and an opposed one   
  leftSpeed  = forwardSpeed - angularSpeed
  rightSpeed = forwardSpeed + angularSpeed

  robot.wheels.set_velocity(leftSpeed,rightSpeed)
end

function fallback()
		driveAsCar(0,0)
		robot.leds.set_single_color(13,"green")
end

function pollBC()
--Added by Roshan
os.execute("/home/rsingh/final_shell.sh")	
local handle = io.popen("/home/rsingh/f2.sh")
result = handle:read("*a")
--log("No of vehicle in Black: " ..result)
--counter = result;
temp = tonumber(result)
log("In Black"..temp)
if( temp > 2)then 
	log("Loser")
   log("Target Achieved")
	done = true 
	driveAsCar(0,0)
   robot.leds.set_single_color(13,"green")
	return 1	 
else
	--log("Failure" ..handle:read("*a"))
	 return 0
end	

handle:close()
--	counter = 0
--Closed by Roshan 
end 

-- SAM ROHAN

function pollBC2()
--Added by Roshan
os.execute("/home/rsingh/final_shell2.sh")	
local handle = io.popen("/home/rsingh/f22.sh")
result = handle:read("*a")
--log("No of vehicle in Black: " ..result)
--counter = result;
temp1 = tonumber(result)
log("In White"..temp1)
if( temp1 >= 2)then 
	log("Loser")
   log("Target Achieved")
	done = true 
	driveAsCar(0,0)
   robot.leds.set_single_color(13,"green")
	return 1	 
else
	--log("Failure" ..handle:read("*a"))
	 return 0
end	

handle:close()
--	counter = 0
--Closed by Roshan 
end 


--SAM ROHAN

--[[ This function is executed every time you press the 'execute' button ]]
function init()
   -- put your code here

		fb1_exec = 0
		fb2_exec = 0
		fb3_exec = 0
		fb4_exec = 0
		fb5_exec = 0
		fb6_exec = 0
		fb7_exec = 0
		fb8_exec = 0
		fb9_exec = 0
		fb1_exec1 = 0
		fb2_exec1 = 0
		fb3_exec1 = 0
		fb4_exec1 = 0
		fb5_exec1 = 0
		fb6_exec1 = 0
		fb7_exec1 = 0
		fb8_exec1 = 0
		fb9_exec1 = 0
		temp = 0
		temp1 = 0
		permission = 1
		
end



--[[ This function is executed at each time step
     It must contain the logic of your controller ]]
function step()
   -- put your code here

--log("Time" ..os.time())

counter = tonumber(os.time())
if(counter % 2 == 0) and (permission == 1) then 

sgx = pollBC()
log("GOGO")
nsgx = pollBC2()

if((sgx == 1) or (nsgx == 1)) then
permission = 0
end 

end
--log("--Proximity Sensors--")
for i = 1,24 do
   -- log("Angle: " .. robot.proximity[i].angle ..
        -- "Value: " .. robot.proximity[i].value)
end

--sensingLeft = robot.proximity[3].value + robot.proximity[4].value +
  --            robot.proximity[5].value + robot.proximity[6].value

--sensingRight = robot.proximity[22].value+ robot.proximity[21].value +
  --             robot.proximity[20].value + robot.proximity[19].value

--if( sensingLeft ~= 0 ) then
 -- driveAsCar(7,-3)
--elseif( sensingRight ~= 0 ) then
  --driveAsCar(7,3)
--else
  --driveAsCar(10,0)
--end


--log("--Ground Sensors--")
for i = 1,4 do
   -- log(robot.motor_ground[i].value)
    --log(robot.motor_ground[i].offset.x .. " " ..
     --   robot.motor_ground[i].offset.y)
end

onSpot = true
for i = 1,4 do

--log(temp)

if(robot.motor_ground[i].value < 0.40)  then -- not on a white spot I mean black
      entry = 1
		
		if (robot.id == "fb1") and (fb1_exec == 0) then
			os.execute("/home/rsingh/gethCommand.sh")
			fb1_exec = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()

		end
		if (robot.id == "fb2") and (fb2_exec == 0) then
			os.execute("/home/rsingh/gethCommand.sh")
			fb2_exec = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()
		end
		if (robot.id == "fb3") and (fb3_exec == 0) then
			os.execute("/home/rsingh/gethCommand.sh")
			fb3_exec = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()

		end
		if (robot.id == "fb4") and (fb4_exec == 0) then
			os.execute("/home/rsingh/gethCommand.sh")
			fb4_exec = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()
		end
		if (robot.id == "fb5") and (fb5_exec == 0) then
			os.execute("/home/rsingh/gethCommand.sh")
			fb5_exec = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()
		end
		if (robot.id == "fb6") and (fb6_exec == 0) then
			os.execute("/home/rsingh/gethCommand.sh")
			fb6_exec = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()
		end
		if (robot.id == "fb7") and (fb7_exec == 0) then
			os.execute("/home/rsingh/gethCommand.sh")
			fb7_exec = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()
		end
		if (robot.id == "fb8") and (fb8_exec == 0) then
			os.execute("/home/rsingh/gethCommand.sh")
			fb8_exec = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()
		end
		if (robot.id == "fb9") and (fb9_exec == 0) then
			os.execute("/home/rsingh/gethCommand.sh")
			fb9_exec = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()
		end
end

if( (robot.motor_ground[i].value > 0.50) and (robot.motor_ground[i].value < 0.90)) then -- not on a white spot I mean grey
      entry = 2
		--pollBC()
		log("I am in")
end

if( (robot.motor_ground[i].value >= 0.89)) then -- not on a white spot I mean white
			entry = 3 
if (robot.id == "fb1") and (fb1_exec1 == 0) then
			os.execute("/home/rsingh/gethCommand2.sh")
			fb1_exec1 = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()

		end
		if (robot.id == "fb2") and (fb2_exec1 == 0) then
			os.execute("/home/rsingh/gethCommand2.sh")
			fb2_exec1 = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()
		end
		if (robot.id == "fb3") and (fb3_exec1 == 0) then
			os.execute("/home/rsingh/gethCommand2.sh")
			fb3_exec1 = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()

		end
		if (robot.id == "fb4") and (fb4_exec1 == 0) then
			os.execute("/home/rsingh/gethCommand2.sh")
			fb4_exec1 = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()
		end
		if (robot.id == "fb5") and (fb5_exec1 == 0) then
			os.execute("/home/rsingh/gethCommand2.sh")
			fb5_exec1 = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()
		end
		if (robot.id == "fb6") and (fb6_exec1 == 0) then
			os.execute("/home/rsingh/gethCommand2.sh")
			fb6_exec1 = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()
		end
		if (robot.id == "fb7") and (fb7_exec1 == 0) then
			os.execute("/home/rsingh/gethCommand2.sh")
			fb7_exec1 = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()
		end
		if (robot.id == "fb8") and (fb8_exec1 == 0) then
			os.execute("/home/rsingh/gethCommand2.sh")
			fb8_exec1 = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()
		end
		if (robot.id == "fb9") and (fb9_exec1 == 0) then
			os.execute("/home/rsingh/gethCommand2.sh")
			fb9_exec1 = 1
			log("Robot entered in Black" .. robot.id)
			--pollBC()
		end

end

end

if(entry == 1) and (sgx == 1) then
  --driveAsCar(10,0)
	-- driveAsCar(robot.random.uniform(50,90), robot.random.uniform(20,-10))
	
   robot.leds.set_single_color(13,"green")
	driveAsCar(robot.random.uniform(50,90), robot.random.uniform(20,-10))
	--log("Got in Black" .. robot.id)

elseif(entry == 3) and (sgx == 1) then
  --driveAsCar(10,0)
	driveAsCar(robot.random.uniform(50,90), robot.random.uniform(20,-10))
   robot.leds.set_single_color(13,"green")
	--log("Got in White" .. robot.id)

elseif(entry == 2) and (sgx == 1) then
  driveAsCar(robot.random.uniform(50,90), robot.random.uniform(20,-10))
  robot.leds.set_single_color(13,"green")
  --log("Got in Grey" .. robot.id)

elseif(entry == 1) and (nsgx == 1) then
  driveAsCar(robot.random.uniform(50,90), robot.random.uniform(20,-10))
  robot.leds.set_single_color(13,"red")

elseif(entry == 2) and (nsgx == 1) then
  driveAsCar(robot.random.uniform(50,90), robot.random.uniform(20,-10))
  robot.leds.set_single_color(13,"red")

elseif(entry == 3) and (nsgx == 1) then
  driveAsCar(robot.random.uniform(50,90), robot.random.uniform(20,-10))
  robot.leds.set_single_color(13,"red")

elseif(entry == 1) then
   robot.leds.set_single_color(13,"green")
	--driveAsCar(robot.random.uniform(50,90), robot.random.uniform(20,-10))
	driveAsCar(0,0)

elseif(entry == 2) then
   robot.leds.set_single_color(13,"yellow")
	driveAsCar(robot.random.uniform(50,90), robot.random.uniform(20,-10))
elseif(entry == 3) then 
   robot.leds.set_single_color(13,"red")
	driveAsCar(robot.random.uniform(50,90), robot.random.uniform(20,-10))
else
	 log("LOL FAILURE")
	-- robot.leds.set_single_color(13,"yellow")
	 --driveAsCar(robot.random.uniform(50,90), robot.random.uniform(20,-10))
		driveAsCar(0,0)
end
end

--[[ This function is executed every time you press the 'reset'
     button in the GUI. It is supposed to restore the state
     of the controller to whatever it was right after init() was
     called. The state of sensors and actuators is reset
     automatically by ARGoS. ]]
function reset()onSpot = true
for i = 1,4 do
    if( robot.motor_ground[i].value < 0.90 ) then -- not on a white spot
      onSpot = false
    end
end

if(onSpot) then
  driveAsCar(1,0)
else
  driveAsCar(robot.random.uniform(10,20), robot.random.uniform(-10,10))
end
   -- put your code here
end



--[[ This function is executed only once, when the robot is removed
     from the simulation ]]
function destroy()
   -- put your code here
end
