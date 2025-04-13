### LSBot Explainer

**Method Definition vs. Method Invocation in Ruby**

**Definitions and Key Characteristics**

**Method Definition**​ is when you create a method using the `def` keyword in Ruby. This establishes what the method does, what parameters it accepts, and what value it returns.

```
def greeting
  puts "Hello"
end
```

**Method Invocation**​ is when you call or execute a method that has been defined, either from Ruby's core library or one you've created yourself.

```
greeting  # This invokes the greeting method
```

The key difference is that definition sets up the method's behavior, while invocation actually runs that behavior.

**Common Use Cases**

1.  ​**Code Organization**​: Methods help organize code into logical, reusable units  
2.  ​**DRY Principle**​: Define a method once and invoke it multiple times from different parts of your program  
3.  ​**Abstraction**​: Hide complex implementation details behind a simple method name  
4.  ​**API Design**​: Create a clear interface for how other parts of your program can interact with certain functionality

**Code Examples**

**Example 1: Method parameters and arguments**

```ruby
# Method definition with a parameter
def greetings(name)
  puts "Hello, #{name}!"
end

# Method invocation with an argument
greetings("Ruby")  # Outputs: Hello, Ruby!

person = "World"
greetings(person)  # Outputs: Hello, World!
```

**Example 2: Method invocation with a block**

```ruby
# Defining a method that uses a block
def execute_block
  puts "Before block"
  yield if block_given?  # Executes the block if one is provided
  puts "After block"
end

# Invoking the method with a block
execute_block do
  puts "Inside the block"
end

# Outputs:
# Before block
# Inside the block
# After block`
```

**Common Pitfalls and Misconceptions**

1/ **Confusing variable scope**​:  
    •   Methods cannot directly access local variables initialized outside the method  
    •   Blocks CAN access local variables initialized outside the block<!---->

```ruby
name = "Alice"

def print_name
  puts name  # Error! 'name' is not accessible here
end

# But blocks CAN access outside variables
[1, 2, 3].each do |num|
  puts "#{name} counts #{num}"  # Works! 'name' is accessible here
end
```

2/ **Misunderstanding method parameters vs. arguments**​: 
    •   Parameters are the variables listed in the method definition 
    •   Arguments are the actual values passed to the method during invocation

3/ **Forgetting that blocks are part of method invocation**​:  
    •   A block is essentially an argument to the method  
    •   Whether the block executes depends on how the method is defined

As noted in the "More Variable Scope" assignment, "a block is ​_part of_​ the method invocation.

In fact, ​_method invocation_​ followed by curly braces or `do..end` is the way in which we ​_define_​ a block in Ruby" ([More Variable Scope assignment](https://launchschool.com/lessons/8a39abff/assignments/1be6d04d))


### My summary

Method definition is when a method is created using the `def` keyword. Method definitions establish what a method does, what parameters it accepts, and what it returns (i.e. sets up a method's behaviour)

Method invocation is when a method is called and executed (i.e. runs the method's behaviour). Methods can be built into Ruby or user-defined.

```ruby
def greeting(name) # method definition with one parameter
  "Hello #{name}"
end

greeting("Ruby") # method invocation with one argument
```