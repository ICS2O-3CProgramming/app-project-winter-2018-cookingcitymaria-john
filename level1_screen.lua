-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Maria T
-- Date: Month Day, Year
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image
local pizzadough
local carrot    
local cheese
local chocolate
local peperoni
local saucepacket
local strawberry
local tomato
local sauce
local shreddedcheese
local peperonislices
-- text for level1
local level1text
local lives = 3
local questionsAnswered = 0
local correctObject1
local correctObject2
local correctObject3

local incorrectObject1
local incorrectObject2
local incorrectObject3
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------


function ResumeGame()

end

local function HideCorrect()
    correctObject1.isVisible = false
    correctObject2.isVisible = false
    correctObject3.isVisible = false
end


local function HideIncorrect()
    incorrectObject1.isVisible = false
    incorrectObject2.isVisible = false
    incorrectObject3.isVisible = false
end


local function YouLoseTransition()
    composer.gotoScene( "you_lose" )
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerResume(touch)
    
    if (touch.phase == "ended") then

        BackToLevel1( )
    
    end 
end


-- Creating Transition to help Screen
local function OptionScreen( )
    -- show overlay with math question
    composer.showOverlay( "options_screen", { isModal = true, effect = "fade", time = 100})
end 

-- Creating Transition to help Screen
local function HowToScreen( )
    -- show overlay with math question
    composer.showOverlay( "howto_screen", { isModal = true, effect = "fade", time = 100})
end 

-- Creating Transition to help Screen
local function SaucePacketButton()
    -- show overlay with math question
    if (questionsAnswered == 0) then
        -- make the sauce packet invisible
        saucepacket.isVisible = false

        -- make the sauce visible over top of the pizza
        sauce.isVisible = true

        correctObject1.isVisible = true
        timer.performWithDelay(1000, HideCorrect)
        -- adding to the score
        questionsAnswered = questionsAnswered  + 1 
    else
        incorrectObject1.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        lives = lives - 1
        
        if (lives == 0) then
            timer.performWithDelay(200, YouLoseTransition)
        end
    end
end 

-- Creating Transition to help Screen
local function CheeseButton()
    -- show overlay with math question
    if (questionsAnswered == 1) then
        -- make the sauce packet invisible
        cheese.isVisible = false

        -- make the sauce visible over top of the pizza
        shreddedcheese.isVisible = true

        correctObject2.isVisible = true
        timer.performWithDelay(1000, HideCorrect)
        -- adding to the score
        questionsAnswered = questionsAnswered  + 1 
    else
        incorrectObject1.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        lives = lives - 1
        
        if (lives == 0) then
            timer.performWithDelay(200, YouLoseTransition)
        end
    end
end

-- Creating Transition to help Screen
local function PeperoniButton()
    -- show overlay with math question
    if (questionsAnswered == 2) then
        -- make the sauce packet invisible
        peperoni.isVisible = false

        -- make the sauce visible over top of the pizza
        peperonislices.isVisible = true

        correctObject3.isVisible = true
        timer.performWithDelay(1000, HideCorrect)

        -- adding to the score
        questionsAnswered = questionsAnswered  + 1 
    else
        incorrectObject3.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        lives = lives - 1
        
        if (lives == 0) then
            timer.performWithDelay(200, YouLoseTransition)
        end
    end
end

-- Creating Transition to help Screen
local function CarrotButton()
    incorrectObject2.isVisible = true
    timer.performWithDelay(1000, HideIncorrect)
    -- show overlay with math question
    lives = lives - 1
    
    if (lives == 0) then
    
        timer.performWithDelay(200, YouLoseTransition)
    end
end

-- Creating Transition to help Screen
local function StrawberryButton()

    incorrectObject3.isVisible = true
    timer.performWithDelay(1000, HideIncorrect)
    -- show overlay with math question
    lives = lives - 1
    
    if (lives == 0) then
    
        timer.performWithDelay(200, YouLoseTransition)
    end
end
-- Creating Transition to help Screen
local function ChocolateButton()
    incorrectObject2.isVisible = true
    timer.performWithDelay(1500, HideIncorrect)

    lives = lives - 1    
    
    if (lives == 0) then
    
     timer.performWithDelay(200, YouLoseTransition)
    
    end
end

-- Creating Transition to help Screen
local function TomatoButton()

    incorrectObject1.isVisible = true
    timer.performWithDelay(1000, HideIncorrect)
    lives = lives - 1
    
    if (lives == 0) then
    
        timer.performWithDelay(200, YouLoseTransition)
    end
