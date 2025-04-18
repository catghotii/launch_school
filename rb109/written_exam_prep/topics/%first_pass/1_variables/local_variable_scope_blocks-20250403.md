### first go, brain only

Local variable scope refers to where a variable can be accessed or modified. A block is a piece of code following a method invocation. It creates a new scope, and this scope has the following key rules: variables initialised inside of a block (in the inner scope of a block) cannot be accessed by the outer scope, while variables initialised in the outer scope can be accessed by the block. Blocks can also reassign variables from the outer scope.

Unlike method definitions, where local variables are scoped only to the method definition (i.e. local variables initialised within the method definition cannot be accessed or modified by the outer scope, unless they are passed in as arguments), blocks have access to variables in the outer scope, but not vice versa.

In nested blocks, the innermost block can access variables initialised outside of its scope (i.e. from the main scope as well as the first level scope), while the first level scope cannot access variables initialised in the second-level scope (the nested block) although it can also access variables in the outermost scope. The outermost scope would not be able to access variables in either blocks.

In peer blocks, the scope of each block has access to the outer scope, but not to its peer block's scope.

Another concept to look out for is variable shadowing, which occurs when a block's parameter has the same name as a variable initialised in the outer scope: the block's parameter "shadows" the outer scope, preventing it to be accessed from within the block.

### LSBot explainer

**Local Variable Scope in Relation to Blocks**

**Definition and Key Characteristics**

Local variable scope in Ruby refers to where in your code a variable can be accessed or modified. When working with blocks, the scope follows these key rules:

1.  ​*Inner scope can access outer scope*: Variables initialized in an outer scope are accessible within blocks (inner scope). 
2.  ​*Outer scope cannot access inner scope*​: Variables initialized inside a block cannot be accessed outside that block. 
3.  ​*Block creates a new scope​:* Each block following a method invocation (like `loop`, `times`, `each`) creates a new inner scope. 
4.  ​*Variable reassignment​*: Blocks can reassign variables from the outer scope.

**Common Use Cases**

•   ​**Data transformation**​: Using variables from outer scope while iterating with blocks to transform collections  
•   ​**Accumulating values**​: Initializing a variable in outer scope and modifying it within blocks  
•   ​**Temporary variables**​: Creating variables within blocks that only exist for specific operations

**Code Examples**

**Example 1: Basic Block Scope**

```ruby
name = "Sarah"  # outer scope variable

3.times do |i|
  puts "#{i}: Hello, #{name}"  # can access outer scope variable
  age = 25  # initialized in inner scope
end

puts name  # => "Sarah" (accessible)
puts age   # => NameError (not accessible outside the block)
```

**Example 2: Nested Blocks and Variable Scope**

```ruby
total = 0  # first level variable

[1, 2, 3].each do |num|  # second level
  total += num  # accessing first level variable
  
  5.times do |i|  # third level (nested block)
    puts "Number: #{num}, Index: #{i}, Total: #{total}"
    # can access both first and second level variables
    counter = i * num  # third level variable
  end
  
  # puts counter  # Would raise NameError - counter is not visible here
end

puts total  # => 6 (accessible)
```

**Example 3: Peer Blocks**

```ruby
greeting = "Hello"

2.times do
  person = "Alice"
  puts "#{greeting}, #{person}"  # Both variables accessible
end

loop do
  # person is not accessible here (peer block)
  new_person = "Bob"
  puts "#{greeting}, #{new_person}"  # greeting is accessible
  break
end

puts greeting  # => "Hello" (accessible)
puts new_person  # => NameError (not accessible)
```

**Common Pitfalls and Misconceptions**

1.  ​**Assuming variables are globally accessible**​: Many beginners incorrectly assume that variables initialized in inner scopes will be available everywhere.
2.  ​**Variable shadowing**​: When a block parameter has the same name as an outer scope variable, it "shadows" the outer variable, preventing access to it within the block:

