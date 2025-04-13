# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

def prompt(message)
  puts "==> #{message}"
end

def print_result(array, number)
  if array.include?(number)
    puts "The number #{number} appears in #{array}."
  else
    puts "The number #{number} does not appear in #{array}."
  end
end

number_array = []

prompt("Enter the 1st number:")
integer_1 = gets.chomp.to_i

prompt("Enter the 2nd number:")
integer_2 = gets.chomp.to_i

prompt("Enter the 3rd number:")
integer_3 = gets.chomp.to_i

prompt("Enter the 4th number:")
integer_4 = gets.chomp.to_i

prompt("Enter the 5th number:")
integer_5 = gets.chomp.to_i

prompt("Enter the last number:")
integer_6 = gets.chomp.to_i

number_array.push(integer_1, integer_2, integer_3, integer_4, integer_5)

print_result(number_array, integer_6)