import json

# Load data from readtimes.json
with open('./_write_times.json', 'r') as f:
    data = json.load(f)

points = data['points']

# Get set of first elements (time values)
time_set = set(point[0] for point in points)

print(f"Number of unique time values: {len(time_set)}")
print(f"Total data points: {len(points)}")
