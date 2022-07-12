local speaker = peripheral.find("speaker")
local function hruck()
    local rng = math.random()
    if rng > 0.95 then
        speaker.playSound("minecraft:entity.ender_dragon.death", 3.0)
    elseif rng > 0.90 then
        speaker.playSound("minecraft:entity.generic.explode", 3.0)
    elseif rng > 0.5 then
        speaker.playSound("minecraft:entity.pig.ambient", 3.0)
        sleep(5*math.random())
        speaker.playSound("minecraft:entity.pig.ambient", 3.0)
        sleep(5*math.random())
        speaker.playSound("minecraft:entity.pig.ambient", 3.0)
        sleep(5*math.random())
        speaker.playSound("minecraft:entity.pig.ambient", 3.0)
        sleep(5*math.random())
        speaker.playSound("minecraft:entity.pig.ambient", 3.0)
    end
end

local function main()
    while true do
        if speaker then
            hruck()
        end
        sleep(120*math.random())
    end
end

main()
