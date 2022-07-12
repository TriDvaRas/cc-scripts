local r = 1
local runtimeArgs = { ... }
if #runtimeArgs ~= 1 then
    print("Usage: lava <size>")
    error()
end

local size = runtimeArgs[1]
local slot = 0
local turnR = true
--

local succR = 0
local succF = 0

local function doRow()
    for i = 1, size - 1 do
        turtle.select(1)
        turtle.placeDown()
        turtle.select(2)
        turtle.placeUp()
        turtle.select(1)
        turtle.placeUp()

        if turtle.forward() then
            if turnR then
                succF = succF + 1
            else
                succF = succF - 1
            end
        end

    end
    turtle.placeUp()
end

local function nextRow()
    if turnR then
        turtle.turnRight()
        while turtle.detect() do
            turtle.turnRight()
            if turtle.detect() then
                print('Stuck')
                os.exit()
            end
            if turtle.forward() then
                succF = succF - 1
            end
            turtle.forward()
            turtle.turnLeft()
        end
        succR = succR + 1
        turtle.forward()
        turtle.turnRight()
        turnR = false
    else
        turtle.turnLeft()
        while turtle.detect() do
            turtle.turnLeft()
            if turtle.detect() then
                print('Stuck')
                os.exit()
            end
            if turtle.forward() then
                succF = succF + 1
            end
            turtle.turnRight()
        end
        succR = succR + 1
        turtle.forward()
        turtle.turnLeft()
        turnR = true
    end
end

local function comeBack()
    turtle.turnLeft()
    for i = 1, succR do
        turtle.dig()
        turtle.forward()
    end

    if succF ~= 0 then
        if succF > 0 then
            turtle.turnLeft()
        elseif succF < 0 then
            turtle.turnRight()
            succF = -succF
        end
        for i = 1, succF do
            turtle.dig()
            turtle.forward()
        end
    end
end

-- !
for i = 1, size - 1 do
    doRow()
    nextRow()
end
doRow()

print("…………………...„„-~^^~„-„„_")
print("………………„-^*'' : : „'' : : : : *-„")
print("…………..„-* : : :„„--/ : : : : : : : '\\")
print("…………./ : : „-* . .| : : : : : : : : '|")
print("……….../ : „-* . . . | : : : : : : : : |")
print("………...\\„-* . . . . .| : : : : : : : :'|")
print("……….../ . . . . . . '| : : : : : : : :|")
print("……..../ . . . . . . . .'\\ : : : : : : : |")
print("……../ . . . . . . . . . .\\ : : : : : : :|")
print("……./ . . . . . . . . . . . '\\ : : : : : /")
print("….../ . . . . . . . . . . . . . *-„„„„-*'")
print("….'/ . . . . . . . . . . . . . . '|")
print("…/ . . . . . . . ./ . . . . . . .|")
print("../ . . . . . . . .'/ . . . . . . .'|")
print("./ . . . . . . . . / . . . . . . .'|")
print("'/ . . . . . . . . . . . . . . . .'|")
print("'| . . . . . \ . . . . . . . . . .|")
print("'| . . . . . . \„_^- „ . . . . .'|")
print("'| . . . . . . . . .'\ .\ ./ '/ . |")
print("| .\ . . . . . . . . . \ .'' / . '|")
print("| . . . . . . . . . . / .'/ . . .|")
print("| . . . . . . .| . . / ./ ./ . .|")