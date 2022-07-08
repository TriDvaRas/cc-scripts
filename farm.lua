local dancing = false
local turnR = true
local function dance()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.turnLeft()
end

local function selectSeeds()
    local succ = false
    for i = 1, 3 do
        turtle.select(i)
        if (turtle.getItemCount(i) > 1) then
            if dancing == true then
                turtle.down()
                turtle.down()
                dancing = false
            end
            succ = true
            break
        end
    end
    if not succ then
        print('No seeds found in slots 1-3')
        if dancing == false then
            dancing = true
            turtle.up()
            turtle.up()
        end
        dance()
        selectSeeds()
    end
end

local function processTile()
    local succ, data = turtle.inspectDown()
    if succ then
        if data.metadata == 7 then
            turtle.select(4)
            turtle.digDown()
            selectSeeds()
            turtle.placeDown()
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
    for i = 4, 16 do
        turtle.select(i)
        for j = 1, 3 do
            if turtle.compareTo(j) then
                turtle.transferTo(j)
            end
        end
        turtle.dropDown()
    end
end

local function farm()
    for i = 1, 8 do
        for j = 1, 8 do
            processTile()
            turtle.forward()
        end
        processTile()
        nextRow()
    end
    for j = 1, 8 do
        processTile()
        turtle.forward()
    end
    processTile()
    turtle.turnRight()
    turtle.turnRight()
    for i = 1, 9 do
        turtle.forward()
    end
    turtle.turnRight()
    for i = 1, 8 do
        turtle.forward()
    end
    turtle.turnRight()
    turnR = true
end

local function main()
    selectSeeds()
    dropCrops()
    while true do
        turtle.forward()
        farm()
        dropCrops()
        sleep(60)
    end
end

main()
