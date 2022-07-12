local runtimeArgs = { ... }
if #runtimeArgs ~= 1 then
    print("Usage: wool <size>")
    error()
end
local size = runtimeArgs[1]

local speaker = peripheral.find("speaker")
local function step()
    turtle.forward()
    turtle.forward()
    turtle.forward()
    turtle.turnLeft()
    turtle.place()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.place()
    turtle.turnLeft()
end
local function dropWool()
    for i = 2, 16 do
        turtle.select(i)
        turtle.dropUp()
    end
end
local function reshear()
    turtle.select(1)
    local item = turtle.getItemDetail()
    if not item or not item.name:find('shears') then
        turtle.dropUp()
        turtle.suckUp()
    end
end

local function hruck()
    if math.random() < 0.5 then
        speaker.playSound("minecraft:entity.pig.ambient", 1.0)
    elseif math.random() < 0.07 then
        speaker.playSound("minecraft:entity.generic.explode", 2.0)
    elseif math.random() < 0.1 then
        speaker.playSound("minecraft:entity.ender_dragon.death", 3.0)
    end
end

local function main()
    while true do
        reshear()
        if speaker then
            hruck()
        end
        for i = 1, size do
            step()
        end
        turtle.turnLeft()
        turtle.turnLeft()
        for i = 1, size do
            turtle.forward()
            turtle.forward()
            turtle.forward()
        end
        turtle.turnLeft()
        turtle.turnLeft()
        dropWool()
        if speaker then
            hruck()
        end
        sleep(10)
    end
end

main()
