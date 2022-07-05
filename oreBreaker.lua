turtle.digDown()
while true do
    local hasSpace = turtle.drop()
    if hasSpace then
        turtle.digDown()
    end
end