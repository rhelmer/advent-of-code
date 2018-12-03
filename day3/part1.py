from collections import defaultdict

import re

p = re.compile(r'(?P<inches>#\d*) @ (?P<x>\d*),(?P<y>\d*): (?P<width>\d*)x(?P<height>\d*)')

f = open('input.txt')

boxes = defaultdict(int)

for line in f:
    m = p.match(line)
    if (m):
        a = m.groupdict()
        x = int(a['x'])
        y = int(a['y'])
        w = int(a['width'])
        h = int(a['height'])
        for dx in range(w):
            for dy in range(h):
                boxes[(x+dx, y+dy)] += 1
    else:
        print('could not parse:', line)
        exit(1)

square_inches = 0
for v in boxes.values():
    if v >= 2:
        square_inches += 1

print(square_inches)
