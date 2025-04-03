# 2. Intermediate: Examine the following code and explain what happens on each line and the return value of the example method:

def example(str)
 i = 3
 loop do
   str = str.upcase
   i -= 1
   break if i == 0
 end
 str + "!"
end

result = example("hello")
puts result

=begin

On line 11, the variable `result` is initialised to the return value of `example("hello")`. The `example` method called and passed the string object "hello" as an argument.

Inside the method definition, the `str` local variable is initialised with the reference of the string object "hello" that was passed in as an argument.

A local variable `i` is initialised to the integer 3, and then a `loop` method is called with a block, which will loop execution of the code of the block until a `break` keyword is executed. Inside the block, during on the first iteration, the `str` variable is reassigned with a new string object which is the evaluated result of the non-mutating `upcase` method called on the string "hello": `str` is reassigned to point to a new string object "HELLO". During subsequent iterations, calling `upcase` on `"HELLO"` effectively has no change. The local variable `i` is decremented by 1 during each iteration of the loop. On the next line, there is a conditional if statement that will tell the program to break out of the loop only when `i == 0` evaluates as true.

Once this condition is met, and the `break` keyword is executed, execution resumes to the last expression of the method body, a string concatenation operation: `str + "!"`. The evaluated result of this expression is the implicit return value of the method; for this particular example, `str` points to the string "HELLO" which is concatenated with the string "!", so the return result is the string "HELLO!". This return value is the string object to which the variable `result` is a reference.

The `puts` method call is passed a reference to the string object that `result` references, so the output will display:

HELLO!

=end