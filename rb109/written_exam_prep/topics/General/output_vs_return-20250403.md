### first go, brain only!

When evaluating any expression in Ruby, it's important to consider what the expression is returning and what it might output to the console display. Some expressions will provide both an output and return value, while others may only return a value.

Remember that in Ruby, every expression is considered `true` except for `false` and `nil`.

For example, the `puts` method, when supplied with an argument, will print the argument as a string to the output, but will always return `nil`.

### Well-Grounded Rubyist

- Ruby code is made up of expressions, each of which evaluates to a particular value.
- Every method call is an expression. When you call a method, the method call evaluates to something, which is its return value. The return value is the same value of the last expression during execution of a method.
- Ruby gives you a keyword for making return values explicit: `return`. This keyword is optional but sometimes useful to make explicit what is usually implicit.

How to use the `return` keyword:
- return multiple values, which will automatically be wrapped in an array: `return a, b, c` (rather than `a, b, c` without the `return`) (you can also return multiple values in an explicit array, like `[a, b, c]` without `return`)
- if you want to return from somewhere in the middle of a method

Whether you use `return` or not, something will be returned from every method call.
A call to an empty method body returns `nil`

### LSBot

**Definition and Key Characteristics**

*Return Value:*

The value that a method gives back to the caller after completing its execution. Every Ruby method returns exactly one value, which is the evaluated result of the last expression executed within the method (unless an explicit `return` statement is used earlier).

*Output:*

The information displayed to the user through the console using methods like `puts`, `print`, or `p`. Output is a side effect of a method that shows something to the user but doesn't affect the return value.

*Key differences:*

•   Return values can be used in further operations or assigned to variables  
•   Output is only for human consumption and can't be used by the program  
•   A method always returns something (at minimum `nil`), but doesn't always produce output

**Common Use Cases***

*When to use Return Values:*

•   When you need to capture the result of a calculation for further use  
•   When building up data through a series of operations  
•   When chaining methods together  
•   When writing helper methods that provide data to other parts of your program

*When to use Output:*

•   When communicating information to the user  
•   When providing feedback about program state  
•   When debugging your code  
•   When creating a user interface

**Code Examples***

*Example 1: Return vs Output Basics*

```ruby
def calculate_total(num1, num2)
  puts "Calculating the sum of #{num1} and #{num2}..."  # Output: displays text
  num1 + num2  # Return: the last evaluated expression is returned
end

result = calculate_total(5, 3)
puts "The result is: #{result}"

# Output when run:
# Calculating the sum of 5 and 3...
# The result is: 8

```

**Example 2: Methods with Different Return/Output Behaviors**

```ruby
# Method that only returns a value (no output)
def add(a, b)
  a + b  # Returns the sum, no output
end

# Method that only produces output (returns nil)
def display_message(message)
  puts message  # Outputs message, returns nil
end

# Using the return value
sum = add(10, 20)  # sum = 30
display_message("The sum is #{sum}")  # Outputs "The sum is 30", returns nil

# This won't work as expected because display_message returns nil
doubled_sum = add(sum, display_message("Doubling..."))  
# Output: "Doubling..."
# doubled_sum will be 30 + nil, which raises a TypeError
```

**Common Pitfalls and Misconceptions**

1.  ​**Forgetting that** `puts` **returns** `nil`​:

```ruby
   def total(num1, num2)
     puts num1 + num2  # This outputs the sum but returns nil
   end
   
   result = total(5, 5)
   result * 2  # Error: nil can't be multiplied
```

2.  ​**Confusing method return with displayed output**​:

```ruby
   def greet(name)
     puts "Hello, #{name}!"
   end
   
   greeting = greet("Ruby")
   # Output: "Hello, Ruby!"
   # But greeting = nil
```

3.  **Methods that both return and output**​:

   According to Ruby coding conventions, it's generally better for a method to either return a meaningful value or produce output, but not both. As noted in the [Coding Tips assignment](https://launchschool.com/lessons/8a39abff/assignments/4806e825), methods should "not both display output and return a meaningful value."
   
   4.  ​**Naming methods that output**​: 
   
   To improve code clarity, consider prefixing methods that primarily output values with terms like `print_`, `say_`, or `display_` to make their purpose obvious, as suggested in the Launch School materials.
   
   Remember that return values are for program logic, while output is for human interaction. Keeping them separate makes your code clearer and easier to maintain.

### second go, open-book

In Ruby, a method will always return a value but it may not necessarily have an ouput.

Ruby code is made up of expressions, each of which evaluate to a particular value. A method call is an expression, which evaluates to its return value. The return value is the evaluated result of the last expression during execution of a method. Typically this will be the last line in the method body, unless an explicit `return` keyword is used prior or in the middle of the method body (in such cases, the return value would be the evaluated expression following this explicit `return`). The `return` keyword is not required if the intended return value is the last evaluated line in the method, as it will implicitly return that value. If a method definition is empty, the return value is `nil`.

Output, on the other hand, is what is displayed to the console using printing methods like `puts`, `print` or `p`. Output is used for human interaction, whereas the program does not use output for any programming logic. When used in methods, output is considered a side effect and not a meaningful value; the return value of `puts` is nil. So if the last line in a method has the method call `puts`, this method evaluates to `nil`, and therefore the method's return value would be `nil`.

The key differences between output and return in methods:
- Return values can be used in further operations or assigned to variables in the program
- Output displays something to the user, while the program can't use the output
- A method will always return something (at minimum `nil`), while it may not necessarily have an output

In practice, it's advised that methods should focus on either returning a meaningful value, which could be used further in the program in other operations or variable assignments, or displaying output to the console, but not both (methods that produce output can be denoted in the method name with prefixes such "display" or "print" for easy identification of a method's purpose).