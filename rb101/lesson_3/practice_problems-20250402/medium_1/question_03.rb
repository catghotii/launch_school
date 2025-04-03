=begin

Question 3

Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you make this work without using the begin/end until construct? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

=end

# The meaning of the term ‘factor’ in math can be explained as a number that divides the given number exactly with 0 remainder.

def factors(number)
  divisor = number
  factors = []
  until divisor == 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

puts factors(10)

=begin

Bonus 1

What is the purpose of the number % divisor == 0 ?

Answer:
This expression is in a conditional if clause which tells the program to perform an action (`<< number / divisor`) to the `factors` array.
If the expression evaluates to Boolean true, the action is performed; otherwise, if the expression evaluates to false, the program will loop to the next iteration of the until loop.

LS:
Allows you to determine if the result of the division is an integer number (no remainder).

Bonus 2

What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?

Answer:
All Ruby methods will return the value of the last line in a method definition unless a `return` keyword is used prior to the last line; without this line, the return value of the method would be nil.
therefore the purpose of this line is to return the Array object referenced by the factors variable.

LS:
The purpose of line 8 is to make factors the return value of the method. Recall that without an explicit return statement in the code, the return value of the method is the last statement executed. If we omitted this line, the code would execute, but the return value of the method would be nil.

=end