
### LSBot

**Definition and Key Characteristics**

A block in Ruby is a chunk of code that you can pass to a method. It's essentially a way to pass behavior as an argument to a method. The block is defined using either `do...end` syntax for multi-line blocks or `{...}` for single-line blocks.

Key characteristics:
•   Blocks are always associated with method invocation  
•   They can access variables from their surrounding scope  
•   Methods can execute blocks using the `yield` keyword  
•   Blocks can accept parameters, which are defined between pipe characters `|param1, param2|`  
•   Blocks have their own return values, which can be used by the calling method

**Common Use Cases**

1.  ​**Iterating through collections**​: Most commonly seen with methods like `each`, `map`, and `select`  
2.  ​**Custom behavior injection**​: Allowing a method to be customized at the point of invocation  
3.  ​**Resource management**​: Ensuring proper setup and cleanup (like file handling)  
4.  ​**Deferred execution**​: Code that shouldn't run immediately, but at a specific point in the method

**Code Examples**

**Example 1: Simple iteration with blocks**

```ruby
numbers = [1, 2, 3, 4, 5]

# Using a block with the each method
numbers.each do |number|
  puts number * 2
end

# Output:
# 2
# 4
# 6
# 8
# 10
```

**Example 2: Writing a custom method that uses a block**

```ruby
def my_method
  puts "Before the block"
  yield if block_given?  # Execute the block if one was provided
  puts "After the block"
end

# Calling the method with a block
my_method do
  puts "I'm inside the block!"
end

# Output:
# Before the block
# I'm inside the block!
# After the block

# Calling the method without a block
my_method
# Output:
# Before the block
# After the block
```

**Example 3: Using block return values**

```ruby
def calculate(num1, num2)
  result = yield(num1, num2) if block_given?
  puts "The result is #{result}"
end

# Using the block to define the operation
calculate(5, 3) { |a, b| a + b }  # Output: The result is 8
calculate(5, 3) { |a, b| a * b }  # Output: The result is 15
calculate(5, 3) { |a, b| a - b }  # Output: The result is 2
```

**Common Pitfalls and Misconceptions**

1.  ​**Confusing blocks with method definitions**​: A block is part of a method invocation, not part of a method definition. As explained in the [More Variable Scope](https://launchschool.com/lessons/8a39abff/assignments/1be6d04d) lesson, "a block is ​_part of_​ the method invocation."
2.  ​**Misunderstanding variable scope in blocks**​: Blocks can access variables from their surrounding scope, but methods cannot. This is a critical distinction.

```ruby
word = "Hello"

# The block can access the outer variable 'word'
[1, 2, 3].each { |num| puts word }  # Outputs "Hello" three times

def my_method
 puts word  # Error: undefined local variable or method 'word'
end
```

3. **Assuming blocks are always executed**​: Just because a block is passed to a method doesn't mean it will be executed. The method must be defined to use the block.

```ruby
def greetings  
 puts "Goodbye"  
 # No yield statement, so the block is never executed  
end  
 
word = "Hello"  
 
greetings do  
 puts word  # This block is never executed  
end  
 
# Output: Goodbye  
```

4.  ​**Forgetting that blocks have return values**​: The return value of a block is the value of the last evaluated expression in the block, which can be used by the method that called the block.

Remember that blocks are a fundamental part of Ruby and understanding how they work with variable scope is especially important as you prepare for the RB109 assessment.

### Summary

**Block**: a piece of code that can be passed to a method; associated with method invocation

Passing a block to a method is essentially passing a behaviour as an argument to a method.

- defined using `do/end` or `{}`; can accept parameters which are defined between `||`
- methods can execute blocks using the `yield` keyword
- can access variables from their surrounding scope
- have their own return values, which can be used by calling the method

**Things to remember!**

- blocks have return values: the return value of the block is the value of the last evaluated expression, and can only be used by the method that called the block
- variable scope: blocks can access variables in its surrounding scope, but methods cannot.
- a block is part of a method invocation, not a method definition.
- to use a block in a method, the block must be passed as an argument to the method, but the method must also be defined to use the block

**Code examples**

Example 1: simple iteration with blocks

```ruby
animals = ['cat', 'dog', 'pig']

animals.each { |animal| puts animal }

# cat
# dog
# pig
```

The `each` method is called on `animals` and passed a block as an argument. In each iteration of the block, the current element of the array is bound to the block parameter `animal`, and `puts animal` is executed, which outputs the string element. The block's return value is the same as the evaluated result of the last expression, which is `nil`, since `puts` always returns `nil`. The each method returns its calling object—in this case the array object `['cat', 'dog', 'pig']`.

Example 2: writing a custom method that uses a block

```ruby
def my_method
  puts "Before the block"
  yield if block_given? # execute the block if one was provided
  puts "After the block"
end

# calling with method with a block
my_method do
  puts "I'm inside the block!"
end

# calling a method without a block
my_method

# output:

# Before the block
# I'm inside the block!
# After the block
# Before the block
# After the block
```

Example 3: using block return values

```ruby
def calculate(num1, num2)
  result = yield(num1, num2) if block_given?
  puts "The result is #{result}"
end

calculate(5, 3) { |a, b| a + b }
calculate(5, 3) { |a, b| a - b }
calculate(5, 3) { |a, b| a * b }
```

Example 3: methods must be defined to use a block. just because a block is passed to a method does not mean that it will be executed!

```ruby
def greeting
  puts "Goodbye"
  # no yield statement, so block is never executed
  # yield if block_given?
end

word = "Hello"

greeting do
  puts word
end
```

