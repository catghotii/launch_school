### first go, brain only

Variable shadowing occurs when a block parameter has the same name as a variable initialised in an outer scope. When this occurs, the block parameters "shadows" or hides the variable of the same name in the outer scope, preventing it from being accessed or modified by the block. Variable shadowing is typically something Ruby programmers should avoid by using distinct, descriptive variable names.

Variable shadowing only occurs with block parameters, not variables within a block that have the same name as another variable initialised outside of the block. In these cases, reassignment would occur.

Examples:

```ruby
value = 10

[1, 2, 3].each do |value|
  puts value # block parameter, not the outer scoped variable with the same name
end

# output:
# 1
# 2
# 3
```

### LSBot explainer

**Variable Shadowing in Ruby**

**Definition and Key Characteristics**

Variable shadowing occurs when a block parameter has the same name as a variable in an outer scope. When this happens, the block parameter "shadows" or hides the outer scope variable, preventing you from accessing or modifying the outer variable from within the block.

Key characteristics:
•   Only occurs with block parameters that have the same name as outer scope variables  
•   The inner block parameter takes precedence over the outer variable  
•   Prevents both reading from and writing to the outer variable within the block  
•   This is specific to how Ruby handles variable scope in blocks

**Use Cases**

Variable shadowing is generally considered a pitfall rather than a useful feature. There are very few cases where deliberate variable shadowing is considered good practice. Instead, it's important to understand it to avoid unintentional shadowing.

**Code Examples**

**Example 1: Basic Variable Shadowing**

```
n = 10

[1, 2, 3].each do |n|
  puts n
end

puts n  # => 10
```

In this example, the block parameter `n` shadows the outer variable `n`. Inside the block, `n` refers to each element of the array (1, 2, 3), not the outer variable. The outer `n` remains unchanged.

**Example 2: Attempting to Modify the Outer Variable**

```
n = 10

1.times do |n|
  n = 11
end

puts n  # => 10
```

Here, we're trying to modify `n` inside the block, but it's only changing the block parameter, not the outer variable. The outer `n` still has its original value of 10.

**Common Pitfalls and Misconceptions**

1/ **Misconception: This is just reassignment**​
    Variable shadowing is different from reassignment. When you shadow a variable, you're not modifying the outer variable at all—you're creating a completely separate variable that just happens to have the same name.

2/ **Pitfall: Unintentional shadowing**​
    The most common problem is accidentally using the same name, which prevents you from accessing the outer variable:

```
name = 'johnson'

['kim', 'joe', 'sam'].each do |name|
  # Trying to access the outer "name" here is impossible
  puts "#{name} #{name}"  # Prints "kim kim", "joe joe", "sam sam"
end
```

3/ **Misconception: All variables with the same name cause shadowing**​
    Variable shadowing only occurs with block parameters. If you create a variable inside a block (not as a parameter), it behaves differently

```
name = 'johnson'

['kim', 'joe', 'sam'].each do |person|
  # This is NOT shadowing, it's reassignment of the outer variable
  name = person
end

puts name  # => "sam" (outer variable was changed)
```

The best practice to avoid variable shadowing is to use distinct, descriptive variable names, especially for block parameters.

This makes your code clearer and prevents unexpected behavior from shadowing.

As described in the [Variable Scope assignment](https://launchschool.com/lessons/8a39abff/assignments/e3cd8bb9), "You want to avoid variable shadowing, as it's almost never what you intended to do. Choosing long and descriptive variable names is one simple way to ensure that you don't run into any of these weird scoping issues."

### block parameters

**Understanding Block Parameters and Local Variables in Blocks**Block parameters are the variables specified between the pipe characters (`|parameter|`) when defining a block. Let me explain how they work and how local variables initialize within blocks:**Block Parameters**When you create a block in Ruby, you can define parameters that represent values passed into the block when it's executed:

# ruby  
  
[1, 2, 3].each do |number|  
  puts number  
end  

In this example, `number` is the block parameter. As the `each` method iterates through the array, each element is passed to the block and becomes the value of the `number` parameter for that iteration.**Local Variables in Blocks**Block parameters are essentially local variables that are automatically initialized within the block's scope. They differ from regular local variables in how they're initialized:1.  ​**Block parameters**​ are initialized automatically when the block is called  
2.  ​**Regular local variables**​ are initialized through explicit assignment**Variable Shadowing**An important concept to understand is variable shadowing. This happens when a block parameter has the same name as a local variable that exists outside the block:

# ruby  
  
a = 5  
[1, 2, 3].each do |a|  
  puts a  
end  

In this example, the block parameter `a` shadows the outer local variable `a`. Inside the block, any reference to `a` refers to the block parameter, not the outer variable. This means you cannot access or modify the outer variable `a` from within the block.To avoid variable shadowing, simply use different names for your block parameters and outer local variables:

# ruby  
  
outer_var = 5  
[1, 2, 3].each do |inner_var|  
  puts outer_var + inner_var  # Now you can access both variables  
end  

Remember that while block parameters are scoped to the block, blocks themselves can access local variables from their surrounding scope (as long as there's no shadowing), which is different from how methods work with local variables.As explained in the [Variable Scope assignment](https://launchschool.com/lessons/8a39abff/assignments/e3cd8bb9), blocks can access local variables initialized in the outer scope, while method definitions cannot.This is an important topic for your RB109 exam, as variable scope relating to blocks is one of the key concepts you need to understand thoroughly!Would you like me to provide more examples or clarify anything specific about block parameters?