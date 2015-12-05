#!/usr/bin/ruby -w

# Advent of Code Day 2 Pt 2

input = []
file = File.new("day2.txt", "r")
while (line = file.gets)
    input.push(line)
end

file.close

def calculate_ribbon(dimensions)
    dimensions = dimensions.split('x')
    length = dimensions[0].to_i
    width = dimensions[1].to_i
    height = dimensions[2].to_i

    ribbon_sides = [length, width, height]

    # The ribbon required to wrap a present is the shortest distance around its sides, or the smallest perimeter of any one face.
    ribbon_for_present = 2*ribbon_sides.sort[0] + 2*ribbon_sides.sort[1]

    # the feet of ribbon required for the perfect bow is equal to the cubic feet of volume of the present.
    ribbon_for_bow = length * width * height
    return ribbon_for_present + ribbon_for_bow
end


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
total_ribbon = 0
input.each do |box|
  dimension = calculate_paper(box)
  total_amount += dimension

  total_ribbon += calculate_ribbon(box)
end

puts "Total Area Needed = #{total_amount}"
puts "Total Length of Ribbon Needed = #{total_ribbon}"
