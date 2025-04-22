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

### Example 5-20250422

15:48
16:00

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

The variable `s` is initialised with a reference to the the string object `'abc'`. The variable `t` is initialised to the return value of `fix(s)`; when the `fix` method is called and passed the argument `s`, the method's return value is passed back to the calling code, which is the object that `t` will reference in this variable assignment.

Inside the method definition, the parameter `value` is bound to the same string object `'abc'` that `s` references—essentially, the method receives a reference to the string object. The operations within the method definition are executed. First, `value[1] = 'x'` is evaluated: `String#[]=` is a mutating setter method, which modifies the string object in place by replacing the string value at the argument's index position with the string `'x'`, resulting in the modified string `'axc'`. Since this is a mutating method that's called on the same string that `s` references, `s` points to the modified string object.

The last expression in the method, `value`, evaluates to the modified string `'axc'`, which is the subsequent implicit return value of the method, which is then passed back to the calling code. `t` references the string object `'axc'`. Effectively, both `s` and `t` contain references to the same string object which has been modified by the method.

Even though the mutating setter operation was performed on the local variable `value` inside the method definition, the outer variable `s` will also see this change. This demonstrates two important concepts: firstly, Ruby's pass by reference value behaviour, whereby methods receive references when passed an argument, and secondly, the variable scope of a method definition: variables initialised inside the method cannot be accessed by the outer scope, and variables initialised outside the method cannot be accessed and modified unless they are passed in as arguments and mutating operations are performed on those corresponding objects.

Since the method definition has mutating operations that are performed on the original string object, any of its references also see these changes, including the outer variable `s`.

```ruby
# Original state of `s` and `value`
s --> "abc" <-- value

# After value[1] = 'x'
s --> "axc" <-- value

# After execution of the method call
s --> "axc" <-- t
```

### Example 6-20250422

1913
1921

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```

The variable `a` is initialised with a reference the the string object `"hello"`. `a_method(a)` is called and passed `a` as an argument. Inside the method definition, the parameter `string` is bound to the same string object `"hello"` that `a` references—essentially, the method receives a reference to the object.

In the method definition, the mutating operation `string << " world"` is evaluated, which modifies the original string in place by concatenating the argument `" world"` to the original string, resulting in `"hello world"`. This mutation can be seen through any of the original object's references, including the outer variable `a`.

The method's return value is the same value as the last evaluated expression,  `"hello world"`, which is passed back to the calling code. This value is not explicitly used by the calling code.

`p a` outputs the value of `a`, which now points to the modified string `"hello world"`.

This code demonstrates a few important concepts: firstly, Ruby's pass by reference value behaviour, where the method receives a reference to the original object that's passed as an argument, and secondly, the variable scope of a method definition, whereby variables initialised in the outer scope cannot be directly accessed or modified unless they are passed in as arguments and mutating operations are performed on the corresponding objects.

In this example, the `a_method` method call is passed an argument of `a`—the method receives a reference to the same object that `a` references, and a mutating method is called on the string object, which modifies the original object in place, with the result that the mutation affects any of its variables outside the method.

```
# Output:
'hello world'
```

### Example 7-20250422

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
num = 3
num = 2 * num
```

On line 1, the variable `num` is initialised with a reference to the integer `3`. On line 2, `num` undergoes reassignment: `2 * num` is evaluated to `6`, and `num` now references this new integer object `6`.

This code demonstrates immutability of integer objects, which means that immutable objects, like integers, cannot be modified once they are created. Instead, they can be reassigned, which means new objects are created and the variable's reference is changed. In this code, `num` is reassigned to reference a new integer object, which is the result of the evaluated expression `2 * num`.

### Example 8-20250422

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = %w(a b c)
a[1] = '-'

p a
```

The variable `a` is initialised with a reference to the array object containing strings `['a', 'b', 'c']`.

The next line `a[1] = '-'` is a mutating operation. `Array#[]=` is a setter method that modifies the array by replacing the element of the given index as an argument with the value to the right of `=`. `a[1]` refers to the string object `'b'`, which is replaced with a new string object `'-'`.

