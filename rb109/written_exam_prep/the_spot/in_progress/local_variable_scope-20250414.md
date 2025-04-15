## Local Variable Scope

### Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = “Hello”
b = a
a = “Goodbye”

puts a
puts b
```

On line 1, `a` is initialised with a reference to the string object `"Hello"`. On line 2, in the assignment of one variable to another, the variable on the left, `b`, receives a copy of the reference stored in the variable on the right, `a`. Both variables point to the same string `"Hello"`.

On line 3, `a` is reassigned with a reference to a new string object `"Goodbye"`. In reassignments, new objects are created, which means that the variable being reassigned is given a different reference—in other words, the variable points to a different address space in memory containing a new object. `b` still points to address space containing the original string `"Hello"`.

The `puts a` and `puts b` method calls will output the strings that each variable is a reference to. The `puts` method returns `nil`, so the last expression evaluated (`puts b`) returns `nil`.

The output is:

```
Goodbye
Hello
```

This code demonstrates:
- how reassignments create new objects and change what a variable references, without affecting other variables that reference the original object
- variables as pointers: they do not contain objects themselves but rather references to objects held in address spaces in memory

### Example 2-20250415

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4

loop do  
  a = 5  
  b = 3

  break
end

puts a
puts b
```

The variable `a` is initialised with a reference to the integer `4` in the outer code.

The `loop` method is called and passed a block: in each iteration of the block, `a` is reassigned to the integer `5`. This is because blocks can access and modify variables from the surrounding scope (in this case, the outer scope), which means variables initialised in the outer scope can be reassigned from within the block. Before execution of the method reaches `break` (there is only one iteration), the variable `b` is initialised with a reference to the integer `3`. `b` is only available to the block and cannot be accessed or modified by the outer code (or any peer blocks). The return value of the block is the last evaluated expression `break` which returns `nil` (this is also the return value of the method). 

The `puts a` method outputs its argument `a`, which is `5`. When `puts b` is evaluated, Ruby throws a NameError message because there is no variable `b` visible to the outer code; the variable `b` inside the block cannot be accessed.

This code demonstrates:
- variable scope rules in relation to blocks, whereby blocks can access and modify variables initialised in the outer code, but not vice versa.
- reassignment of variables from within a block

### Example 3-20250415

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4
b = 2

loop do  
  c = 3  
  a = c  
  break
end

puts a
puts b
```

In the outer scope, variables `a` and `b` are initialised with references to the integers `4` and `2`, respectively.

The `loop` method is called and passed a block: inside the block, the variable `c` is initialised with a reference to the integer `3`. The next expression in the code is evaluated: `a = c` is a reassignment of one variable to another—in this case, `a` receives a copy of the reference contained in the variable `c`, which is `3`. Both `a` and `c` point to the same object. This expression is a reassignment from within the block because `a`, which was initialised in the outer scope, can be accessed and modified from within the block. The `break` statement is evaluated, which terminates the `loop` method. The return value of the block is the last evaluated expression `break` which returns `nil`. (This is also the method's return value.)

`puts a` outputs `3` and `puts b` outputs `2`. The return value of the code snippet is the same as the last evaluated expression in the code, `puts b`, which is `nil` (since `puts` always returns `nil`).

This code demonstrates:
- variable scope of a block: variables initialised outside of the block can be accessed and modified from within the block (and variables initialised inside the block cannot be accessed by the outer code)
- reassignment of variables from within a block
- assignment of one variable to another: the variable on the left of the assignment operator receives a copy of the reference that the variable on the right references

### Example 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def example(str)
  i = 3  
  loop do    
    puts str    
    i -= 1    
    break if i == 0  
  end
end

example('hello')
```

### Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def greetings(str)  
  puts str  
  puts "Goodbye"
end

word = "Hello"
greetings(word)
```

[Problem link](https://launchschool.com/lessons/a0f3cd44/assignments/9e9e907c)

### Example 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4]
counter = 0
sum = 0

loop do  
  sum += arr[counter]  
  counter += 1  
  break if counter == arr.size
end 

puts "Your total is #{sum}"
```

### Example 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 'Bob'

5.times do |x|  
  a = 'Bill'
end

p a
```

### Example 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
animal = "dog"

loop do |_|  
  animal = "cat"  
  var = "ball"  
  break
end

puts animal
puts var
```

## Variable Shadowing

### Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
animal = "dog"

loop do |_|  
  animal = "cat"  
  var = "ball"  
  break
end

puts animal
puts var
```

a = 4 b = 22.times do |a|  a = 5  puts aendputs aputs b

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

n = 101.times do |n|  n = 11endputs n

### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

animal = "dog"loop do |animal|  animal = "cat"  breakendputs animal