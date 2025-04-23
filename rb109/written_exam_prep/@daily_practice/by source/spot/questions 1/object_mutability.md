## Object Mutability/Mutating Methods

[Here’s the article](https://launchschool.com/blog/mutating-and-non-mutating-methods) with some of the below examples

### Example 1-20250423

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```

What values do `s` and `t` have? Why?

The variable `s` is initialised with a reference to the string object `"hello"`, and `t` is initialised with a reference to the return value of the `fix(s)` method invocation with `s` passed as an argument. `fix(s)` is evaluated before the assignment occurs.

Inside the method definition, the parameter `value` is bound to the same string object `"Hello"` that `s` references—effectively, the method receives a reference to the string object `"hello"`. The destructive `upcase!` method is called on `value`, modifying the original object in place by changing the string's contents to uppercase characters, resulting in `"HELLO"`. Another destructive method `concat` is called on `value`, again modifying the original object in place by concatenating its argument with the original string—the evaluated result is `"HELLO!"`.

Even though `upcase!` and `concat` were called on the local variable `concat` inside the method, these mutations can be seen through any of its references, including the outer variable `s`—`s` still references the original object that was mutated from within the method definition, which is now `"HELLO!"`.

The last line in the method—`value`—evaluates to the modified object `"HELLO!"`, which is also the return value of the method (as it is the same value as the last evaluated expression in the method), and this return value is passed back to the calling code. `t` is assigned with a reference to the modified object `"HELLO!"`. By the end of execution of `fix`, both `s` and `t` contain references to the same string object `"HELLO!"`.

This code demonstrates:
- Variable scope of a method definition: method definitions create a self-contained scope, where variables initialised inside the method definition cannot be accessed by the outer code, and variables initialised in the outer scope cannot be directly accessed or modified unless they are passed as arguments and mutating methods are performed on those corresponding objects.
- Ruby's pass by reference value behaviour: the method receives a reference to the original object, and what happens to the original object depends on whether the operations performed during execution of the method are mutating or non-mutating.
- Mutating methods inside method definitions modify the original object in place, therefore these changes can be examined through any of its references, including variables in the outer scope.

```
# Diagram

# Before fix method invocation
s --> "hello"

# During method invocation
s --> "hello" <-- value

# After upcase!
s --> "HELLO" <-- value

# After concat
s --> "HELLO!" <-- value

# After method invocation
s --> "HELLO!" <-- t
```

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

What values do `s` and `t` have? Why?

### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

What values do `s` and `t` have? Why?

### Example 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

What values do `s` and `t` have? Why?

### Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value[1] = 'x'
  value
end

s = 'abc'
t = fix(s)
```

What values do `s` and `t` have? Why?

### Example 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```

### Example 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr #?
num = 3
num = 2 * num
```

### Example 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = %w(a b c)
a[1] = '-'

p a
```

### Example 9

[Link to page with #9 & #10](https://launchschool.com/lessons/a0f3cd44/assignments/4b1ad598)

```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

### Example 10

```ruby
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```