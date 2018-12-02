frequency = 0
seen = {}

file = io.open("input.txt")

while true do
    for line in file:lines() do
        delta = tonumber(line)
        frequency = frequency + delta
        if seen[frequency] then
            print(frequency)
            return
        end
        seen[frequency] = true
    end
    file:seek("set", 0)
end

file:close()
