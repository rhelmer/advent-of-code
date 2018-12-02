function tally(t)
    local function count(x)
        if x then
            if t[x] then
                t[x] = t[x] + 1
            else
                t[x] = 1
            end
        else
            return t
        end
    end
    return count
end

local num_twos = 0
local num_threes = 0

for line in io.lines("input.txt") do
    local t = {}
    local letterCount = tally(t)
    for letter in line:gmatch("%a") do
        letterCount(letter)
    end

    local twos = {}
    local threes = {}

    for k, v in pairs(letterCount()) do
        if v == 2 then
            twos[line] = true
        elseif v == 3 then
            threes[line] = true
        end
    end

    -- lua doesn't seem to have an O(1) way to get the length of non-numeric
    -- tables.

    for k, v in pairs(twos) do
        num_twos = num_twos + 1
    end
    for k, v in pairs(threes) do
        num_threes = num_threes + 1
    end
end

print(num_twos * num_threes)
