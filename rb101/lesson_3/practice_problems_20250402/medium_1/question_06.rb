# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# Answer:

# Inside the method definition is a reassignment operation. Integers are immutable objects, so when the Integer object is passed as an argument to the method and the reassignment operation is performed, the variable `some_number` no longer contains a reference to the original Integer object that was passed in and instead points to a new Integer object.

# The output is 34, indicating that the Integer object referenced by `answer` is not changed by the `mess_with_it` method.