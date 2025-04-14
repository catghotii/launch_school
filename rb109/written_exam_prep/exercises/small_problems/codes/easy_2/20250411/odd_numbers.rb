# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

# each

(1..99).to_a.each { |num| puts num if num.odd? }

# while

count = 0
while count < 100
  puts count if count.odd?
  count += 1
end

# for

for num in (1..99)
  puts num if num.odd?
end

# loop

count = 0
loop do
  puts count if count.odd?
  count += 1
  break if count == 100
end

# select

(1..99).to_a.select { |num| num if num.odd? }

# upto

1.upto(99) { |i| puts i if i.odd? }