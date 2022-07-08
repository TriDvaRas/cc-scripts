local dancing = false
local turnR = true
local function seedDance()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.turnLeft()
    selectSeeds()
end

function selectSeeds()
    for i = 1, 3 do
        turtle.select(i)
        if not turtle.getItemCount() == 0 then
            if dancing == true then
                turtle.down()
                turtle.down()
                dancing = false
            end
            return
        end
    end
    print('No seeds found in slots 1-3')
    if dancing == false then
        dancing = true
        turtle.up()
        turtle.up()
    end
    seedDance()
end

local function processTile()
    local succ, data = turtle.inspectDown()
    if succ then
        if data.metadata == 7 then
            turtle.select(4)
            turtle.digDown()
        end
    else
        selectSeeds()
        turtle.placeDown()
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
local function dropCrops()
    for i = 3,16 do
        
    end
end
local function farm()
    for i = 1, 7 do
        for j = 1, 7 do
            processTile()
            turtle.forward()
        end
        processTile()
        nextRow()
    end
    for j = 1, 7 do
        processTile()
        turtle.forward()
    end
    processTile()
    turtle.forward()
    turtle.turnRight()
    for i = 1, 8 do
        turtle.formard()
    end
    turtle.turnRight()
end

local function main()
    while true do
        dropCrops()
        turtle.forward()
        farm()
    end
end

main()