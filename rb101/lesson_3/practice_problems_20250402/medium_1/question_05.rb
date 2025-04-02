=begin

Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

How would you fix this so that it works?

=end

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# Answer

# The limit variable is not defined in the method definition. Ben might have assumed that the fib method has access to variables throughout the program, however this is not a correct assumption: method definitions have a self-contained scope, which variables initialised in the outer scope cannot be accessed from within the method definition.

# Running the original code results in an error that says there is an undefined local variable `limit` in the first line of the method definition. To fix this, a third parameter must be added to the method definition name so that the `limit` variable is defined in the method body.

# The penultimate line also needs to be changed to include a third argument that is passed into the method, otherwise an error message will occur which displays that there are not enough arguments given.


# LS solution

# Ben defines limit before he calls fib. But limit is not visible in the scope of fib because fib is a method and does not have access to any local variables outside of its scope.

# You can make limit an additional argument to the definition of the fib method and pass it in when you call fib.
