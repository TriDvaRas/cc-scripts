-- tries to build a 8x8x16 cube with all available blocks
local slot = 0
local locf = 0
local locr = 0
local locu = 1
local turnR = true
local direction = 'f'
-- 
local function nextSlot()
    slot = slot + 1
    if slot == 17 then
        slot = 1
    end
    turtle.select(slot)
end
local function fillRow()
    for i = 1, 7 do
        turtle.placeDown()
        turtle.forward()
    end
    turtle.placeDown()
end
local function nextRow()
    if turnR then
        turtle.turnRight()
        turtle.forward()
        turtle.turnRight()
        turnR = false
    else
        turtle.turnLeft()
        turtle.forward()
        turtle.turnLeft()
        turnR = true
    end
end
local function nextLayer()
    turtle.up()
    turtle.turnLeft()
    turtle.turnLeft()
    turnR = true
end
-- !
nextSlot()
turtle.up()
while turtle.getItemCount() > 0 do
    for i = 1, 7 do
        fillRow()
        nextRow()
    end
    fillRow()
    nextLayer()
    nextSlot()
end
