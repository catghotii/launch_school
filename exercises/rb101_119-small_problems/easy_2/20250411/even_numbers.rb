# Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

# while

count = 1
while count < 100
  puts count if count % 2 == 0
  count += 1
end

# for

for num in (1..99)
  puts num if num % 2 == 0
end

# loop

count = 1
loop do
  puts count if count % 2 == 0
  count += 1
  break if count > 99
end

# each

(1..99).to_a.each { |num| puts num if num % 2 == 0 }

# upto

1.upto(99) { |i| puts i if i.even? }