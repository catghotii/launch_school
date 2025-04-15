# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

# Example

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

def addition(first, second)
  first + second
end

def subtraction(first, second)
  first - second
end

def product(first, second)
  first * second
end

def quotient(first, second)
  first.to_f.divmod(second)[0]
end

def power(first, second)
  first ** second
end

first = 23
second = 17

puts "#{first} + #{second} = #{addition(first, second)}"
puts "#{first} - #{second} = #{subtraction(first, second)}"
puts "#{first} * #{second} = #{product(first, second)}"
puts "#{first} % #{second} = #{quotient(first, second)}"
puts "#{first} ** #{second} = #{power(first, second)}"
