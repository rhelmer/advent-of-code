-- return the difference between any two strings that only differ by one character.
function diff(s1, s2)
    assert(#s1 == #s2)

    local delta = ""
    local index = 1

    for i = 1, #s1 do
        if s1:sub(i, i) ~= s2:sub(i, i) then
            index = i
            delta = delta .. s1:sub(i, i)
        end
    end

    local result = ""
    if #delta == 1 then
        result = result .. string.sub(s1, 1, index - 1)
        result = result .. string.sub(s1, index + 1, #s1)
    end
    return result
end

local file = assert(io.open("input.txt", "rb"))
local contents = file:read "*a"
file:close()

local strings = {}
local total_counter = 0

for line in contents:gmatch("[^\r\n]+") do
    total_counter = total_counter + 1
    strings[total_counter] = line
end

local counter = 0

for k, v in pairs(strings) do
    counter = counter + 1
    for i = counter, total_counter, 1 do
        local s1 = v
        local s2 = strings[i]

        local result = diff(s1, s2)
        if #result == #s1 - 1 then
            print(result)
        end
    end
end
