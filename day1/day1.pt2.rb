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

position = 1
floor_position = 0
input.split("").each do |i|
    if i == "("
        floor_position += 1
    else
        floor_position -= 1
    end
    
    break if floor_position < 0
    position += 1
end

puts "Santa first entered the basement at position #{position}"
