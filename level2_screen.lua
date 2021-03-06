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
sceneName = "level2_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image
local tacoShelldough
----------------
local beefBowl
---------------------
local carrot    
local cheese
local chocolate
----------------
local lettuce
---------------workingbelow
local strawberry
local salsa
local salsajar
local tomato
local beef
local shreddedcheese
------------------------
local lettuceShredded
------------------------
local tacoShell
local goal
-- text for level1
local level2text
local lives = 3
local points = 0
local correctfood = 0
local correctObject1
local correctObject2
local correctObject3

local incorrectObject1
local incorrectObject2
local incorrectObject3
local incorrectObject4

local hat1
local hat2
local hat3


local bkgMusic = audio.loadStream( "Sounds/ArabianSalsa2.mp3")
local bkgMusicChannel = audio.play( bkgMusic1, { channel=1, loops=-1 } )
local bkgMusic1 = audio.loadStream( "Sounds/ArabianSalsa2.mp3")
local bkgMusicChannel 
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
    incorrectObject4.isVisible = false
end

local function RestartLevel2()
    -- makes all the objects visible or invisible when scene starts
    beefBowl.isVisible = true
    cheese.isVisible = true
    salsajar.isVisible = true
    salsa.isVisible = false
    shreddedcheese.isVisible = false
    lettuceShredded.isVisible = false
    lettuce.isVisible = true
    beef.isVisible = false
    tacoShell.isVisible = true
    hat1.isVisible = true
    hat2.isVisible = true
    hat3.isVisible = true

    points = 0
    correctfood = 0
    lives = 3
end


local function YouLoseTransition()
    composer.gotoScene( "you_lose" )
end

local function YouWinTransition()
    composer.gotoScene( "you_win" )
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerResume(touch)
    
    if (touch.phase == "ended") then

        BackToLevel1( )
    
    end 
end

function L2WrongAnswer()
    
    incorrectObject2.isVisible = true
    timer.performWithDelay(1000, HideIncorrect)
    -- show overlay with math question
    lives = lives - 1
    
   if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
end

function L2WrongAnswer2()
    
    incorrectObject2.isVisible = true
    timer.performWithDelay(1000, HideIncorrect)
    
    if (points == 3) then
        
        timer.performWithDelay(1000, YouWinTransition)
    
    elseif (points == 2) then  
        timer.performWithDelay(1000, YouWinTransition)

    
    elseif (points == 1) then

        timer.performWithDelay(200, YouLoseTransition)
    
    elseif (points == 0) then

        timer.performWithDelay(200, YouLoseTransition)
    end

    if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
end

function L2RightAnswer()
    
    correctObject2.isVisible = true
    timer.performWithDelay(1000, HideCorrect)
    -- show overlay with math question
    points = points + 1
    
    if (points == 4) then

        timer.performWithDelay(1000, YouWinTransition)
    end
end

function L2RightAnswer2()
    
    correctObject2.isVisible = true
    timer.performWithDelay(1000, HideCorrect)
    -- show overlay with math question
    points = points + 1
    
    if (points == 4) then
        
        timer.performWithDelay(1000, YouWinTransition)
    
    elseif (points == 3) then  
        timer.performWithDelay(1000, YouWinTransition)

    
    elseif (points == 2) then

        timer.performWithDelay(200, YouLoseTransition)
    
    elseif (points == 1) then

        timer.performWithDelay(200, YouLoseTransition)

	elseif (points == 0) then

        timer.performWithDelay(200, YouLoseTransition)

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
    composer.showOverlay( "howto_screen2", { isModal = true, effect = "fade", time = 100})
end 


-- Creating Transition to help Screen
local function beefBowlButton()
    -- show overlay with math question
    if (correctfood == 0) then
        -- make the beef packet invisible
        beefBowl.isVisible = false

        -- make the beef visible over top of the tacoShell
        beef.isVisible = true

        timer.performWithDelay(1000, HideCorrect)
        -- adding to the score
        correctfood = correctfood  + 1 
        -- show overlay with math question
        composer.showOverlay( "L2question2", { isModal = true, effect = "fade", time = 100})

    else
        incorrectObject1.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        lives = lives - 1
        
        if (lives == 3) then
        	hat1.isVisible = true
        	hat2.isVisible = true
        	hat3.isVisible = true
    	elseif (lives == 2) then
        	hat1.isVisible = true
        	hat2.isVisible = true
        	hat3.isVisible = false
    	elseif (lives == 1) then
        	hat1.isVisible = true
        	hat2.isVisible = false
        	hat3.isVisible = false
    	elseif (lives == 0) then
        	hat1.isVisible = false
        	hat2.isVisible = false
        	hat3.isVisible = false
        	timer.performWithDelay(200, YouLoseTransition)
    	end
    end
end


