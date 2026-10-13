-- Import standard Playdate libraries
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

-- Assign a shortcut for the graphics library (improves performance and readability)
local gfx <const> = playdate.graphics

-- Game variables
local playerSprite = nil
local speed = 4

-- 1. Initialize the Game Environment
function myGameSetUp()
    -- Set the background color to white
    gfx.setBackgroundColor(gfx.kColorWhite)
    gfx.clear()

    -- Create a simple 20x20 pixel square image to use as our player sprite
    -- (The Playdate screen resolution is 400x240 pixels)
    local playerImage = gfx.image.new(20, 20, gfx.kColorBlack)
    
    -- Instantiate the sprite with the image
    playerSprite = gfx.sprite.new(playerImage)
    
    -- Place the player in the center of the screen
    playerSprite:moveTo(200, 120)
    
    -- Add the sprite to the active rendering list
    playerSprite:add()
end

-- Run the setup function once when the game loads
myGameSetUp()

-- 2. The Main Game Loop (Called 30 times per second by default)
function playdate.update()
    -- Check for D-pad button inputs and move the player accordingly
    if playdate.buttonIsPressed(playdate.kButtonUp) then
        playerSprite:moveBy(0, -speed)
    end
    if playdate.buttonIsPressed(playdate.kButtonDown) then
        playerSprite:moveBy(0, speed)
    end
    if playdate.buttonIsPressed(playdate.kButtonLeft) then
        playerSprite:moveBy(-speed, 0)
    end
    if playdate.buttonIsPressed(playdate.kButtonRight) then
        playerSprite:moveBy(speed, 0)
    end

    -- Draw some instructional UI text to the screen
    gfx.drawText("Use the D-pad to move!", 10, 10)

    -- Update and redraw all active sprites on the screen
    gfx.sprite.update()
    
    -- Update any active system timers
    playdate.timer.updateTimers()
end
