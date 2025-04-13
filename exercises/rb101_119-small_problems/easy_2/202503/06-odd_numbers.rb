# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

for number in 1..99
  puts number if number.odd?
end

# LS solution
# counting up from 1 to 99 by 2s

value = 1
while value <= 99
  puts value
  value += 2
end

# Further Exploration

# Repeat this exercise with a technique different from the one you just used, and different from the solution shown above. You may want to explore the use Integer#upto or Array#select methods, or maybe use Integer#odd?

numbers = (1..99).to_a

numbers.select { |number| puts number if number.odd? }