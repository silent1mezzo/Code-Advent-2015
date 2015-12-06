#!/usr/bin/ruby -w

# Advent of Code Day 2 Pt 1

input = ""
file = File.new("day3.txt", "r")
while (line = file.gets)
    input = line
end

file.close

# Super Hacky, I'm sure there's a better way.
s_x_location = 0
s_y_location = 0
r_x_location = 0
r_y_location = 0

houses = {s_x_location.to_s + "," + s_x_location.to_s => 1}
cnt = 0

input.each_char do |direction|

    if cnt % 2 == 0
        case direction
            when "^"
              s_x_location += 1
            when "v"
              s_x_location -= 1
            when ">"
              s_y_location += 1
            when "<"
              s_y_location -= 1
        end
        if houses.key?(s_x_location.to_s + "," + s_y_location.to_s)
          houses[s_x_location.to_s + "," + s_y_location.to_s] += 1
        else
          houses[s_x_location.to_s + "," + s_y_location.to_s] = 1
        end
    else
        case direction
            when "^"
              r_x_location += 1
            when "v"
              r_x_location -= 1
            when ">"
              r_y_location += 1
            when "<"
              r_y_location -= 1
        end
        if houses.key?(r_x_location.to_s + "," + r_y_location.to_s)
          houses[r_x_location.to_s + "," + r_y_location.to_s] += 1
        else
          houses[r_x_location.to_s + "," + r_y_location.to_s] = 1
        end
    end
    cnt += 1
end

puts houses.length
