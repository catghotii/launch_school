# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

# solution 1

famous_words.prepend("Four score and ")

puts famous_words

# solution 2

famous_words2 = "seven years ago..."

puts "Four score and " + famous_words2
puts "Four score and #{famous_words2}"

# solution 3

famous_words3 = "seven years ago..."
four_score_and = "Four score and "

puts "Four score and " << famous_words3

four_score_and << famous_words3

puts four_score_and # also concatenating i.e. destructive