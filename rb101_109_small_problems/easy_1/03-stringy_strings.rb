# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

# The tests should print true.

# first attempt 2025-03-15

def stringy(integer)
  string = ''
  one = '1' # odd index
  zero = '0' # even index

  if integer.even?
    (integer / 2).times { string.concat(one, zero) }
  else
    integer += 1
    (integer / 2).times { string.concat(one, zero) }
    string.slice!(integer-1)
  end

  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# LS solution --> use an array and times method!

def stringy_2(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

puts stringy_2(6) == '101010'
puts stringy_2(9) == '101010101'
puts stringy_2(4) == '1010'
puts stringy_2(7) == '1010101'

# Further exploration: Modify stringy so it takes an additional optional argument that defaults to 1. If the method is called with this argument set to 0, the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.

def stringy_3(size, starting_number=1)
  numbers = []

  if starting_number == 1
    size.times do |index|
      number = index.even? ? 1 : 0
      numbers << number
    end
  elsif starting_number == 0
    size.times do |index|
      number = index.even? ? 0 : 1
      numbers << number
    end
  end

  numbers.join
end

puts stringy_3(6,1)
puts stringy_3(9,0)
puts stringy_3(4)
puts stringy_3(7)