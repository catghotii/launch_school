# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# times method

def repeat(string, integer)
  integer.times { puts string }
end

repeat('Hello', 3)

# or loop method

def repeat_2(string, integer)
  count = 0
  loop do
    puts string
    count += 1
    break if count == integer
  end
end

repeat_2('Hello', 3)