-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-- Require the widget library
local widget = require( "widget" )

display.setStatusBar( display.HiddenStatusBar )


-- Create master display group (for global "camera" scrolling effect)
local game = display.newGroup();
game.x = 0

local sky = display.newImage( "sky.png", true )
game:insert( sky )
sky.x = 120; sky.y = 200

------------------------------------------------------------
-- Launch boulder
local boulder = display.newImage( "boulder.png" )
boulder.x = display.contentWidth/2
boulder.y = display.contentHeight - boulder.height / 2
game:insert( boulder )

-- Camera follows bolder automatically
local function moveCamera()
	if (boulder.x > 180 and boulder.x < 1100) then
		game.x = -boulder.x + 180
	end
end

Runtime:addEventListener( "enterFrame", moveCamera )
