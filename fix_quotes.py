import sys
path = r'D:/strangeattractor/_layouts/default.html'
lines = open(path).readlines()
del lines[118:125]
open(path, 'w').writelines(lines)
print('Done')
