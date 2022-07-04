local r = 1
local runtimeArgs = { ... }
if #runtimeArgs ~= 1 or #runtimeArgs ~= 2 then
    print("Usage: planeTop <size> <depth>")
    error()
end

local size = runtimeArgs[1]
local depth = runtimeArgs[2]
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

local blockName = turtle.getItemDetail().name

local function digRow()
    for i = 1, size - 1 do
        turtle.digDown()
        if turtle.getItemCount() == 0 or not turtle.getItemDetail().name == blockName then
            nextSlot()
        end
        turtle.forward()
    end
    turtle.digDown()
    if turtle.getItemCount() == 0 or not turtle.getItemDetail().name == blockName then
        nextSlot()
    end
end

local function digFillRow()
    for i = 1, size - 1 do
        turtle.digDown()
        turtle.placeUp()
        if turtle.getItemCount() == 0 or not turtle.getItemDetail().name == blockName then
            nextSlot()
        end
        turtle.forward()
    end
    turtle.digDown()
    turtle.placeUp()
    if turtle.getItemCount() == 0 or not turtle.getItemDetail().name == blockName then
        nextSlot()
    end
end

local function fillRow()
    for i = 1, size - 1 do
        turtle.placeUp()
        if turtle.getItemCount() == 0 or not turtle.getItemDetail().name == blockName then
            nextSlot()
        end
        turtle.forward()
    end
    turtle.placeUp()
    if turtle.getItemCount() == 0 or not turtle.getItemDetail().name == blockName then
        nextSlot()
    end
end

local function nextRow()
    turtle.down()
    turtle.turnLeft()
    turtle.turnLeft()
end

-- !
nextSlot()
digRow()
nextRow()
digRow()
nextRow()
for i = 1, depth do
    digFillRow()
    nextRow()
end