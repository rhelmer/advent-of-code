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

for line in io.lines("input.txt") do
    local t = {}
    local letterCount = tally(t)
    for letter in line:gmatch("%a") do
        letterCount(letter)
    end
    for k, v in pairs(letterCount()) do
        print(line, k, v)
    end
end
