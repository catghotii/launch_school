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

### Example 2-20250416

```
start 15:48
end   16:17
total 00:29
```

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

The variable `s` is inialised with a reference to the string object `'hello'`. The variable `t` is initialised with a reference to the return value of the `fix` method invocation with `s` as an argument.

Inside the method definition, the local variable `value` is bound to the same string object `'hello'` to which `s` is a reference—essentially, the method parameter `value` receives a reference to this string value. `value = value.upcase` is evaluated: the `upcase` method is called on `value` and returns a new string with uppercase characters `'HELLO'`, and the local variable `value` is reassigned to this string. The reassignment creates a new object, which also changes the reference contained in the variable that's being reassigned.

When the destructive method `concat` is called on `value`, it concatenates the new string with its argument `'!'`, resulting in `'HELLO!'`, which is also the return value of the method since this is the result of the last evaluated expression in the method. This string is implicitly returned by the method and passed back to its calling code `t = fix(s)`. `t` is assigned to `'HELLO!'`, while `s` still points to the original string `'hello'`.

This code demonstrates key concepts of Ruby's pass by reference value behaviour when passing objects. A method definition creates its own scope: any variables initialised in the method cannot be accessed by the outer code, and any variables initialised in the outer code cannot be accessed or modified from within the method unless they are passed in as arguments and mutating methods are called on those corresponding objects.

In this case, the reference to the string `'hello'` is bound to the parameter variable `value` when passed to the method, but due to the reassignment of `value` to a new string, the reference to the original object is no longer connected to `value`, and any mutating operations performed on `value` from this point onwards will have no effect on any of the original object or its references, including the outer variable `s`. Even though a mutating method is called on `value`, the object that it mutates is not the original object that was passed as an argument but rather the mutation is performed on the new string created from the reassignment.

### Example 3-20250416

```
start 16:20
end   16:43
total 00:23
```

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

The variable `s` is initialised with a reference to the string object `'hello'`, and the variable `t` is initialised with a reference to the return value of the `fix(s)` method invocation.

Inside the method definition, the local variable `value` is bound to the same string object `'hello'` that `s` references—effectively, the method parameter receives a reference to this string object. The first line in the method `value << 'xyz'` is evaluated: `<<` is a mutating method that concatenates the calling object with its argument, resulting in `'helloxyz'`. Since this is a mutating method that's called on the original object, any of the object's references will also see this change, including the outer variable `s`, which also points to the mutated string `'helloxyz'`.

On the next line, `value = value.upcase` is a reassignment of the local variable `value` to the evaluated result of the non-destructive `upcase` called on `value`: `upcase` returns a new string with uppercase characters—`'HELLOXYZ'`—and `value` is reassigned to reference this new string. Consequently, the reference to the original object is disconnected from `value`, which now contains a reference to a new object. This means that any mutating operations performed on `value` onwards will have no effect on the original object or its references (like `s`).

The destructive `concat` method is called on the new string, which concatenates the calling object with its argument, resulting in `'HELLOXYZ!'`—as this result is the last evaluated expression in the method, it is also the implicit return value of the method. This return value is passed back to its calling code `t = fix(s)`, so `t` is assigned to the returned string `'HELLOXYZ!`.

This code demonstrates how Ruby handles object passing to methods using a pass by reference value behaviour. Method definitions create their own scope: any variables initialised in the outer scope cannot be accessed or modified from within the method unless they are passed in as arguments and mutating methods are called on those corresponding objects. In this example, the original string object is mutated by a destructive operation in the method, and this change is reflected in the variable `s` that points to the same string object (`s` points to the mutated string `'helloxyz'`). However, when the reassignment occurs in the method, a new string is created, breaking the connection to the reference to the original object so any further mutations within the method do not have an effect on the original string but only instead mutate the new string.

At the end of execution, `s` is `'helloxyz'` and `t` is `HELLOXYZ!'`.

### Example 4-20250416

```
start 16:47
end   17:03
total 00:16
```

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

The variable `s` is initialised with a reference to the string object `'hello'`, and `t` is assigned to the return value of the `fix(s)` method invocation.

Inside the method definition, the local variable `value` is bound to the same string object `'hello'` which `s` references—essentially, the method parameter receives a reference to this string object.

On the first line, a reassignment operation occurs: the destructive `upcase!` method is called on the string referenced by `value` and then the variable `value` is reassigned to the evaluated result. When `upcase!` is called, it mutates the calling string object with uppercase characters—the string `'hello'` is permanently modified to `'HELLO'`—and any of the object's references also see this change, including the outer variable `s`, which now points to the mutated string `'HELLO'`. In this assignment operation, the local variable `value` receives a copy of the reference to the mutated object, which means that the reference to the original object is still used by the method (unlike assignment operations where new objects are created which also changes what a variable references). 

The destructive `concat` method is called on `value`, which still contains a reference to the original object, and concatenates the string with its argument, resulting in `'HELLO!'`—since this is the last evaluated expression in the method, it is also the method's implicit return value, which is passed back to the calling code `t = fix(s)`. `t` is assigned to `'HELLO!'`, which is also the same string object that `s` points to.

This code demonstrates how Ruby handles object passing using a pass by reference value behaviour. Method definitions create their own scope: variables initialised in the outer code cannot be accessed or modified from within a method unless they are passed as arguments and mutating methods are called on those corresponding objects. In this case, the string object is mutated from within the method, and those mutations affect any variables that contain references to the object outside the method.

#### LSBot

1.  You correctly identified that `upcase!` mutates the original string rather than creating a new one, which is the critical difference from the previous examples.

2.  You accurately explained that when we use `value = value.upcase!`:  
   •   The `upcase!` method mutates the original string to `'HELLO'`  
   •   The assignment doesn't create a new object because `upcase!` returns the same mutated object  
   •   Both `value` and `s` still point to the same object after this operation

   3.  You properly explained that the subsequent `concat` method further mutates this same object to `'HELLO!'`, affecting both `value` and `s`.

The key insight in this particular example is understanding that destructive methods with the `!` suffix typically return the mutated object itself, not a new object. This is why the assignment `value = value.upcase!` doesn't break the connection to the original object as it did in previous examples with non-destructive methods.

#### Revised answer

The variable `s` is initialised with a reference to the string object `'hello'`, and `t` is assigned to the return value of the `fix(s)` method invocation.

Inside the method definition, the local variable `value` is bound to the same string object `'hello'` which `s` references—essentially, the method parameter receives a reference to this string object.

On the first line, a reassignment operation occurs: the destructive `upcase!` method is called on the string referenced by `value` and then the variable `value` is reassigned to the evaluated result. When `upcase!` is called, it mutates the calling string object with uppercase characters and returns the mutated string—`'hello'` is permanently modified to `'HELLO'`—and any of the object's references also see this change, including the outer variable `s`, which now points to the mutated string `'HELLO'`. `value` receives a copy of the reference to the mutated object, maintaining the connection to the original object (unlike assignment operations where new objects are created which also changes what a variable references). 

The destructive `concat` method is called on `value`, which still contains a reference to the original object, and concatenates the string with its argument, resulting in `'HELLO!'`—since this is the last evaluated expression in the method, it is also the method's implicit return value, which is passed back to the calling code `t = fix(s)`. `t` is assigned to `'HELLO!'`, which is also the same string object that `s` points to.

This code demonstrates how Ruby handles object passing using a pass by reference value behaviour. Method definitions create their own scope: variables initialised in the outer code cannot be accessed or modified from within a method unless they are passed as arguments and mutating methods are called on those corresponding objects. In this case, the string object is mutated from within the method, and those mutations affect any variables that contain references to the object outside the method.

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