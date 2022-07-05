local runtimeArgs = { ... }
local dir = runtimeArgs[1] or 'f'

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
end
