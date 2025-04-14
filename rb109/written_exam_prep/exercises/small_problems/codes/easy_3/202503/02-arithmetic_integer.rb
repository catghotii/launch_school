# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

def prompt(message)
  puts "==> #{message}"
end

def addition(a, b)
  a + b
end

def subtraction(a, b)
  a - b
end

def product(a, b)
  a * b
end

def quotient(a, b)
  a / b
end

def remainder(a, b)
  a % b
end

def power(a, b)
  a ** b
end

prompt("Enter the first number:")
first = gets.chomp.to_i

prompt("Enter the second number:")
second = gets.chomp.to_i

prompt("#{first} + #{second} = #{addition(first, second)}")
prompt("#{first} + #{second} = #{subtraction(first, second)}")
prompt("#{first} + #{second} = #{product(first, second)}")
prompt("#{first} + #{second} = #{quotient(first, second)}")
prompt("#{first} + #{second} = #{remainder(first, second)}")
prompt("#{first} + #{second} = #{power(first, second)}")

# There are some edge cases to consider in this exercise. We have to be careful of not having a second number that is zero. What if we wanted to use floats instead of integers? How does this change this problem?

# process for checking if second number is 0
# call to_f on user input
# how does this change the problem? ....?