# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

def ascii_value(string)
  string.empty? ? 0 : string.chars.map { |char| char.ord }.inject(:+)
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Solution

# def ascii_value(string)
#   sum = 0
#   string.each_char { |char| sum += char.ord }
#   sum
# end

# Discussion

# There isn't much to say here. We initialize the sum to 0 (which takes care of the empty string case in addition to giving us a starting value), then add String#ord for every character to that sum. Finally, we return the sum.

# Further Exploration

# There is an Integer method such that:

# char.ord.mystery == char

# where mystery is our mystery method. Can you determine what method name should be used in place of mystery? What happens if you try this with a longer string instead of a single character?

# Integer#chr
# char.ord.chr == char
# Returns a 1-character string containing the character represented by the value of self, according to the given encoding.

# method chain called on a longer string returns only the first character of the original string