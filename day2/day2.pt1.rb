#!/usr/bin/ruby -w

# Advent of Code Day 2 Pt 1

input = []
file = File.new("day2.txt", "r")
while (line = file.gets)
    input.push(line)
end

file.close

def calculate_paper(dimensions)
    dimensions = dimensions.split('x')
    length = dimensions[0].to_i
    width = dimensions[1].to_i
    height = dimensions[2].to_i

    # Surface area of the box of each side
    side_one = length*width
    side_two = width*height
    side_three = height*length

    # Surface area of the box (Each side * 2)
    surface_area = 2*side_one + 2*side_two + 2*side_three

    # The elves also need a little extra paper for each present: the area of the smallest side.
    slack = [side_one, side_two, side_three].min

    return surface_area + slack
end

total_amount = 0
input.each do |box|
  dimension = calculate_paper(box)
  total_amount += dimension
end

puts "Total Area Needed = #{total_amount}"
