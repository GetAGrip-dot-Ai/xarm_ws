import csv
import random

# Define the ranges for x, y, and z
x_range = (0.15, 0.75)
y_range = (-0.4, 0.4)
z_range = (0.2, 0.85)

num_points = 50 # Number of points to generate

# Generate random points
points = []
for _ in range(num_points):
    x = random.uniform(x_range[0], x_range[1])
    y = random.uniform(y_range[0], y_range[1])
    z = random.uniform(z_range[0], z_range[1])
    points.append((x, y, z))

# Write the points to the CSV file
with open('points.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    
    # Write the header row
    writer.writerow(['X', 'Y', 'Z'])
    
    # Write the data rows
    for point in points:
        writer.writerow(point)