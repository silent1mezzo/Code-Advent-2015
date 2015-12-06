#!/usr/bin/ruby -w

# Advent of Code Day 2 Pt 1

input = ""
file = File.new("day3.txt", "r")
while (line = file.gets)
    input = line
end

file.close


x_location = 0
y_location = 0
houses = {x_location.to_s + "," + y_location.to_s => 1}

input.each_char do |direction|
    case direction
        when "^"
          x_location += 1
        when "v"
          x_location -= 1
        when ">"
          y_location += 1
        when "<"
          y_location += 1
    end

    if houses.key?(x_location.to_s + "," + y_location.to_s)
      houses[x_location.to_s + "," + y_location.to_s] += 1
    else
      houses[x_location.to_s + "," + y_location.to_s] = 1
    end

end

puts houses.length
