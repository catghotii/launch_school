# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

# Examples:

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# The tests above should print true.

def stringy_with_loop(number)
  char_index = 0
  string = ""
  loop do
    char_index.odd? ? string << "0" : string << "1"
    char_index += 1
    break if char_index == number
  end
  string
end

puts stringy_with_loop(6) == '101010'
puts stringy_with_loop(9) == '101010101'
puts stringy_with_loop(4) == '1010'
puts stringy_with_loop(7) == '1010101'

def stringy_with_while(number)
  string = ""
  while string.size < number
    string << "10"
  end
  string.slice!(-1) if string.size != number
  string
end

puts stringy_with_while(6) == '101010'
puts stringy_with_while(9) == '101010101'
puts stringy_with_while(4) == '1010'
puts stringy_with_while(7) == '1010101'