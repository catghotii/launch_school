Question 1: Variable Scope (Basic)
Explain what the following code will output and why:

```ruby
a = 5

def my_method
  a = 3
  puts a
end

my_method
puts a
```

On line 8, the `my_method` call executes the method defined on line 3. Inside the method definition, local variable `a` is initialised to reference integer `3`, which is only accessible from within the method definition. The last expression in the method body is a `puts` method that is passed the reference to the integer object `3` as an argument, and this integer is printed to the output.

It's important to note that the variable `a` initialised with a reference to the integer `5` on line 1 is not accessible to the method definition; despite having the same variable name, it is outside of the method definition's scope and cannot be accessed.

On line 9, there's another `puts a` expression that is evaluated: this `puts` method is passed the reference to integer object `5` as an argument, to which another variable `a` was initialised in the outer scope (on line 1); this particular `a` is what is passed as an argument to the `puts` call on line 9, which is seen in the output when this expression is executed. The local variable `a` initialised in the `my_method` method is not accessible to the outer scope.

The output will be:

```
3
5
```