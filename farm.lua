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
        print(i)
        print(turtle.getItemCount())
        print(turtle.getItemCount(i))
        print(turtle.getItemCount(i)==0)
        print(not turtle.getItemCount(i)==0)
        if not turtle.getItemCount(i) == 0 then
            if dancing == true then
                turtle.down()
                turtle.down()
                dancing = false
            end
            succ = true
            break
        end
        print(succ)
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