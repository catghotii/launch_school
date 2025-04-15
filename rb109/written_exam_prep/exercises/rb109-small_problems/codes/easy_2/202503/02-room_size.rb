=begin

Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

Example Run

Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).

=end

print "Enter the length of the room in meters: "
length_in_meters = gets.to_f

print "Enter the width of the room in meters: "
width_in_meters = gets.to_f

area_meters = length_in_meters * width_in_meters
area_feet = area_meters * 10.7639
print "The area of the room is #{area_meters} square meters (#{area_feet} square feet)."

# LS solution
# use constant
# Float#round method - round to nearest given decimal places

SQMETERS_TO_SQFEET = 10.7639

puts 'Enter the length of the room in meters: '
length = gets.to_f

puts 'Enter the width of the room in meters: '
width = gets.to_f

square_meters = (length * width).round(2)
square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{square_meters} " + \
     "square meters (#{square_feet} square feet)."

# Further Exploration

# Modify this program to ask for the input measurements in feet, and display the results in square feet, square inches, and square centimeters.