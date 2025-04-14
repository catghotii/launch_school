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

#### Answer

On line 1, the variable `a` is initialised with a reference to the string object `"Hello"`. On line 2, in the assignment of one variable to another, the variable `b` receives a copy of the reference stored in variable `a` — variable `b` now contains a reference to the string object `"Hello"` to which `a` is also a reference.

On line 3, `a` is reassigned to the string object `"Goodbye"`. It's important to note that this is a reassignment operation, which means that `a` now points to a different string object held in a different address space in memory. At this point, variables `a` and `b` no longer hold references to the same object.

The output printed by the `puts a` and `puts b` method calls display this concept:

```
Goodbye # `a` points to the string object "Goodbye"
Hello   # `b` points to the original string object "Hello"
```

This code demonstrates how variable assignment and reassignment works: in (re)assignment operations, a new object is effectively created, causing the variable to hold a new reference to this object as well.


### Example 2

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

#### Answer

Output:

```
5
# error
```

concept - variable scope of blocks

On line 1, variable `a` is a initialised to reference integer object `4`.

Inside the `loop` method's block, variable `a` is reassigned to reference integer object `5`. This follows local variable scoping rules in relation to blocks: variables initialised outside of a block can be accessed and modified from within the block. Therefore the local variable `a` that was initialised in the outer scope is accessible from with the block, and there is a reaassignment of the variable `a`.

On the next line of the block, variable `b` is initialised to reference integer object `3`, which is locally scoped to the block — that is, `b` is only available to the block and not to the outer code.

The printing method calls of `puts a` and `puts b` displays the effects of these scoping rules of local variables: `puts a` will print `5`, which is the result of the reassignment operation inside of the block, while `puts b` will output an 'undefined local variable' error message because in the outer code there is no variable called `b` (the local variable `b` in the block cannot be accessed by the outer code).


### Example 3

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

#### Answer

On line 1, variable `a` is initialised to reference integer object `4`, and on line 2, variable `b` is initialised to reference integer `2`.

Within the loop, the variable `c` is initialised to reference integer object `3`. On the next line, variable `a`, which was initialised in the outer scope on line 1, undergoes a reassignment from within the block, receiving a copy of the reference stored in variable `c`, which points to integer object `3`. This reassignment from within the block follows local variable scope rules in relation to blocks, whereby variables initialised outside of a block are available from within the block. Effectively, variable `a` now points to the same integer object `3` that variable `c` is also pointing to.

The method calls of `puts a` and `puts b` will print to the console the following output:

```
3
2
```

The return values of both method calls is `nil` because `puts` always returns `nil`.


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

The `example` method is called and passed the string object `"hello"` as an argument.

Inside the `example` method definition, the local variable `str` receives a copy of the reference to the string `"hello"`. The variable `i` is initialised to reference integer object `3`.

There is `loop` method invocation with a block that will perform the following operations during each iteration:

- `puts str` will output the string `"hello"` to the console
- variable `i` is decremented by 1, or in other words, the variable `i` is reassigned to the result of `i` minus 1, which will be an integer value.
- `break if i == 0` is a conditional expression: if `i == 0`, `break` will be executed and the `loop` method will stop and execution will resume to after the `method` loop; Ruby will return the method's return value since this is the last expression in the method body.

Line-by-line:

- On the 1st iteration, `puts str` is executed, which outputs `"hello"` to the console; `i`, which was initialised to reference integer `3` outside of the method's block, is decremented by 1 and now will point to the integer object `2`; the if statement evaluates as false, so execution continues to the next iteration

- On the 2nd iteration, `puts str` outputs `"hello"` to the console once again; `i`, which points to integer object `2` decrements by 1 and therefore reassigned to integer object `1`; the if statement evaluates as false

- On the 3rd iteration, `puts str` outputs `"hello"`; `i` is reassigned to integer object `0`; the if statement evaluates as true, so `break` is executed, and execution of the method invocation is completed.

The output is:

```
hello
hello
hello
```

The output is different from the return value of the method. In Ruby, everything is an expression, and every expression can be evaluated and returns something, even if that return value is `nil`. The return value of the method is the result of the last evaluated expression in the method definition: in the `example` method definition, the last expression that is evaluated is `break if i == 0`; `break` returns `nil`, so the method's return value is `nil`.


### Example 5

