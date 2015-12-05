#!/usr/bin/ruby -w

# Advent of Code Day 1 Pt 1

input = ""
file = File.new("day1.txt", "r")
while (line = file.gets)
    input = line
end

file.close

floor_num = input.split("(", -1).length - input.split(")", -1).length
puts "Floor Num: #{floor_num}" 

