# Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

# Examples

# What is your name? Bob
# Hello Bob.

# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

def print_greeting(name)
  if name.end_with?("!") # OR if name[-1] == '!'
    name.slice!(-1)
    puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end
end

puts "What is your name?"
user_name = gets.chomp

print_greeting(user_name)