[Problem link](https://launchschool.com/lessons/a0f3cd44/assignments/9e9e907c)

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"
greetings(word)
```

On line 6, the variable `word` is initialised with a reference to the string object `"Hello"`. On line 7, `greetings(word)` is executed: the `greetings` method is called and passed the string object `"Hello"` as an argument.

Inside the method definition, the local variable `str` is initialised and receives a copy of the reference to the string object `"Hello"`. The `puts str` method call is passed this string object as an argument, which outputs `"Hello"` to the console. `puts "Goodbye"` outputs `"Goodbye"`.

The output is:

```
Hello
Goodbye
```

The return value of the method is `nil` since `puts "Goodbye"` is the result of the last evaluated expression in the method body.

This code demonstrates how variables initialised in the outer scope can be accessed from within a method definition by passing references to objects as arguments during a method call (local variable scope of a method).

https://launchschool.com/lessons/8a39abff/assignments/1be6d04d


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

On line 1, variable `arr` is initialised with a reference to the array object `[1, 2, 3, 4]`. On line 2, `counter` is initialised with a reference to integer object `0`, as is variable `sum` on the following line (both variables contain immediate references to integer object `0`, which in Ruby is the same object regardless of how many variables point to it).

The `loop` method is called with a block. The variables initialised in the outer code are accessed and modified by operations from within the block, demonstrating local variable scoping rules of blocks. On each iteration of the block, the following operations are executed:

- `sum` is incremented by the value of `arr[counter]`, which would be the element in the `arr` array at the index position denoted by the value of `counter`; 

- `counter` is incremented by 1

- the if statement `break if counter == arr.size` is evaluated: if the evaluated result is true (i.e. if the value of `counter` is equal to the number of elemeents in `arr`), `break` will be executed, stopping the execution of `loop`; otherwise if the expression evaluates as false, execution continues at the next iteration

Line-by-line:

- On the 1st iteration, `sum += arr[0]`: `arr[0]` evaluates to `1`, which is the element at index 0 of the array object that's being iterated on; `sum`, which is pointing to integer `0`, is reassigned to the result of the expression `0 + 1`, which is `1` — `sum` now points to integer `1`. On the next line, `counter` increments by 1 to `1` (from `0`), and the if statement evaluates as false

At this stage in execution:
`sum = 1`
`counter = 1`

- On the 2nd iteration, `sum` is reassigned to the value of `sum + arr[1]` (`1 + 2`), which is `3`; counter increments to `2`, and the if statement evaluates as false

At this stage in execution:
`sum = 3`
`counter = 2`

- On the 3rd iteration, `sum` is reassigned to the evaluated result of `3 + 3`, which is `6`; counter is reassigned to `3`, and the if statement evaluates as false.

At this stage in execution:
`sum = 6`
`counter = 3`

- On the 4th iteration, `sum` is reassigned to the evaluated result of `6 + 4`, which is `10`; counter is `4`, and the if statement evaluates to true, so `break` is executed and execution of the `loop` method stops.

At the end of the `loop` method, sum is `10`.

Once the loop ends, the `puts` method is called and passed an argument with the string `"Your total is #{sum}"`, which contains a string interpolation operation of `sum`.

The output is:

```
Your total is 10.
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

On line 1, variable `a` is initialised with a reference to the string object `'Bob'`. On line 3, the `times` method is called with a block, and inside the block, the same variable `a` is reassigned to reference a new string object `'Bill'` on each iteration — in this case, the reassignment occurs 5 times. This follows variable scoping rules of a block, whereby variables that are initialised outside of the block can be accessed and modified from within the block.

The printing method `p` will output its argument in a 'raw' representation — for string arguments it will also display the quotes.

The output is:
```
"Bill"
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

On line 1, the variable `animal` is initialised with a reference to the string object `"dog"`.

The `loop` method is called with a block, and inside the block, the same variable `animal` is reassigned to reference a new string object `"cat"`. On the next line, the local variable `var` is initialised to reference the string object `"ball"`. `break` is then executed, and execution resumes after the method call.

The `puts` method calls demonstrate variable scoping rules of a block:
- `puts animal` will output `"cat"`which is the result of the reassignment of the the variable `animal` that was initialised in the outer code: variables initialised in outer code can be accessed and modified from within a block
- `puts var` will throw a NameError message, since variables initialised inside a block cannot be accessed or modified in the outer scope

The output is:
```
cat
# NameError message
```