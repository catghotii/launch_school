# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

def prompt(position)
  puts "==> Enter the #{position} number: "
end

numbers = []

prompt("1st")
first = gets.chomp.to_i

prompt("2nd")
second = gets.chomp.to_i

prompt("3rd")
third = gets.chomp.to_i

prompt("4th")
fourth = gets.chomp.to_i

prompt("5th")
fifth = gets.chomp.to_i

prompt("last")
last = gets.chomp.to_i

numbers.push(first, second, third, fourth, fifth)

if numbers.include?(last)
  puts "The number #{last} appears in #{numbers}."
else
  puts "The number #{last} does not appear in #{numbers}."
end