```ruby
   value = 10
   [1, 2, 3].each do |value|  # block parameter shadows outer 'value'
     puts value  # prints 1, 2, 3 (block parameter)
                 # outer 'value' is not accessible here
   end
```

3. **Confusing block scope with method scope**​: Unlike blocks, method definitions create their own scope that cannot access variables from outside unless passed as arguments:
  
```ruby
name = "Ruby"  

def print_name  
  puts name  # This will raise an error  
end  

# Blocks can access outer variables  
5.times do  
  puts name  # This works fine  
end  
```

Understanding variable scope within blocks is crucial for writing clean, bug-free Ruby code. It helps you manage data flow and prevent unintended side effects in your programs.

### second go, half-brained

Local variable scope refers to where a variable can be accessed or modified. There are different rules for local variable scope relating to blocks.

Unlike method definitions, where the scope is self-contained (i.e. local variables initialised within the method definition cannot be accessed by outer code, nor can variables initialised in the outer code be accessed by a method unless they are passed as arguments), a method invocation with a block creates a new scope with the following rules: the inner scope of a block can access and modify variables initialised in the outer scope (including reassignment of these outer scoped variables), while the outer scope cannot access and modify local variables initialised within the block.

An example of a method invocation with a block's scope:

```ruby
name = 'Ruby'
number = 1

5.times do |iterator|
  multiplier = (iterator += number) # inner scope has access to outer variables
  puts "#{multiplier} #{name * multiplier}"
end

puts multiplier # NameError - outer scope does not have access to inner scope
```

```
1 Ruby
2 RubyRuby
3 RubyRubyRuby
4 RubyRubyRubyRuby
5 RubyRubyRubyRubyRuby
```

In nested blocks, the innermost block has access to variables initialised in top level scopes (outermost scope and the scope above it); the first block has access to variables in the outer scope but not from the nested block; and the outer scope does not have access to either of the blocks' local variables.

An example of scoping rules in nested blocks:

```ruby
array = [1, 2, 3]
same_as_number = 0
outer_message = "available here!"

array.each do |number|
  same_as_number += 1 # block can access outer scope
  kept_from_outer = "outer code cannot access this"

  3.times do |i|
    puts "Number: #{number}, Index: #{i}, Same as Number: #{same_as_number}" # innermost scope can access variables from outer scope
    puts outer_message # outermost scope variables accessible from nested block
  secret_variable = "I'm a secret"
  end
  
  # puts secret_variable # NameError - block cannot access nested scope
end

# puts kept_from_outer # NameError - outer scope cannot access inner scope
```

```output
Number: 1, Index: 0, Same as Number: 1
available here!
Number: 1, Index: 1, Same as Number: 1
available here!
Number: 1, Index: 2, Same as Number: 1
available here!
at the end of each method execution: available here!
Number: 2, Index: 0, Same as Number: 2
available here!
Number: 2, Index: 1, Same as Number: 2
available here!
Number: 2, Index: 2, Same as Number: 2
available here!
at the end of each method execution: available here!
Number: 3, Index: 0, Same as Number: 3
available here!
Number: 3, Index: 1, Same as Number: 3
available here!
Number: 3, Index: 2, Same as Number: 3
available here!
at the end of each method execution: available here!
[Finished in 167ms]
```

In peer blocks, each block has access to variables from the outer scope, but not to variables initialised within the respective blocks. Each scope has local variables scoped to its own block - the outer scope cannot access them, nor can its peer blocks.

```ruby
name = 'Ruby'

2.times do |i|
  greeting = "Hello"
  puts greeting + name # outer scope accessible here
  # puts greeting + new_name # NameError - peer scope not available
end

loop do
  new_name = 'Rob'
  # puts greeting + new_name # NameError - peer scope not available
  break
end
```

Variable shadowing occurs when a block's parameter has the same name as a variable initialised outside of the block, and prevents access to the this outer variable from within the block.

```ruby
value = 10
array = [1, 2, 3]

array.each do |value|
  puts value # block parameter, not outer scope variable with the same name
end

# output will be:
# 1
# 2
# 3
```