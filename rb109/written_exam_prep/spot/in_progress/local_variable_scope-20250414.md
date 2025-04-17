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

### Example 4-20250416

```
start 17 13
end   17:28
total 00:15
```

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

The `example` method is called and passed the string `'hello'` as an argument.

Inside the method definition, the local variable `str` is bound to the `'hello'` string—the method parameter receives a reference to this string value. The variable `i` is initialised with a reference to the integer `3`, and `loop` is called with a block, which will execute the block code until it reaches a `break` (or `return`) statement.

In each iteration of the block, `puts str` outputs the value of `str`, and then `i` is decremented by `1` (the block can access and modify variables in its surrounding scope). The conditional expression `break if i == 0` is evaluated: if it evaluates as true, `break` is executed, which terminates the `loop` method (and `loop` returns `nil`, since `break` statements return `nil`), otherwise if it evaluates as false, execution continues from the next iteration of the block.

Line by line, it looks like this:

- On the first iteration, `puts str` outputs `'hello'`, `i -= 1` is evaluated, resulting in the reassignment of `i` to reference integer `2`, and then the condition fails because `if` statement evaluates as false
- On the second iteration, `puts str` outputs `'hello'` again, `i` is reassigned to `1`, and `if` statement evaluates as false
- On the third iteration, `puts str` outputs `'hello'`, `i` is reassigned to `0`, and `if` statement evaluates as true since `i == 0`, which executes `break`, and the `loop` method terminates, and execution resumes after `loop`

The return value of the method is the result of the last evaluated expression, which is the return value of the `loop` method, which is the return value of the block, `nil`. The method's return value is not used in this code.

The output is:

```
hello
hello
hello
```

This code demonstrates:
- iterating methods like `loop` that execute the block code until a conditional statement is met
- conditional statements that use truthiness to help build conditional flow
- return values vs output (via `puts`)
- variable scope of a block, in particular how blocks can access variables in its surrounding scope

#### LSBot

You also correctly identified that `break` statements return `nil`, which becomes the return value of the `loop` method and subsequently the return value of the `example` method. As shown in exercises like [Runaway Loop](https://launchschool.com/exercises/c07d750e) and [Control the Loop](https://launchschool.com/exercises/a9ce12dc), the `break` statement is essential for controlling loop execution.

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