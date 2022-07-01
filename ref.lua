local r = 1
for j = 1, 8 do
    for i = 1, 25 do
        print(turtle.getFuelLevel())
        turtle.forward()
        turtle.placeDown()
        turtle.refuel()
    end
    if r == 1 then
        turtle.turnRight()
        turtle.forward()
        turtle.placeDown()
        turtle.refuel()
        turtle.turnRight()
        r = 0
    else
        turtle.turnLeft()
        turtle.forward()
        turtle.placeDown()
        turtle.refuel()
        turtle.turnLeft()
        r = 1
    end
end

print(turtle.getFuelLevel())
