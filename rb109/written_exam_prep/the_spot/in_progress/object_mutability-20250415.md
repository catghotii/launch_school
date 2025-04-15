## Object Mutability/Mutating Methods

[Here’s the article](https://launchschool.com/blog/mutating-and-non-mutating-methods) with some of the below examples

### Example 1-20250415

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

The variable `s` is initialised with a reference to the string object `"hello"`. The variable `t` is initialised with a reference to the return value of the `fix(s)` method call. When the `fix` method is called, it is passed the string object `"hello"` as an argument.

Inside the method definition, the local variable `value` is bound to the string object `"hello"` to which `s` is a reference (effectively, the method parameter receives a reference to this string). The destructive `upcase!` method is called on `value`, which mutates the string's contents to uppercase characters—the string is now `"HELLO"`. The destructive `concat` method concatenates the calling object with its argument `"!"`. The last line in the method is `value`, which evaluates to the modified string `"HELLO!"` As this value is the last evaluated expression in the method body, it is also the method's implicit return value, which is passed back to the calling code `fix(s)`—the variable `t` references the string object `"HELLO!"`.

Method definitions create their own scope: any variables initialised within the method definition cannot be accessed outside of the method, and any variables initialised in the outer code cannot be accessed or modified unless they are passed in as arguments and mutating methods are called on those corresponding objects. Even though `s` was initialised in the outer code, its reference was passed in to the method as an argument when the `fix` method is called, and inside the method, the mutating methods `upcase!` and `concat` are called on that same string object, mutating the original object. Those changes are visible through any of its references, including the variable `s` in the outer code.

Both `s` and `t` have references to the same string object `"HELLO!"`.

The return value of the code snippet is the string object `"HELLO!"`, which is the value of the last evaluated expression `t = fix(s)`. There is no output.

This code demonstrates:
- Variable scope of method definitions: outer scope variables can only be accessed and modified if they are passed in as arguments in a method call, and mutating operations inside the method are performed on the object.
- Pass by reference value in methods: a reference to the object is passed to a method, and what happens to variables pointing to the object depend on whether the operations inside the method are mutating or non-mutating operations. If mutating methods are called on the object, its references can be examined to see these changes (any of its references remain unchanged), whereas mutating operations (like reassignments) create new objects and disconnect the original reference from the variable in the method (any other variables point to the original object).
- The return value of a method (in this code, the value is returned implicitly)

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