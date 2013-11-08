-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-- Require the widget library
local widget = require( "widget" )

-- Activate physics engine
local physics = require("physics")
physics.start()

display.setStatusBar( display.HiddenStatusBar )

-- Load some external Lua libraries (from project directory)
local movieclip = require( "movieclip" )

local ballInPlay = false

-- Create master display group (for global "camera" scrolling effect)
local game = display.newGroup();
game.x = 0

local sky = display.newImage( "sky.png", true )
game:insert( sky )
sky.x = 120; sky.y = 200

local sky2 = display.newImage( "sky.png", true )
game:insert( sky2 )
sky2.x = 120; sky2.y = 700

local sky3 = display.newImage( "sky.png", true )
game:insert( sky3 )
sky3.x = 120; sky3.y = 1000

trampoline = display.newImage( "trampoline.png" )
game:insert( trampoline )
physics.addBody( trampoline, "static", { friction=0.1, bounce=0 } )
trampoline.x = 50 
trampoline.y = 100
trampoline.rotation = 20

trampoline = display.newImage( "trampoline.png" )
game:insert( trampoline )
physics.addBody( trampoline, "static", { friction=0.1, bounce=0 } )
trampoline.x = 250 
trampoline.y = 200
trampoline.rotation = -20

trampoline = display.newImage( "trampoline.png" )
game:insert( trampoline )
physics.addBody( trampoline, "static", { friction=0.1, bounce=0.5 } )
trampoline.x = 50 
trampoline.y = 300
trampoline.rotation = 10

------------------------------------------------------------
-- Launch boulder
local boulder = display.newImage( "boulder.png" )
game:insert( boulder )

-- initial body type is "kinematic" so it doesn't fall under gravity
physics.addBody( boulder, { density=15.0, friction=0.5, bounce=0.5, radius=36 } )

-- Camera follows bolder automatically
local function moveCamera()
	if (boulder.x > 180 and boulder.x < 1100) then
		game.x = -boulder.x + 180
	end
    
	if (boulder.y > 180 and boulder.y < 1100) then
		game.y = -boulder.y + 180
	end
end

Runtime:addEventListener( "enterFrame", moveCamera )