-- Creating Transition to help Screen
local function CheeseButton()
    -- show overlay with math question
    if (correctfood == 1) then
        -- make the beef packet invisible
        cheese.isVisible = false

        -- make the beef visible over top of the tacoShell
        shreddedcheese.isVisible = true

        timer.performWithDelay(1000, HideCorrect)
        -- adding to the score
        correctfood = correctfood  + 1 
        -- show overlay with math question
        composer.showOverlay( "L2question1", { isModal = true, effect = "fade", time = 100})
    else
        incorrectObject1.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        lives = lives - 1
        
        if (lives == 3) then
        	hat1.isVisible = true
        	hat2.isVisible = true
        	hat3.isVisible = true
    	elseif (lives == 2) then
        	hat1.isVisible = true
        	hat2.isVisible = true
        	hat3.isVisible = false
    	elseif (lives == 1) then
        	hat1.isVisible = true
        	hat2.isVisible = false
        	hat3.isVisible = false
    	elseif (lives == 0) then
        	hat1.isVisible = false
        	hat2.isVisible = false
        	hat3.isVisible = false
        	timer.performWithDelay(200, YouLoseTransition)
    	end
    end
end

-- Creating Transition to help Screen
local function lettuceButton()
    -- show overlay with math question
    if (correctfood == 2) then
        -- make the beef packet invisible
        lettuce.isVisible = false

        -- make the beef visible over top of the tacoShell
        lettuceShredded.isVisible = true

        timer.performWithDelay(1000, HideCorrect)

        -- adding to the score
        correctfood = correctfood  + 1 

        -- show overlay with question
        composer.showOverlay( "L2question3", { isModal = true, effect = "fade", time = 100})
    else
        incorrectObject3.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        lives = lives - 1
        
        if (lives == 3) then
        	hat1.isVisible = true
        	hat2.isVisible = true
        	hat3.isVisible = true
    	elseif (lives == 2) then
        	hat1.isVisible = true
        	hat2.isVisible = true
        	hat3.isVisible = false
    	elseif (lives == 1) then
        	hat1.isVisible = true
        	hat2.isVisible = false
        	hat3.isVisible = false
    	elseif (lives == 0) then
        	hat1.isVisible = false
        	hat2.isVisible = false
        	hat3.isVisible = false
        	timer.performWithDelay(200, YouLoseTransition)
    	end
    end
end

-- Creating Transition to help Screen
local function SalsaButton()
    -- show overlay with math question
    if (correctfood == 3) then
        -- make the beef packet invisible
        salsajar.isVisible = false
        beef.isVisible = false
        lettuceShredded.isVisible = false
        shreddedcheese.isVisible = false
 		tacoShell.isVisible = false
 		       	
        -- make the beef visible over top of the tacoShell
        salsa.isVisible = true

        timer.performWithDelay(1000, HideCorrect)

        -- show overlay with question
        composer.showOverlay( "L2question4", { isModal = true, effect = "fade", time = 100})
    else
        incorrectObject3.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        lives = lives - 1
        
        if (lives == 3) then
        	hat1.isVisible = true
        	hat2.isVisible = true
        	hat3.isVisible = true
    	elseif (lives == 2) then
        	hat1.isVisible = true
        	hat2.isVisible = true
        	hat3.isVisible = false
    	elseif (lives == 1) then
        	hat1.isVisible = true
        	hat2.isVisible = false
        	hat3.isVisible = false
    	elseif (lives == 0) then
        	hat1.isVisible = false
        	hat2.isVisible = false
        	hat3.isVisible = false
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
    
   if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
end

-- Creating Transition to help Screen
local function ChocolateButton()
    incorrectObject2.isVisible = true
    timer.performWithDelay(1500, HideIncorrect)

    lives = lives - 1    
    
    if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
end

