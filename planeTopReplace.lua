local r = 1
local runtimeArgs = { ... }
if #runtimeArgs ~= 1 then
    print("Usage: planeTop <size>")
    error()
end

local blockName = turtle.getItemDetail().name
local size = runtimeArgs[1]  
local slot = 0
local turnR = true
-- 
local function nextSlot()
    slot = slot + 1
    if slot == 17 then
        slot = 1
    end
    turtle.select(slot)
end
local function fillRow()
    for i = 1, size-1 do
        turtle.digUp()
        turtle.placeUp()
        if turtle.getItemCount() == 0 or not turtle.getItemDetail().name == blockName then
            nextSlot()
        end
        turtle.forward()
    end
    turtle.digUp()
    turtle.placeUp()
    if turtle.getItemCount() == 0 or not turtle.getItemDetail().name == blockName then
        nextSlot()
    end
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
-- !
nextSlot()
for i = 1, size-1 do
    fillRow()
    nextRow()
end
fillRow()

