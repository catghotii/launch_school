# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

def multiply(a, b)
  a * b
end

def square(x)
  multiply(x, x)
end

p square(5) == 25
p square(-8) == 64

# Further Exploration

# What if we wanted to generalize this method to a "power to the n" type method: cubed, to the 4th power, to the 5th, etc. How would we go about doing so while still using the multiply method?

def power(number, power)
  (multiply(number, number) / number) ** power
end

p power(3, 10)
p power(3, 11)