This code demonstrates mutability of arrays by using the destructive `Array#[]=` method.

`p a` prints the modified array object, `['a', '-', 'c']`.

### Example 9-20250422

[Link to page with #9 & #10](https://launchschool.com/lessons/a0f3cd44/assignments/4b1ad598)

```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

The variable `names` is initialised with a reference to the array object `['bob', 'kim']`. The `add_name` method is called and passed two arguments, `names` and the string object `'jim'`.

Inside the method definition, the `arr` parameter is bound to the same array object `['bob', 'kim']` that `names` references, and `name` is bound to the value of the string `'jim'`. Essentially, the method receives references to these objects.

`arr = arr + [name]` is evaluated, which is a reassignment operation. Inside the method, the local variable `arr` is reassigned to the evaluated result of `arr + [name]`—`['bob', 'kim'] + ['jim']` results in a new array `['bob', 'kim', 'jim']`, and `arr` is assigned to the new array. Notably, this reassignment is a non-mutating operation, which means the original object `names` is not affected by the operation inside the method; the outer variable `names` still points to the original array `['bob', 'kim']`. After execution of the expressions in the method, the method's return value is evaluated, which is the same value as the last evaluated expression during execution of the method, the new array `['bob', 'kim', 'jim']` (although the return value is not used in this code).

This code demonstrates key concepts: variable scope of a method definition, Ruby's pass by reference value behaviour, and how non-mutating methods within a method definition create new objects rather than modifying the original object(s) in place.

The method definition creates its own scope: any variables initialised in the outer code cannot be directly accessed or modified from within the method definition unless they are passed as arguments and mutating operations are performed on those corresponding objects. In this example, the method receives references to the objects that are passed as arguments—`arr` receives a reference to the array object that the outer variable `names` references, while `name` receives the value of the string object that's passed as an argument. However, the reassignment in the method body is a non-mutating operation, which creates a new object that's bound to the local variable `arr`, which also means that the original object remains unchanged. The outer variable `names` continues to point to the original array, `['bob', 'kim',]`, which is the output of `puts names`: each element is output on a newline.

```
# Output:

bob
kim
```

### Example 10-20250422

```ruby
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

The variable `names` is initialised with a reference to the array object `['bob', 'kim']`. The `add_name` method is called and passed two arguments, `names` and the string object `'jim'`. Inside the method definition, the parameter `arr` is bound to the same array object `['bob', 'kim']` that the outer variable `names` references, and `name` is bound to the string object `'jim'`.

The expression in the method body is evaluated: `arr = arr << name` is a reassignment operation that involves a mutating method. `arr << name` is first evaluated: `<<` is a mutating method that modifies the original array `['bob', 'kim']` by appending its argument to the array, resulting in `['bob', 'kim', 'jim']`. This mutation of the original object can be seen through any of its references, including the outer variable `names`, which points to the modified object. The modified array is then assigned to the local variable `arr` inside the method definition—effectively, `arr` contains a reference to the same object that the outer `variable` names also references—and the evaluated result of this expression, `['bob', 'kim', 'jim']`, is also the return value of the method (as it is the evaluated result of last expression of the method as well). This return value is passed back to the calling code, although it is not used in this code snippet.

`puts names` will output the elements of the original array object that has been mutated by the `add_name` method invocation, separated by newlines:

```
# Output:

bob
kim
jim
```

This code demonstrates:
- Variable scope of a method definition: variables initialised in the outer code cannot be directly accessed or modified unless they are passed as arguments and mutating operations are performed on those corresponding objects.
- Ruby's pass by reference value behaviour: the outer variable `names` is passed as the first argument and the method parameter `arr` receives a reference to the the array object `['bob', 'kim']`
- Mutating methods within method definitions: `<<` is a destructive method that modifies the original array object in place, and this mutation can be examined through any of its references outside the method definition, including `names`.