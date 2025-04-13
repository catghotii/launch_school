# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

# Example:

# square(5) == 25
# square(-8) == 64

def multiply(first, second)
  first * second
end

def square(number)
  number * number
end

p square(5) == 25
p square(-8) == 64