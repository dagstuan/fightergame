-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-- Require the widget library
local widget = require( "widget" )
require("bee")

display.setStatusBar( display.HiddenStatusBar )

local skies = display.newGroup()

-- Create master display group (for global "camera" scrolling effect)
local game = display.newGroup();
game.x = 0

------------------------------------------------------------
-- backgrounds

local function loadBackground(filename, xMulti, y, speed) 
	local background = display.newImage(filename)
	background:setReferencePoint( display.BottomLeftReferencePoint )
	background.x, background.y = display.contentWidth*xMulti, y
	background.speed = speed
	return background
end

local sky = display.newImage( "sky.png", true )
skies:insert( sky )
sky.x = 120; sky.y = 200

local background1 = loadBackground("background.png", 1, 75, 0.5)
skies:insert( background1 )
local background1_2 = loadBackground("background.png", 2, 75, 0.5)
skies:insert( background1_2 )
local background3 = loadBackground("background3.png", -2, 150, -1)
skies:insert( background3 )
local background3_2 = loadBackground("background3.png", -1, 150, -1)
skies:insert( background3_2 )


local grass = display.newImage( "grass.png", true )
game:insert( grass )
grass.x = 160
grass.y = 500


local function updateBackground(background)
	background.x = background.x - background.speed*0.5
	if(background.x < -display.contentWidth) then
		background.x = display.contentWidth
	end
end

function updateBackgrounds()
	updateBackground(background1)
	updateBackground(background1_2)
	updateBackground(background3)
	updateBackground(background3_2)
end

------------------------------------------------------------
-- Add mouse
local mouse = display.newImage( "boulder.png" )
mouse.x = display.contentWidth /2
mouse.y = display.contentHeight - mouse.height / 2
game:insert( mouse )

------------------------------------------------------------
-- Move the thing
local holding = false
local left = false
local event = null

function holdingEvent()
    if (pressed) then
        if (left) then
            if (mouse.x < display.contentWidth - mouse.width / 2) then
                mouse.x = mouse.x + 15
            end
        else
            if (mouse.x > mouse.width / 2) then
                mouse.x = mouse.x - 15
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

------------------------------------------------------------
-- Bees

local bees = {}

function createBee()
    bees[#bees+1] = bee.Create(display)
end

local beeTimer = timer.performWithDelay(2000, createBee, 0)

function updateBees()
    for i,bee in ipairs(bees) do
        bee.Draw()
    end
end

------------------------------------------------------------
-- Game state
local mouseRadius = 50
local livesLeft = 3

function updateGameState()
    for i,bee in ipairs(bees) do
        if (bee.image.y <= mouse.y + mouseRadius and bee.image.y >= mouse.y - mouseRadius and bee.image.x <= mouse.x + mouseRadius and bee.image.x >= mouse.x - mouseRadius) then
            livesLeft = livesLeft - 1
        end
    end
    
    if (livesLeft == 0) then 
        Runtime:removeEventListener( "touch", touch )
        Runtime:removeEventListener("enterFrame", updateGame)
        
        timer.cancel(beeTimer)
        
        displayLoose = display.newText("YOU LOSE", 25, 150, "Helvetica", 50 )
    end
end


function updateGame()
    updateBackgrounds()
    updateBees()
    updateGameState()
end

Runtime:addEventListener("enterFrame", updateGame)