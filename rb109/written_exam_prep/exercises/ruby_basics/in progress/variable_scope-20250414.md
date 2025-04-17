
# What's My Value? (Part 1)

What will the following code print and why? Don't run it until you have tried to answer.

```ruby
a = 7

def my_value(b)
  b += 10
end

my_value(a)
puts a
```

The variable `a` is initialised with a reference to integer object `7`.

`my_value(a)` is a method call that's passed the reference to the integer `7` stored in `a`. Inside the method definition, the local variable `b` is bound to the same integer object to which `a` is a reference. `b += 10` is evaluated: the value of `b` is incremented by 10—the evaluated result is `17`; `b` is reassigned to reference integer `17`. Reassignments create new objects, which means the variable receives a different reference to the new object, and any variables that point to the original object remain unaffected (the variable `a` is not affected by these operations).

`my_value(a)` is evaluated as the return value of the method, which is the same result of the last expression evaluated in the method—in this case, `b += 10` is the only and last expression—so the value of `my_value(a)` is `17`. This value is not output.

Note that integer objects are being operated on in this code: in Ruby, integers are immutable objects, which means they cannot be changed once they are created, so any variables pointing to the original integer will not be affected if the integer is operated on.

`puts a` will output `7`: the argument `a` passed to the `puts` method call is a reference to the integer `7`, which is unaffected by the method.

The output is:

```
7
```

This code demonstrates:
- pass by reference value in Ruby methods and how reassignments do not affect variables pointing to the original object (vs mutation)
- immutability of integers
- return values vs output

# What's My Value? (Part 2)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a
```

The variable `a` is initialised with a reference to integer `7`.

The `my_value` method call is passed the integer `7` as an argument. Inside the method definition, the local variable `a` is bound to integer `7` which the outer variable `a` references. The expression `a += 10` is evaluated: the value of `a` is incremented by `10`—the evaluated result is `17`. The locally scoped `a` is reassigned to the integer object `17`. `+=` is an assignment operator, which creates a new object, and the inner variable `a` now contains a reference to this new integer object. The return value of the method is the same as the evaluated result of the last expression in the method body, which in this case is also the only expression: the return value of the method is `17`, so the return value of `my_value(a)` is `17`.

When `puts a` is called, it outputs the value of its argument `a`, which was initialised in the outer code; the output is `7`. This is because of two important concepts:

- Method definitions creates their own scope: they cannot access or modify variables in the outer code unless they are passed in as arguments and mutating methods are called on those corresponding objects. The `my_value` method does not have mutating methods, but instead only an assignment operation, which creates a new object, and therefore the original reference is disconnected from the local variable that was assigned the reference of the object that was passed in.
- Numbers in Ruby are immutable objects, which means that once they are created, they cannot be changed (instead new integer objects would be created if they are operated on), so any variables pointing to the original integer object will not be affected by any operations performed on the object.

The output is:

```
7
```

# What's My Value? (Part 3)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = 7

def my_value(b)
  a = b
end

my_value(a + 5)
puts a
```

The variable `a` is initialised with a reference to the integer object `7`.

The `my_value` method call is passed an argument (`a + 5`), which is the evaluated result of `a` incremented by `5`—so the integer `12` is passed to the method as an argument.

Inside the method definition, the local variable `b` is bound to the integer `12`. The expression `a = b` is evaluated: the locally scoped variable `a` is initialised with a copy of the reference stored in variable `b`, so both inner scope variables point to the same integer object `12`. The return value of the method is the same as the evaluated result of the last expression in the method body `a = b`, which is `12`. This is the evaluated value of `my_value(a + 5)`.

The `puts a` method call outputs its argument `a`, which refers to the outer variable `a` initialised on line 1, printing `7`.

The operations within the method have no effect on the outer variable `a` due to variable scoping rules of method definitions. Method definitions create their own scope: outer variables cannot be accessed or modified unless they are passed in as arguments and mutated methods are called on those corresponding objects. In this example, there is an argument evaluation of `a + 5` before being passed to the method, which effectively only passes the evaluated result, not the reference stored in `a`.

Moreover, the assignment of `a + b` inside the method has no effect on the outer variable `a` because variables initialised within a method definition cannot be accessed or modified by the outer code.

The output is:

```
7
```

# What's My Value? (Part 4)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end

my_value(a)
puts a
```

The variable `a` is initialised with a reference to the string object `"Xyzzy"`.

The `my_value` method is called and passed the string object `"Xyzzy"`. Inside the method definition, the local variable `b` is bound to the string object which the outer variable `a` references. The expression `b[2] = '-'` is evaluated: the character at index 2 of the string is set to `"-"`, which modifies the original string to `"Xy-zy"`, and the entire expression returns `"-"` (since `String#[]=` returns the substring specified by the argument). The evaluated result of `my_value(a)` is the same as the return value of the method, which is the evaluated result of the last expression in the method body: `"-"`.

When `puts a` is called, the effect of the mutating method is visible through its reference contained in variable `a`: the output is the modified string `"Xy-zy"`. To understand why, it's important to consider variable scoping rules in relation to method definitions, and what happens when a mutating method operates on objects.

Method definitions create their own scope: variables initialised in the outer scope cannot be accessed or modified within the method definition unless they are passed in as arguments and mutating methods are called on the corresponding objects. In this case, the reference to the string object was passed in as an argument, the `String#[]=` setter method mutates the original object, and any variables pointing to the same object see this change, including the variable `a` in the outer code.

The output is:

```
Xy-zy
```

# What's My Value? (Part 5)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a
```

# What's My Value? (Part 6)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a
```

# What's My Value? (Part 7)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = 7
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a
```

# What's My Value? (Part 8)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a
```

# What's My Value? (Part 9)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a
```

# What's My Value? (Part 10)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = 7
array = [1, 2, 3]

def my_value(ary)
  ary.each do |b|
    a += b
  end
end

my_value(array)
puts a
```