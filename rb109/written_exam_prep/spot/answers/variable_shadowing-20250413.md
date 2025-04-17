
## Variable Shadowing

### Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b
```

In the outer scope, variable `a` is initialised with a reference to integer object `4` and variable `b` is initialised with a reference to integer object `2`.

The `times` method is called on the integer `2`, which executes the block twice. The block parameter has the same name as the variable `a` that was initialised in the outer scope — therefore the block parameter `a` shadows the outer variable `a`, preventing access to the outer variable from within the block. In each iteration, the block parameter `a` is initially assigned the current iteration number (0 for the first iteration, 1 for the second). Then `a = 5` reassigns the block parameter to reference the integer `5`, and `puts a` outputs `5`.

After execution of the block, `puts a` outputs `4` and `puts b` outputs `2`.

The output is:

```
5
5
4
2
```

The `times` method returns the original calling object `2`, but this return value is not used in the code.


### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
n = 10

1.times do |n|
  n = 11
end

puts n
```

In the outer code, the variable `n` is initialised with a reference to the integer `10`.

The `times` method is called on integer `1`, which executes the block once. The block parameter `n` shadows the outer variable `n`, preventing access to the variable of the same name in the outer code. In each iteration, the block parameter `n` is initially assigned the current iteration number (0 for the first iteration), and then `n` is reassigned with a reference to integer `11`.

After the block execution, `puts n` outputs `10` (the value of the outer variable `n`).

The `times` method returns original calling object, `1`, but this return value is not used in the code.


### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal
```

The variable `animal` is initialised with a reference to the string object `"dog"`.

The `loop` method is called with a block. The block parameter `animal` shadows the outer variable `animal`, which prevents accessing or modifying the variable of the same name in the outer code. Inside the block, the parameter `animal` is initialised with a reference to the string object `"cat"`, and then `break` is executed.

After the `loop` method call, `puts animal` outputs `"dog"` which is the value of the outer variable `animal`.

The output is:

```
dog
```

The `loop` method returns `nil` when terminated with a `break` statement.