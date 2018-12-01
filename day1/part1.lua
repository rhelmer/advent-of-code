frequency = 0

for line in io.lines("day1-input.txt") do
    delta = tonumber(line)
    frequency = frequency + delta
end

print(frequency)