end

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the image
    bkg_image = display.newImageRect("Images/level1.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Insert the image
    pizzadough = display.newImageRect("L1images/pizzadough.png", 350, 350 )
    pizzadough.x = display.contentCenterX
    pizzadough.y = display.contentCenterY/1.2

    -- Insert the image
    sauce = display.newImageRect("L1images/Sauce@2x.png", 350, 350 )
    sauce.x = display.contentCenterX
    sauce.y = display.contentCenterY/1.2
    sauce.isVisible = false

    -- Insert the image
    shreddedcheese = display.newImageRect("L1images/ShreddedCheese@2x.png", 350, 350 )
    shreddedcheese.x = display.contentCenterX
    shreddedcheese.y = display.contentCenterY/1.2
    shreddedcheese.isVisible = false

    -- Insert the image
    peperonislices = display.newImageRect("L1images/peperonislices@2x.png", 350, 350 )
    peperonislices.x = display.contentCenterX
    peperonislices.y = display.contentCenterY/1.2
    peperonislices.isVisible = false
    

    level1text = display.newImageRect("L1images/level1text.png", 450, 195)
    
    --set the initial x and y position of the text
    level1text.x = 500
    level1text.y = display.contentCenterY/6

    --Create the correct text object and make it invisible
    correctObject1 = display.newText( "You're pretty good!", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    correctObject1:setTextColor(0/255, 150/255, 255/255)
    correctObject1.isVisible = false

    --Create the correct text object and make it invisible
    correctObject2 = display.newText( "Amazing", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    correctObject2:setTextColor(0/255, 150/255, 255/255)
    correctObject2.isVisible = false

    --Create the correct text object and make it invisible
    correctObject3 = display.newText( "Almost Done!", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    correctObject3:setTextColor(0/255, 150/255, 255/255)
    correctObject3.isVisible = false

    --Create the correct text object and make it invisible
    incorrectObject1 = display.newText( "You'll get it next time", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    incorrectObject1:setTextColor(255/255, 150/255, 0/255)
    incorrectObject1.isVisible = false

    incorrectObject2 = display.newText( "That's not even close", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    incorrectObject2:setTextColor(255/255, 150/255, 0/255)
    incorrectObject2.isVisible = false

    incorrectObject3 = display.newText( "Thats not right!", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    incorrectObject3:setTextColor(255/255, 150/255, 0/255)
    incorrectObject3.isVisible = false



    -- Creating pause Button
    carrot = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*.6,
            y = display.contentCenterY/2*3.3,

            -- Insert the images here
            defaultFile = "L1images/carrot.png",
            overFile = "L1images/carrot.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = StrawberryButton          
        } )

    -- Creating pause Button
    chocolate = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.5,
            y = display.contentCenterY/2*3.3,

            -- Insert the images here
            defaultFile = "L1images/Chocolate.png",
            overFile = "L1images/Chocolate.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = ChocolateButton          
        } )


    -- Creating pause Button
    strawberry = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*.445,
            y = display.contentCenterY/2*3.72,

            -- Insert the images here
            defaultFile = "L1images/Strawberry.png",
            overFile = "L1images/Strawberry.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = StrawberryButton          
        } )

    -- Creating pause Button
    tomato = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.3,
            y = display.contentCenterY/2*3.72,

            -- Insert the images here
            defaultFile = "L1images/tomato.png",
            overFile = "L1images/tomato.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = TomatoButton          
        } )
    
    -- Creating pause Button
    Pause = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.87,
            y = display.contentCenterY/6.5,

            -- Insert the images here
            defaultFile = "L1images/PauseButtonUnpressed.png",
            overFile = "L1images/PauseButtonPressed.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = OptionScreen          
        } )

    -- Creating pause Button
    HowTo = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.95,
            y = display.contentCenterY,

            -- Insert the images here
            defaultFile = "L1images/Howtobutton.png",
            overFile = "L1images/Howtobuttonpressed.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = HowToScreen          
        } )

    -- Creating pause Button
    saucepacket = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*.8,
            y = display.contentCenterY/2*3.72,

            -- Insert the images here
            defaultFile = "L1images/SaucePacket.png",
            overFile = "L1images/SaucePacket.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = SaucePacketButton          
        } )

    -- Creating pause Button
    cheese = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.6,
            y = display.contentCenterY/2*3.72,

            -- Insert the images here
            defaultFile = "L1images/Cheese.png",
            overFile = "L1images/Cheese.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = CheeseButton          
        } )

    -- Creating pause Button
    peperoni = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.09,
            y = display.contentCenterY/2*3.3,

            -- Insert the images here
            defaultFile = "L1images/peperoni.png",
            overFile = "L1images/peperoni.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = PeperoniButton          
        } )

    

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

        -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )
    sceneGroup:insert( pizzadough )
    sceneGroup:insert( strawberry )   
    sceneGroup:insert( saucepacket )
    sceneGroup:insert( chocolate )
    sceneGroup:insert( carrot )
    sceneGroup:insert( peperoni )
    sceneGroup:insert( cheese )
    sceneGroup:insert( tomato )
    sceneGroup:insert( Pause )
    sceneGroup:insert( level1text ) 
    sceneGroup:insert( HowTo )
    sceneGroup:insert( sauce )
    sceneGroup:insert( shreddedcheese )
    sceneGroup:insert( peperonislices )

end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.

        local function MoveLevel1Text(event)

            -- change the transparency of the text so that it fades out
            level1text.alpha = level1text.alpha - 0.0005
        end

        -- MoveLevel1Text will be called over and over again
        Runtime:addEventListener("enterFrame", MoveLevel1Text)
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.

    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene