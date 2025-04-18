### first go, brain only

2025-04-03 12:07:00

```ruby
def some_method(param = 'default string')
  param
end
```

The list of variables following the name in a method definition are its formal parameters. These parameters assign local variables to references that are passed in as corresponding arguments.

This example method returns the value of the `param` local variable scoped to the method.

This example method can be called like so:

```ruby
some_method # without an argument
some_method("argument") # with an argument
```

If no argument is given when the method is called, a default parameters comes to the rescue: it will use the default parameter's value within the method body.

There's a typical case where Ruby will throw an error if a method definition requires one argument (is defined with a parameter without a default value supplied) and that method is called without an argument to pass. To handle this case, default parameters can be used.

So in the above code, the first method call without an argument will use the default value, which in this case is a string value of `"default string"`. The return value of this method is the object referenced by the local variable `param`, in this case, that default string!

The second method call, which has been supplied a string value as an argument, will pass this value to the method, and the return value of the method is the object assigned to the `param` local variable. The method will return `"argument"`.

#### LSbot feedback

Your explanation of default parameters is mostly accurate and well-articulated! Let me provide feedback on specific points:Your definition of formal parameters is correct - they are indeed the variables listed after the method name in a method definition.

You correctly explained that:

•   When no argument is provided, the default value is used  
•   The method returns the value assigned to the `param` variable  
•   Default parameters help avoid errors when methods are called without required arguments

One additional clarification I would make is about the reference assignment. When you say "These parameters assign references that are passed in as corresponding arguments to local variables within the method," you're correct about the reference passing behavior in Ruby. 

