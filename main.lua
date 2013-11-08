-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-- Require the widget library
local widget = require( "widget" )
local Bee = require("bee")

local beez = nil

local bee = Bee.new()
bee.getNextFrame()

display.setStatusBar( display.HiddenStatusBar )


-- Create master display group (for global "camera" scrolling effect)
local game = display.newGroup();
game.x = 0

local sky = display.newImage( "sky.png", true )
game:insert( sky )
sky.x = 120; sky.y = 200

local grass = display.newImage( "grass.png", true )
game:insert( grass )
grass.x = 160
grass.y = 500

------------------------------------------------------------
-- Launch boulder
local boulder = display.newImage( "boulder.png" )
boulder.x = display.contentWidth /2
boulder.y = display.contentHeight - boulder.height / 2
game:insert( boulder )

------------------------------------------------------------
-- Move the ship
local holding = false
local left = false
local event = null

function holdingEvent()
    if (pressed) then
        if (left) then
            if (boulder.x < display.contentWidth - boulder.width / 2) then
                boulder.x = boulder.x + 15
            end
        else
            if (boulder.x > boulder.width / 2) then
                boulder.x = boulder.x - 15
            end
        end
    end
end

function touch( event )
    if event.phase == "began" then
        pressed = true
        if (event.x > 120 ) then
            left = true
        else
            left = false
        end
        Runtime:addEventListener( "enterFrame", holdingEvent )
    elseif event.phase == "ended" then
        pressed = false
        Runtime:removeEventListener( "enterFrame", holdingEvent )
    end
    return true
end

Runtime:addEventListener( "touch", touch )

function addBeez()
	
end


timer.performWithDelay(1000,addBeez,5)




------------------------------------------------------------
-- Left button


------------------------------------------------------------
-- Right button
