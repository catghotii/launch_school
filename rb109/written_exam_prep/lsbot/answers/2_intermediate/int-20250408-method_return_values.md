Question 4: Method Return Values (Intermediate)
What will the following code output and why? Explain the concept being demonstrated.

```ruby
def add_numbers(num1, num2)
  num1 + num2
  puts "Numbers added!"
end

result = add_numbers(5, 6)
puts result
```

On line 6, the variable `result` is initialised to reference the return value of the method invocation of `add_numbers` with two arguments of integer objects `5` and `6`. Inside the method, the integer values are initialised to the local variables `num1` and `num2` respectively, and these integers are added together. The last expression in the `add_numbers` method definition is `puts "Numbers added!"`, which outputs this string to the console, and returns `nil` since the printing method `puts` always returns `nil`. As this operation is the last evaluated result during execution of the method, it is also the same result as the method return value; this means that the method return value is `nil`, which is the object that the variable `result` now references.

On line 7, the `puts result` method call will print the object that `result` contains a reference to.

The complete output for this program will be:

```
Numbers added!
# empty line, since `puts nil` does not print anything
```