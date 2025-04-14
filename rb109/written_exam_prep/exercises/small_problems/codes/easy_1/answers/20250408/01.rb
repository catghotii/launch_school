# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# Example:

# repeat('Hello', 3)

# Output:

# Hello
# Hello
# Hello

string = "Hello"
integer = 3

def repeat_with_loop(string, integer)
  count = 0
  loop do
    puts string
    count += 1
    break if count == 3
  end
end

puts "loop"
repeat_with_loop(string, integer)

def repeat_with_times(string, integer)
  integer.times { |i| puts string }
end

puts "times"
repeat_with_times(string, integer)

def repeat_with_while(string, integer)
  count = 0
  while count < integer
    puts string
    count += 1
  end
end

puts "while"
repeat_with_while(string, integer)

def repeat_with_each(string, integer)
  ([string] * integer).each { |word| puts word }
end

puts "each"
repeat_with_each(string, integer)