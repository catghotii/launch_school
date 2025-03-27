=begin

Greeting a user

Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

Examples

What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?

=end

def greeting
  print "What is your name? "
  name = gets.chomp

  if name.end_with?('!')
    name.slice!(-1)
    puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name.capitalize}."
  end
end

greeting

# String#chop

def greeting
  print "What is your name? "
  name = gets.chomp

  if name.end_with?('!')
    name.chop
    puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name.capitalize}."
  end
end

# LS solution

print 'What is your name? '
name = gets.chomp

if name[-1] == '!'
  name = name.chop
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

# Further Exploration

# Try modifying our solution to use String#chomp! and String#chop!, respectively.

print 'What is your name? '
name = gets.chomp!

if name[-1] == '!'
  puts "HELLO #{name.upcase.chop!}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end