
## Variable Shadowing

### Example 1-20250423

18:43
18:51

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

The variable `a` is initialised with a reference to the integer `4`, and `b` is initialised with a reference to the integer `2`.

`times` is called on `2` and passed a block, and the block code is executed. Inside the block, there is a parameter defined with the same name as an outer variable, `a`.

Blocks have variable scope rules stating that variables initialised within the block cannot be accessed by the outer code, while variables initialised outside the block/ in the surrounding code can be accessed and modified from within the block. This means that both `a` and `b` are visible to the block; however, because the outer variable `a` shares the same name as the block parameter, variable shadowing occurs, preventing access to the outer variable `a`.

Inside the block, during each iteration, `a = 5` is evaluated, which is a reassignment operation of the block parameter `a` to the value of `5` (this creates a new integer object, since integers are immutable objects in Ruby). `puts a` then outputs the value of the local variable `a`, which is `5`. The block code is run twice. (`times` returns the original calling object, `2`, which is not used in this code.)

Back in the outer code, `puts a` outputs `4`, because the only variable called `a` available in the outer code refers to the variable `a` initialised on line 1, while `b` outputs `2`.

```ruby
# Comments added
a = 4
b = 2

2.times do |a| # block parameter shadows outer variable of the same name
  a = 5        # local variable a is reassigned to 5
  puts a       # outputs 5
end

puts a         # => 4
puts b         # => 2

# Output
5
5
4
2
```
### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
n = 10

1.times do |n|
  n = 11
end

puts n
```

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
