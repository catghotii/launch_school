# Build a program that displays when the user will retire and how many years she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

# Use the Time class from the Ruby core library.

CURRENT_YEAR = Time.new.year

def calculate_retirement_year(age, retirement_age)
  CURRENT_YEAR + (retirement_age - age)
end

puts "What is your age?"
user_age = gets.chomp.to_i
puts "At what age would you like to retire?"
user_retirement_age = gets.chomp.to_i

retirement_year = calculate_retirement_year(user_age, user_retirement_age)

puts "It's #{CURRENT_YEAR}. You will retire in #{retirement_year}."
puts "You only have #{user_retirement_age - user_age} years of work to go!"