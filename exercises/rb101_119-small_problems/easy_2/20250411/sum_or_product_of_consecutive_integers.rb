# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

STARTING_INTEGER = 1

def sum_of_consecutive_integers(finishing_integer)
  sum = 0
  (STARTING_INTEGER..finishing_integer).to_a.each { |num| sum += num }
  sum
end

def product_of_consecutive_integers(finishing_integer)
  product = 1
  (STARTING_INTEGER..finishing_integer).to_a.each { |num| product *= num }
  product
end

puts sum_of_consecutive_integers(5)
puts product_of_consecutive_integers(6)
