=begin

Further Exploration

The compute_sum and compute_product methods are simple and should be familiar. A more Rubyish way of computing sums and products is with the Enumerable#inject method. #inject is a very useful method, but if you've never used it before, it can be difficult to understand.

Take some time to read the documentation for #inject. (Note that all Enumerable methods can be used on Array.) Try to explain how it works to yourself.

Try to use #inject in your solution to this problem.

Note that #inject is an alias for #reduce. The two methods work identically. We mostly use #reduce in our curriculum, but it's worth noting that the documentation uses #inject.

=end

def compute_sum(number)
  (1..number).inject(:+)
end

def compute_product(number)
  (1..number).inject(:*)
end

puts ">> Please enter an integer greater than 0"
number = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  sum = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif operation == 'p'
  product = compute_product(number)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Oops. Unknown operation."
end