This is an important concept that relates to the variable scope in Ruby methods, as covered in [RB101 - Variable Scope](https://launchschool.com/lessons/8a39abff/assignments/e3cd8bb9).

I'd also emphasize that when Ruby evaluates the method call, it first checks if an argument was provided. If not, it evaluates the default expression and uses that value. This is why you can have more complex expressions as default values, not just simple literals.

Your explanation of the two method calls and their respective return values is accurate. In the first case, `"default string"` is returned, and in the second case, `"argument"` is returned.

To strengthen your understanding, you might want to explore some slightly more complex examples from [RB101 - Practice Problems: Medium 1](https://launchschool.com/lessons/375f14dd/assignments/5f8d4896), such as:
  
```ruby
def foo(param = "no")  
  "yes"  
end  
  
def bar(param = "no")  
  param == "no" ? "yes" : "no"  
end  
  
bar(foo)  # returns "no"  
```

This demonstrates how methods with default parameters can interact when one is used as an argument to another.Overall, you have a solid understanding of how default parameters work in Ruby!

### medium 1 - question 9

```ruby
# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the return value of the following method invocation?

bar(foo)

# The return value would be "no".

# The method invocation takes the return value of the `foo` method without any arguments. In Ruby, default parameter values are used only when arguments are not passed to the method. 

# When no argument is passed to the `foo` method, a default parameter has been defined to equal to the the string value "no", however the method returns the string value "yes". This string is passed as an argument to the `bar` method.

# The `bar` method definition is declared with a default parameter, which isn't used since the method invocation of `foo` is passed an argument. The ternary operator inside the `bar` method definition evaluates whether the `param` variable is equal to the string "no". In this case, the `param` variable receives a reference to the string value "yes"; the ternary expression is evaluated as false, returning the string "no", which is the return value of the `bar(foo)` method invocation.

# LS:

# This is because the value returned from the foo method will always be "yes" , and "yes" == "no" will be false.
```

### LSBOT!

[@Cat B](https://launchschool.slack.com/team/U06ETSPCRCH) asks: Please explain the concept of methods - default parameters. Include:  
• A clear, practical definition with key characteristics  
• Common use cases and scenarios where it's valuable  
• 2-3 concrete code examples demonstrating its application  
• Common pitfalls or misconceptions to avoid

**Default Parameters in Ruby Methods

****Definition and Key Characteristics**

Default parameters allow you to define methods with arguments that have preset values. If the caller doesn't provide a value for that parameter when invoking the method, Ruby will use the default value instead.

Key characteristics:

•   They provide fallback values for method parameters  
•   They make methods more flexible by allowing optional arguments  
•   Default values are defined in the method definition with the syntax `parameter_name = default_value`  
•   They're evaluated at the time the method is called, not when it's defined

**Common Use Cases**
Default parameters are valuable in several scenarios:
1.  When a parameter is optional but still needs a sensible value  
2.  For configuration options where most users need standard settings  
3.  When creating methods that should work with minimal input but can be customized  
4.  For backward compatibility when adding new parameters to existing methods

**Code Examples***

Example 1: A greeting method with a default name
  
```ruby
def greeting(name = "friend")  
  puts "Hello, #{name}!"  
end  
  
greeting("Sarah")  # => Hello, Sarah!  
greeting           # => Hello, friend!  
```

Example 2: A calculator method with configurable precision
  
```ruby
def calculate_interest(principal, rate, years = 1, compound = false)  
  if compound  
    principal * (1 + rate) ** years  
  else  
    principal + (principal * rate * years)  
  end  
end  
  
calculate_interest(1000, 0.05)       # => 1050.0 (simple interest for 1 year)  
calculate_interest(1000, 0.05, 3)    # => 1150.0 (simple interest for 3 years)  
calculate_interest(1000, 0.05, 3, true) # => 1157.625 (compound interest for 3 years) 

```

**Common Pitfalls and Misconceptions**

1.  ​**Order matters**​: Parameters with default values must come after parameters without defaults:
  
```ruby
   # Incorrect  
   def incorrect(name = "friend", age)  
     puts "#{name} is #{age} years old."  
   end  
     
   # Correct  
   def correct(age, name = "friend")  
     puts "#{name} is #{age} years old."  
   end  
```

2.  ​**Default values are evaluated at method invocation**​: If you use mutable objects as default values, be careful about unintended modifications:

```ruby  
  
   def add_to_list(item, list = [])  
     list << item  
     list  
   end  
     
   add_to_list("apple")  # => ["apple"]  
   add_to_list("banana") # => ["banana"] (not ["apple", "banana"])  

   ```

3.  ​**Nil is a valid argument**​: Passing `nil` explicitly will override the default value:

```ruby
   def greet(name = "friend")  
     puts "Hello, #{name}!"  
   end  
     
   greet(nil) # => Hello, ! (not "Hello, friend!")  
```

Default parameters are an important tool for making your code both more flexible and easier to use, striking a balance between simplicity and configurability.

### again, open book

Definition:
- Default parameters allow for defining methods with arguments that have preset values.
- If a method call is given no value for that parameter, then Ruby will use the default value instead.

Other useful points:
- Parameters in a method definition are local variables initialised to/with references to objects when a method is called.

Parameters in method definitions are local variables initialised to references to objects when a method is called. Default parameters allow methods with arguments to have preset, or default, values. In cases when invoking a method without any supplied corresponding arguments to the parameters, Ruby will use the default values instead.

Key characteristics:
- provide fallback values for method parameters
- allow for flexibility of methods by allowing optional arguments
- syntax: they are defined in the method definition with `param_name = default_value`; they are always the last parameter
- they are evaluated when a method is called, not when it's defined

Simple example: default name

```ruby
def greeting(name = "friend")
  "Hello, #{name}!"
end

greeting
```

On line 5, the `greeting` method is called without any supplied arguments.

On lines 1-3, the `greeting` method definition is defined, which has a default paramter `name = "friend"`. Inside the method is a string interpolation which contains the local variable `name`.

When this method is called without passing any arguments to to the method, Ruby uses the default value supplied by the default parameter - in this case, the string `"friend"`. Thus, the method will return the string that is interpolated with the default value: `"Hello, friend!"`

If an argument was passed to the method when it is called, then the local variable `name` would be initialised with a reference to that argument's value instead.

*LSBot feedback*:
excellent etc

One minor clarification: in Ruby, when a method implicitly returns a value (as this one does), it's returning the last evaluated expression. In this case, that's the string `"Hello, #{name}!"` after interpolation occurs.

*modifications:*

When this method is called without passing any arguments to to the method, Ruby uses the default value supplied by the default parameter - in this case, the string `"friend"`. The only operation in the method body is a string interpolation which contains the local variable `name`, so this evaluates to the string `"Hello, friend!"`. The method return value is this string following the string interpolation, i.e. calling `greeting` without any arguments will return `"Hello, friend!"`

Common pitfalls
- parameter order matters! default parameters are the last parameter in the method definition
- default parameters are evaluated at method invocation, not when a method is defined
- `nil` is a valid argument, which overrides the default parameter value

### second go, brain only!

Default parameters allow methods to be defined with arguments with preset values. If a caller is not supplied any arguments when a method is called, Ruby will use the default parameter values instead. (Parameters are a list of variables following the method name in a method definition, using the following syntax: `default_parameter = default_value`; parameters are local variables that are initialised to references to objects when a method is called.)

- Default parameters are evaluated when a method is called, not when a method is defined.
- if `nil` is passed as an argument, it will override the default value
- the order of parameters matters! Default parameters are always the last parameter in a method definition