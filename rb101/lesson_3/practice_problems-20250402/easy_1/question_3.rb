# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!('important', 'urgent')

# puts advice.split(' ').map { |word| word == 'important' ? word.replace('urgent') : word }.join(' ')

puts advice