### LSBot Explainer

**Parameters vs. Arguments in Ruby**

**Definition and Key Characteristics**

**Parameters**​ are the variables listed in a method definition that specify what inputs the method expects to receive. They act as placeholders that will be filled when the method is called.

**Arguments**​ are the actual values passed to a method when it is invoked or called. These values are assigned to the parameters defined in the method.

Key characteristics:

•   Parameters belong to method definitions  
•   Arguments belong to method invocations  
•   Parameters define what a method can accept  
•   Arguments provide the actual data to work with

**Common Use Cases and Scenarios**
1.  ​**Data transformation**​: When you need to perform operations on different values using the same logic  
2.  ​**Customizable behavior**​: When you want a method to behave differently based on input  
3.  ​**API design**​: Creating flexible methods that can be used in various contexts  
4.  ​**Default behaviors**​: Setting default parameter values for optional arguments

**Code Examples**

**Example 1: Basic parameters and arguments**

```ruby
# Method definition with two parameters: name and age
def greet(name, age)
  puts "Hello, #{name}! You are #{age} years old."
end

# Method invocation with two arguments: "John" and 25
greet("John", 25)
# => Hello, John! You are 25 years old.

# Different arguments, same method
greet("Sarah", 30)
# => Hello, Sarah! You are 30 years old.
```

**Example 2: Default parameters**

```ruby
# Method definition with default parameter values
def calculate_total(price, tax_rate = 0.08)
  price + (price * tax_rate)
end

# Method invocation with only required argument
total1 = calculate_total(100)
puts total1  # => 108.0

# Method invocation with both arguments
total2 = calculate_total(100, 0.10)
puts total2  # => 110.0
```

**Example 3: Arguments not matching parameters**

```ruby
def introduce(first_name, last_name)
  puts "My name is #{first_name} #{last_name}."
end

# Correct number of arguments
introduce("John", "Smith")  # => My name is John Smith.

# Too few arguments
begin
  introduce("John")
rescue ArgumentError => e
  puts e.message  # => wrong number of arguments (given 1, expected 2)
end

# Too many arguments
begin
  introduce("John", "Smith", "Mr.")
rescue ArgumentError => e
  puts e.message  # => wrong number of arguments (given 3, expected 2)
end
```

**Common Pitfalls and Misconceptions**

1/ **Confusing parameters and arguments**​: Remember that parameters are in method definitions, while arguments are in method invocations.

2/ **Wrong number of arguments**​: As seen in Example 3, Ruby will raise an ArgumentError if the number of arguments doesn't match the expected number of parameters (unless using special parameter types like optional or keyword parameters).

3/ **Argument order matters**​: Ruby assigns arguments to parameters in the order they are given, so swapping the order can lead to unexpected results.

4/ **Thinking parameters create new local variables**​: Parameters are essentially local variables within the method's scope, but they're initialized with the values of the arguments passed to the method.

5/ **Forgetting that Ruby is pass-by-value for immutable objects and pass-by-reference for mutable objects**​: This affects how changes to parameters inside methods may or may not affect the original arguments.

When preparing for your RB109 assessment, make sure you can clearly explain these differences and demonstrate your understanding with code examples. This concept is important for understanding how methods work in Ruby.

### WGR notes

To feed input to a Ruby method, a method is called with one or more arguments.

In a method definition, you indicate the arguments by means of a list of variables in parentheses after the method name (arguments can be required or optional).

When a method is called, you provide values corresponding to these variables in your method call.

More precisely, the variables listed in the method definition are the method's formal parameters.

The values you supply to a method when you call it are the corresponding arguments.

There is a direct correspondence between the syntax of the parameter list in a method definition and the syntax of the argument list when a method is called (in a method invocation).


### My Summary

The variables listed in a method definition are the method's formal parameters. Parameters are local variables initialised with references to objects that are passed in as arguments when a method is called. In a method definition, the parameters are what the method expects to receive when it is called.

In a method invocation (or when a method is called), the values supplied/passed to the method are correspond to these parameter variables. In other words, the values passed to the method when it is called are the corresponding arguments.

There is a direct correspondence between the syntax of the parameter list in a method definition and the syntax of the argument list in a method definition.