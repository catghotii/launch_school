Question 1: Variable Scope (Basic)

What will the following code output? Explain why.

```ruby
a = 7

def my_method
  a = 5
  puts a
end

my_method
puts a
```

Method definitions create a self-contained scope: variables initialised outside of the method cannot be accessed inside the method (unless they are passed in as arguments), and variables initialised within the method cannot be accessed by outer code.

On line 1, in the outer scope, the variable `a` is initialised with a reference to integer `7`.

On line 8, `my_method` is called. Inside the method definition, a local variable with the same name `a` is initialised with a reference to integer `5`. Although this variable has the same name as the variable in the outer scope, it has no affect on the outer variable due to variable scoping rules of method definitions. `a = 5` is an initialisation, not a reassignment operation. `puts a` within the method body outputs `5`, which is the only variable with the name `a` available to the `puts` method call in the method's scope.

Meanwhile, the last expression of the code `puts a` outputs the value of the variable `a` that was initialised on line 1 in the outer scope.

The output is:

```
5
7
```