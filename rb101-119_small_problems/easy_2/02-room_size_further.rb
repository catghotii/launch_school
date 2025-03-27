# Further Exploration

# Modify this program to ask for the input measurements in feet, and display the results in square feet, square inches, and square centimeters.

SQMETERS_TO_SQFEET = 10.7639
SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCM = 929.0304

puts 'Enter the length of the room in feet: '
length = gets.to_f

puts 'Enter the width of the room in feet: '
width = gets.to_f

square_feet = (length * width).round(2)
square_inches = square_feet * SQFEET_TO_SQINCHES.round(2)
square_cm = square_feet * SQFEET_TO_SQCM.round(2)

puts "The area of the room is #{square_feet} " + \
     "square feet (#{square_inches} square inches, or #{square_cm} square centimeters)."