local function dance()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.turnLeft()
end

local function main()
    local speaker = peripheral.find("speaker")
    while true do
        turtle.placeDown()
        if speaker then
            if math.random()<0.5 then
                speaker.playSound("minecraft:entity.pig.ambient",1.0)
            elseif math.random()<0.07 then
                speaker.playSound("minecraft:entity.generic.explode",2.0)
            elseif math.random()<0.1 then
                speaker.playSound("minecraft:entity.ender_dragon.death",3.0)
            end
        end
        sleep(10)
    end
end

main()
