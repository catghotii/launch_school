# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

# Example Output

# Teddy is 69 years old!

# 2025-03-19 first attempt

age = (20..200).to_a.sample
puts "Teddy is #{age} years old!"

# hint - Kernel#rand

age_2 = rand(20..200)
puts "Teddy is #{age_2} years old!"

# Further Exploration

# Modify this program to ask for a name, and then print the age for that person. For an extra challenge, use "Teddy" as the name if no name is entered.

print "Enter a name: "
name = gets

if name == "\n"
  puts "Teddy is #{age_2} years old!"
else
  puts "#{name.chomp.capitalize} is #{age_2} years old!"
end