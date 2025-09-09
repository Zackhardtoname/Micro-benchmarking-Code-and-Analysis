import json

# Load data from readtimes.json
with open('./_read_times.json', 'r') as f:
    data = json.load(f)

points = data['points']

# Find max time difference between consecutive points
max_delta = 0
max_index = 0

for i in range(1, len(points) - 1):  # - 1 to ignore the end marker
    delta = points[i][0] - points[i-1][0]
    if delta > max_delta:
        max_delta = delta
        max_index = i-1

print(f"Max time delta: {max_delta:.6f} sec between points {max_index} and {max_index+1}")