-- Creating Transition to help Screen
local function TomatoButton()

    incorrectObject1.isVisible = true
    timer.performWithDelay(1000, HideIncorrect)
    lives = lives - 1
    
    if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
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
    tacoShell= display.newImageRect("L2images/tacoShell.png", 350, 350 )
    tacoShell.x = display.contentCenterX
    tacoShell.y = display.contentCenterY/1.2

    -- Insert the image
    goal = display.newImageRect("L2images/salsa.png", 350, 350 )
    goal.x = display.contentWidth - 965
    goal.y = display.contentCenterY/1.8
    goal:scale (0.3, 0.3)
    

    -- Insert the image
    beef = display.newImageRect("L2images/beef.png", 350, 350 )
    beef.x = display.contentCenterX
    beef.y = display.contentCenterY/1.2
    beef.isVisible = false

    -- Insert the image
    shreddedcheese = display.newImageRect("L2images/shreddedcheese.png", 350, 350 )
    shreddedcheese.x = display.contentCenterX
    shreddedcheese.y = display.contentCenterY/1.2
    shreddedcheese.isVisible = false

    -- Insert the image
    lettuceShredded = display.newImageRect("L2images/lettuceShredded.png", 350, 350 )
    lettuceShredded.x = display.contentCenterX
    lettuceShredded.y = display.contentCenterY/1.2
    lettuceShredded.isVisible = false

    -- Insert the image
    salsa = display.newImageRect("L2images/salsa.png", 350, 350 )
    salsa.x = display.contentCenterX
    salsa.y = display.contentCenterY/1.2
    salsa.isVisible = false
    

    level2text = display.newImageRect("L2images/level2text.png", 450, 195)
    
    --set the initial x and y position of the text
    level2text.x = 500
    level2text.y = display.contentCenterY/6

    --Create the correct text object and make it invisible
    correctObject1 = display.newText( "That's good!", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
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
    incorrectObject1:setTextColor(255/255, 255/255, 0/255)
    incorrectObject1.isVisible = false

    incorrectObject2 = display.newText( "That's not even close", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    incorrectObject2:setTextColor(255/255, 255/255, 0/255)
    incorrectObject2.isVisible = false

    incorrectObject3 = display.newText( "That's not right!", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    incorrectObject3:setTextColor(255/255, 255/255, 0/255)
    incorrectObject3.isVisible = false

    incorrectObject4 = display.newText( "It's not ready!", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    incorrectObject4:setTextColor(255/255, 255/255, 0/255)
    incorrectObject4.isVisible = false

    hat3 = display.newImageRect("L1images/Hat.png", 100, 100)
    hat3.x = display.contentWidth*0.22
    hat3.y = display.contentHeight *0.37


    hat2 = display.newImageRect("L1images/Hat.png", 100, 100)
    hat2.x = display.contentWidth*0.22
    hat2.y = display.contentHeight *0.23

    hat1 = display.newImageRect("L1images/Hat.png", 100, 100)
    hat1.x = display.contentWidth*0.22
    hat1.y = display.contentHeight *0.1


    -- Creating pause Button
    carrot = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.2,
            y = display.contentCenterY/2*3.8,

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
            x = display.contentCenterX,
            y = display.contentCenterY/2*3.3,

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
    beefBowl = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*.75,
            y = display.contentCenterY/2*3.72,

            -- Insert the images here
            defaultFile = "L2images/beefbowl.png",
            overFile = "L2images/beefbowl.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = beefBowlButton          
        } )

    -- Creating pause Button
    cheese = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.3,
            y = display.contentCenterY/2*3.35,

            -- Insert the images here
            defaultFile = "L1images/Cheese.png",
            overFile = "L1images/Cheese.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = CheeseButton          
        } )

    -- Creating pause Button
    lettuce = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.6,
            y = display.contentCenterY/2*3.72,

            -- Insert the images here
            defaultFile = "L2images/lettuce.png",
            overFile = "L2images/lettuce.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = lettuceButton          
        } )

    -- Creating pause Button
    salsajar = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*.6,
            y = display.contentCenterY/2*3.3,

            -- Insert the images here
            defaultFile = "L2images/salsajar.png",
            overFile = "L2images/salsajar.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = SalsaButton          
        } )

    

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

        -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )
    sceneGroup:insert( tacoShell )
    sceneGroup:insert( strawberry )   
    sceneGroup:insert( beefBowl )
    sceneGroup:insert( chocolate )
    sceneGroup:insert( carrot )
    sceneGroup:insert( lettuce )
    sceneGroup:insert( cheese )
    sceneGroup:insert( salsajar )
    sceneGroup:insert( salsa )
    sceneGroup:insert( tomato )
    sceneGroup:insert( Pause )
    sceneGroup:insert( level2text ) 
    sceneGroup:insert( HowTo )
    sceneGroup:insert( beef )
    sceneGroup:insert( shreddedcheese )
    sceneGroup:insert( lettuceShredded )
    sceneGroup:insert( goal )
    sceneGroup:insert( hat1 )
    sceneGroup:insert( hat2 )
    sceneGroup:insert( hat3 )

    sceneGroup:insert( correctObject1 )
    sceneGroup:insert( correctObject2 )
    sceneGroup:insert( correctObject3 )
    sceneGroup:insert( incorrectObject1 )
    sceneGroup:insert( incorrectObject2 )
    sceneGroup:insert( incorrectObject3 )
    sceneGroup:insert( incorrectObject4 )

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

        bkgMusicChannel1 = audio.play( bkgMusic1, { channel=1, loops=-1 } )

        local function MoveLevel2Text(event)

            -- change the transparency of the text so that it fades out
            level2text.alpha = level2text.alpha - 0.0005
        end

        -- MoveLevel2Text will be called over and over again
        Runtime:addEventListener("enterFrame", MoveLevel2Text)

        RestartLevel2()



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
        bkgMusicChannel1 = audio.stop()

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
