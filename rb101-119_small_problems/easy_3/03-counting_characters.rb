print "Please write word or multiple words: "
user_string = gets.chomp

character_count = 0
string_array = user_string.chars

# loop through string until end of string => convert string to array
# if whitespace, next
# else add 1 to count

for character in string_array
  if character == " "
    next
  else
    character_count += 1
  end
end

# output

puts "There are #{character_count} characteres in \"#{user_string}\"."

# LS solution

print 'Please write word or multiple words: '
input = gets.chomp
number_of_characters = input.delete(' ').size
puts "There are #{number_of_characters} characters in \"#{input}\"."