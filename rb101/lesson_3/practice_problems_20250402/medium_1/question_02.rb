# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# Answer:
# A TypeError occurs because a String object cannot be concatenated with an Integer object.
# Fix this using string interpolation, or converting the Integer object into a String object before concatenating both string values

# string interpolation

puts "the value of 40 + 2 is #{(40 + 2)}"

# to_s

puts "the value of 40 + 2 is " + (40 + 2).to_s