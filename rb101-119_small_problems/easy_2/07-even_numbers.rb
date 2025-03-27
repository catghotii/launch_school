# Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

for number in 1..99
  puts number if number.even?
end

# while loop

value = 1
numbers = 1..99
while value <= 99
  puts value if value.even?
  value += 1
end