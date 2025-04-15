# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

SQUARE_FEET = 10.7639

def room_area_square_meters(length, width)
  length * width
end

def square_m_to_square_feet(sqm)
  sqm * SQUARE_FEET
end

puts "Enter the length of the room in meters:"
length_m = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width_m = gets.chomp.to_f

puts "The area of the room is #{room_area_square_meters(length_m, width_m)} (#{square_m_to_square_feet(room_area_square_meters(length_m, width_m))} square feet)."