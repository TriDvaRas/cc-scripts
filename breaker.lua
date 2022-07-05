local runtimeArgs = { ... }
local dir = runtimeArgs[1] or 'f'
local yieldTime -- variable to store the time of the last yield
local function yield()
        if yieldTime then -- check if it already yielded
                if os.clock() - yieldTime > 2 then -- if it were more than 2 seconds since the last yield
                        os.queueEvent("someFakeEvent") -- queue the event
                        os.pullEvent("someFakeEvent") -- pull it
                        yieldTime = nil -- reset the counter
                end
        else
                yieldTime = os.clock() -- store the time
        end
end

while true do
    if not turtle.getItemSpace()==0 then
        if dir == 'd' then

            turtle.digDown()
        elseif dir == 'u' then
            turtle.digUp()
        else
            turtle.dig()
        end
    end
    yield()
end
