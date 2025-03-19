=begin

Create a simple mad-lib program that prompts for a noun, a verb, an adjective, and an adverb and injects those into a story that you create.

Example

Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

=end

print "Enter a noun: "
noun = gets.chomp

print "Enter a verb: "
verb = gets.chomp

print "Enter a adjective: "
adjective = gets.chomp

print "Enter a adverb: "
adverb = gets.chomp

sentence = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
puts sentence

=begin

LS Solution:

print 'Enter a noun: '
noun = gets.chomp

print 'Enter a verb: '
verb = gets.chomp

print 'Enter an adjective: '
adjective = gets.chomp

print 'Enter an adverb: '
adverb = gets.chomp

sentence_1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
sentence_2 = "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog."
sentence_3 = "The #{noun} #{adverb} #{verb}s up #{adjective} Joe's turtle."

puts [sentence_1, sentence_2, sentence_3].sample

=end