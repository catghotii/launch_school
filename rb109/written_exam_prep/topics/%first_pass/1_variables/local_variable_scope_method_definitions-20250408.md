### my summary, brain only

Local variable scope refers to where variables can be accessed or modified. Method definitions have a self-contained scope: outer code cannot access variables initialised within method definitions, and methods themselves cannot access variables initialised in the outer scope, unless they are passed in as arguments to the method.

examples:
- method definition accessing variables from outer scope
- modifying objects in the outer scope using mutating methods called within the method definition

```ruby
def some_method
  puts number # error - cannot access `number` variable initialised in outer code
end

number = 5
some_method # cannot access `number` variable intiialised in outer code
```

```ruby
def some_method
  number = 5
end

puts number # cannot access variable initialised within method definition
```

```ruby
def some_method(number)
  number + 1
end

integer = 5

puts some_method(integer) # pass reference to integer object 5 to method as arg
puts integer              # => 5, method does not mutate original object

puts some_method(5)
```

```ruby
def mutating_method(string)
  string.reverse! # mutating method called on reference to string object from outer code
end

word = "ruby"
puts mutating_method(word) # reference to string object passed in as argument
puts word # "ybur"; local variable initialised in outer code has been mutated
```

```ruby
def not_mutating(string)
  string.reverse # non-destructive method called on string object
end

word = "ruby"
puts not_mutating(word) # reference to string object passed in as argument to method 
puts word # original string object is not permanently modified by method
```

### LSBot explainer

**Local Variable Scope in Relation to Method Definitions**

**Definition and Key Characteristics**

Local variable scope in relation to method definitions refers to the rules that determine where variables can be accessed and modified when working with Ruby methods. The two key rules are:
1.  ​**Method definitions create their own scope**​: Variables initialized outside of a method definition cannot be directly accessed inside the method.  
2.  ​**Passing values through parameters**​: Method definitions can only access local variables that are either:  
   •   Initialized within the method itself  
   •   Passed in as arguments and assigned to parameters
   
**Common Use Cases and Scenarios**
•   ​**Encapsulation**​: Keeping variables isolated within methods prevents unexpected interactions with external code  
•   ​**Predictable behavior**​: When methods only work with their parameters and internal variables, they become more reliable  
•   ​**Reusability**​: Well-scoped methods can be used in different contexts without worrying about variable name conflicts

**Code Examples**

**Example 1: Basic scope demonstration**
  
```
a = 'hi'  
  
def some_method  
  puts a  
end  
  
some_method  # => NameError: undefined local variable or method `a' for main:Object  
```

This demonstrates that a method definition cannot access local variables initialized in the outer scope.

**Example 2: Accessing values through parameters**
  
```
def some_method(a)  
  puts a  
end  
  
some_method(5)  # => 5  
```

Here, the value `5` is passed into the method as an argument, assigned to the parameter `a`, and made available within the method body.

**Example 3: Modifying and returning values**
  
```
def add_five(number)  
  number + 5  # implicitly returned  
end  
  
original = 10  
result = add_five(original)  
  
puts original  # => 10 (unchanged)  
puts result    # => 15  
```

This shows how methods can process values without modifying the original variables in the outer scope.

**Common Pitfalls and Misconceptions**

1.  ​**Assuming outer variables are accessible**​: A common mistake is trying to use outer scope variables directly within methods.<!---->
  
```
   hello = 'hi'  
     
   def greeting  
     puts hello  # Error! 'hello' is not accessible here  
   end  
```

2.  ​**Variable shadowing**​: When a parameter has the same name as an outer scope variable, it can lead to confusion.<!---->
  
```
   n = 10  
     
   def change_value(n)  
     n = 20  
   end  
     
   change_value(n)  
   puts n  # => 10 (unchanged)  
```

3.  ​**Confusing method names and variables**​: When a method and variable share the same name, it can lead to unexpected behavior.<!---->
  
```
   hello = 'hi'  
     
   def hello  
     "Saying hello!"  
   end  
     
   puts hello  # => 'hi' (uses the variable, not the method)  
```

Understanding variable scope in relation to method definitions is crucial for writing predictable and maintainable Ruby code. It helps avoid unexpected bugs and makes your code more robust.