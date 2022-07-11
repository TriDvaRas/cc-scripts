local r = 1
local runtimeArgs = { ... }
if #runtimeArgs ~= 2 then
    print("Usage: ref <forward> <right>")
    error()
end

local function iter()
    turtle.forward()
    turtle.placeDown()
    turtle.refuel()
end

for j = 1, runtimeArgs[2] do
    for i = 1, runtimeArgs[1] do
        print(turtle.getFuelLevel())
        iter()
    end
    if r == 1 then
        turtle.turnRight()
        iter()
        turtle.turnRight()
        r = 0
    else
        turtle.turnLeft()
        iter()
        turtle.turnLeft()
        r = 1
    end
end

print(turtle.getFuelLevel())
