### 1. Basic: What is the difference between puts and return in Ruby? Provide an example that demonstrates this difference.

Every expression in Ruby evaluates to something and returns a value, although they do not necessarily have an output.

A method call is an expression, and therefore has a return value. The return value of a method is the evaluated result of the last expression during execution of a method, unless there is an explicit `return` keyword used prior to the last line in the method. An empty method would return `nil`. Return values are meaningful values insofar as they can be used in further operations or variable assignments.

Output is used for human consumption; the program does not use output. Output is displayed to the console using printing methods like `puts`, `print` and `p`. The `puts` method, in particular, will print a string to the console (this is the output) followed by a newline, and returns `nil`.

Here's an example:

```ruby
def display_string(string)
  puts string
end

display_string("Hello")
p display_string("Hello")
```

### Code explanation:

On line 5, the `display_string` method is called and passed a string object "Hello" as an argument. The local variable `string` is initialised to the string object `"Hello"`. In the method definition, the `puts` method is called and passed this string object as an argument, printing it to the console. The return value of this method is the evaluated result of the last (and only) expression in the method body; as `puts` always returns `nil`, the return value is `nil`. This is not printed to the console.


To demonstrate that the return value was indeed `nil`, the last line of code in the program is `p display_string("Hello")`. What happens when this line is executed, is that the `p` method prints its argument to the console. In this case, the value of the argument is the same value as the return value of the method, `nil`. When this line is evaluated, it executes the `display_method` method, which has a side effect of printing the string object "Hello", and then also prints the argument, which is the return value of the method -- this is why the console also prints and makes visible `nil`

The output for this code is:

```
Hello
Hello
nil
```

---

### LSBot alternative code example and walkthrough

Here's another example that clearly illustrates the difference between puts and return values in Ruby:

def calculate_and_display(num1, num2)
  sum = num1 + num2
  puts "The sum of #{num1} and #{num2} is #{sum}."
  sum * 2
end

result = calculate_and_display(5, 3)
puts "The returned value is: #{result}"

If you run this code, you'll see:
The sum of 5 and 3 is 8.
The returned value is: 16

Let's walk through what's happening:

1.  We define a method calculate_and_display that takes two parameters.
2.  Inside the method, we calculate the sum and use puts to display a message (this is output).
3.  The last line of the method (sum * 2) becomes the return value, even though we don't use the return keyword explicitly.
4.  When we call the method and assign its return value to result, we capture the value 16 (which is 8 * 2).
5.  We then output this return value with another puts statement.

This example demonstrates several important Ruby concepts:

•   A method can both output information (with puts) and return a value
•   The return value is determined by the last evaluated expression in the method
•   The puts statement outputs to the console but doesn't affect the return value
•   Return values can be captured and used elsewhere in your program

This illustrates what's discussed in the "Coding Tips" assignment where it mentions that methods should generally either return a meaningful value OR have side effects like displaying output, but ideally not both for cleaner code organization. As noted in the Launch School materials, "Methods should not both display output and return a meaningful value." (https://launchschool.com/lessons/8a39abff/assignments/4806e825)