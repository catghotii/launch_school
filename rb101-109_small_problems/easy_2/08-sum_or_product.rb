=begin

Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

Examples:

>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

=end

print ">> Please enter an integer greater than 0: "
integer = gets.to_i

operation = ''
loop do
  print ">> Enter 's' to compute the sum, 'p' to compute the product: "
  operation = gets.chomp
  if operation == 's' || operation == 'p'
    break
  else
    puts ">> Not a valid operation."
  end
end

all_numbers_between = []

for number in 1..integer
  all_numbers_between.push(number)
end

if operation == 's'
  sum = all_numbers_between.sum
  puts "The sum of the integers between 1 and #{integer} is #{sum}."
elsif operation == 'p'
  product = (1..integer).inject(:*)
  puts "The product of the integers between 1 and #{integer} is #{product}."
end