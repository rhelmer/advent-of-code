from shapely.geometry import box
import re

p = re.compile('(?P<inches>#\d*) @ (?P<x>\d*),(?P<y>\d*): (?P<width>\d*)x(?P<height>\d*)')

f = open('test-input.txt')

boxes = []

for line in f:
    m = p.match(line)
    if (m):
        print(m.group('inches'), m.group('x'), m.group('y'), m.group('width'), m.group('height'))
        a = m.groupdict()

        b = box(int(a['x']), int(a['y']), int(a['width']), int(a['height']))
        print(b)
    else:
        print('could not parse:', line)
        exit(1)
