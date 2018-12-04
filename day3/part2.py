from collections import defaultdict

import re

p = re.compile(r'(?P<name>#\d*) @ (?P<x>\d*),(?P<y>\d*): (?P<width>\d*)x(?P<height>\d*)')

f = open('input.txt')

boxes = defaultdict(int)

for line in f:
    m = p.match(line)
    if (m):
        a = m.groupdict()
        name = a['name']
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

f.seek(0)

for line in f:
    m = p.match(line)
    if (m):
        a = m.groupdict()
        name = a['name']
        x = int(a['x'])
        y = int(a['y'])
        w = int(a['width'])
        h = int(a['height'])

        def loop():
            for dx in range(w):
                for dy in range(h):
                    if boxes[(x+dx, y+dy)] > 1:
                        return
            print(name)
        loop()
    else:
        print('could not parse:', line)
        exit(1)