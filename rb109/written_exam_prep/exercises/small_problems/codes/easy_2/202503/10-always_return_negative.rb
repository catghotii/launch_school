# Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

# All test cases should return true

def negative(number)
  if number > 0
    number / -1
  else
    number
  end
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0      # There's no such thing as -0 in Ruby

#ternary operator

def negative_2(number)
  number > 0 ? (number / -1) : number
end


puts negative_2(5) == -5
puts negative_2(-3) == -3
puts negative_2(0) == 0      # There's no such thing as -0 in Ruby

# LS solution

def negative_ls(number)
  number > 0 ? -number : number
end

=begin

Further Exploration

There is an even shorter way to write this but it isn't as immediately intuitive.

def negative(number)
  -number.abs
end

This works by flipping the problem on the head. It straightaway converts it to a positive number with Numeric#abs and then prepends it with a negative operator to make it negative. abs returns the absolute value of a number (the non-negative value of a number without regard to its sign).

Thus, instead of operating by checking the value and proceeding based on the evaluation, the opposite can be applied by stripping it of its sign, then giving it the negative sign.

This is clearly shorter. However is it superior?

=end