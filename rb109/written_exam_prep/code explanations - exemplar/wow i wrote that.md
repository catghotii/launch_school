### Question 1 (Basic)-20250415

(approx 30 min)

What will the following code output and why? Be specific about the return value versus the output.

```ruby
arr = [1, 2, 3, 4, 5]
new_arr = arr.select do |num|  
  puts num if num.odd?  
end  
p new_arr  
```

The variable `arr` is initialised with a reference to the array object `[1, 2, 3, 4, 5]`.

The variable `new_arr` is initialised with a reference to the return value of the `select` method which is called on `arr` and passed a block as an argument. Unlike the `each` method, which iterates over a collection and returns the original object, the `select` method returns an array containing the elements for which the block returns a truthy value. The `select` method creates an empty array `[]` which stores the elements of the return array if the block returns a truthy value.

In each iteration, the block parameter `num` is assigned to the value of the element of the array, starting at index 0. `puts num if num.odd?` is evaluated: the conditional statement `if num.odd?` is evaluated, and if it evaluates as true, `puts num` outputs the current element. The block's return value is the same as the last evaluated expression in the block. `select` then evaluates the truthiness of the return value of the block: if the value is truthy, the return array by `select` is populated with that iteration's element.

For the odd numbers, `if num.odd?` evaluates as true, so the element is output; the block returns `nil` since `puts` returns `nil`; and then `select` evaluates the return value for truthiness—in this case, `nil` is a falsy value, so nothing happens to the return array.

For the even numbers, `if num.odd?` evaluates as false, and the block returns `nil` (since there is no other branch in the if statement to salvage it, Ruby returns `nil`). The `select` method then evaluates the truthiness of the return value of the block: `nil` is falsy, so nothing happens to the return array.

When all iterations have been completed, the `select` method's return is the resulting return array, which remains `[]`. This return value is passed back to its calling code—`new_arr` references `[]`. When `p new_arr` is called, it outputs a "raw" representation of its argument in a single line, including square brackets. The return value of the code snippet is the value of the last evaluated expression, `p new_arr`, which returns `nil` (since `p` returns `nil`).

The output for this code is:

```
1
3
5
[]
```

This code demonstrates:
- iterating over collections using `select`, which returns an array consisting of elements for which the block returns a truthy value
- how truthiness is used in conditional contexts
- return values of a block vs output (via `puts` and `p` )

### Question 2 (Intermediate)-20250415

```
start 21:45
end   22:15
total 00:30
```

Explain what happens in the following code, including discussion of variable scoping rules and method return values.

```ruby
def greeting(name)  
  puts "Hello, #{name}!"  
  name = name.upcase  
  "Hi, #{name}"  
end  
  
name = "Bob"  
return_value = greeting(name)  
puts name  
puts return_value  
```

The variable `name` is initialised with a reference to the string object `"Bob"`. The variable `return_value` is initialised with a reference to the return of the method call `greeting(name)`. The `greeting` method is called and passed the string object `"Bob"` as an argument.

Inside the method definition, the local variable `name` is bound to the same string object `"Bob"` to which `name` is a reference—essentially, the method parameter `name` receives a reference to this object. `puts "Hello, #{name}!"` is evaluated: the string interpolation is evaluated and concatenated with the surrounding string, which is then output (`"Hello, Bob!")`. Then the local variable `name` is reassigned to the return value of the `upcase` method called on `name`: the non-mutating `upcase` method returns a new string with uppercase letters. The locally scoped variable `name` now references this new string `"BOB"`. The last line in the method is evaluated: after string interpolation and concatenation, it evaluates to `"Hi, BOB"`—this result is also the method's implicit return value, as it is the last evaluated expression in the method, which is then passed back to the calling code. In the outer code `return_value` receives a reference to the string `"Hi, BOB"`.

The `puts name` method call reveals that the outer variable `name` still points to the original object `"Bob"`. It has not been modified! This is due to a method definition's scoping rules: method definitions create their own scope, and any variables initialised in the outer code cannot be accessed or modified unless they are passed in as arguments and mutating methods are called on those corresponding objects within the method. While the string object `"Bob"` (which the outer variable `name` references) was passed in as an argument, it was not mutated by any operations within the method.

Instead, only non-mutating operations were performed in the method: while the method's local variable `name`  initially received a reference to the string object that the outer variable `name` references, reassignment operation changes what the variable references—in this case, it was reassigned to the result of the non-destructive `upcase` method call on `name`, which returns a new string. This means that the reference to the original object is no longer connected to the variable `name` inside the method. If a mutating method was then called on that variable after the reassignment, it would have no effect on any of the original object's references outside of the method.

That the outer variable name references the string initialised in the outer scope also demonstrates another key aspect of a method definition's scope: variables initialised within the method cannot be accessed by the outer code. This means that the local variable `name` inside the method definition is not visible to the outer code, so `puts name` can only output the value of variables available to it in the outer code.

Finally, `puts return_value` outputs the string which was returned by the `greeting` method call. (The return value of the code snippet is `nil` because the return value is the result of the last evaluated expression in the code—`puts` returns `nil`.)

The output is:

```
Hello, Bob!
Bob
Hi, BOB
```

This code demonstrates:
- Ruby's pass by reference value behaviour: methods receives references to objects that are passed in as arguments, but what happens to the original object is determined by the operations in side the method
- Variable scope of method definitions: variables initialised in the method cannot be accessed by the outer code, and variables initialised in the outer code cannot be accessed and modified from within the method unless they are passed in as arguments and mutating operations are performed on the object in the method
- Return values vs output

### Question 3 (Intermediate)-20250415

```
start 22:26
end   22:52
total 00:26
```

What will the following code output and why? Pay special attention to the concepts of object mutability and pass-by-reference/pass-by-value.

```ruby
def fix(value)  
  value.upcase!  
  value.concat('!')  
  value  
end  
  
s = 'hello'  
t = fix(s)  
  
puts s  
puts t  
puts s.object_id == t.object_id  
```

The variable `s` is initialised with a reference to the string object `"hello"`. The variable `t` is initialised with a reference to the return value of `fix(s)` method call. The `fix` method is called and passed the string object `"hello"` as an argument.

Inside the method definition, the local variable `value` is bound to the same string object `"hello"` to which `s` is a reference—essentially, the method parameter receives a reference to this string object. `value.upcase!` is evaluated: the destructive `upcase!` method is called on `value`, which mutates the calling string object with uppercase characters—the string object is now `"HELLO"`. On the next line, `value.concat('!')` is evaluated: the destructive `concat` method concatenates its given argument to the calling object—the string object is now `"HELLO!"`. The last expression in the method `value` is evaluated, which returns the modified string `"HELLO!"`, which is also the return value of the method. This return value is passed back to the calling code, and the outer variable `t` now references this string object.

The `puts` method calls on the last three lines reveal a key concept demonstrated throughout this code: how an object can be mutated when its reference is passed as an argument to a method, which is consistent with variable scoping rules of a method definition, whereby variables in the outer code can be accessed and modified from within a method only if they are passed in as arguments and mutating methods are called on those corresponding objects.

When `fix(s)` is called, the string object to which `s` is a reference is passed to the method as an argument. The method receives a reference to this same string object, which is bound to the method's parameter variable `value`. The mutating methods `upcase!` and `concat` modify the original string object. Even though the mutating methods were called on `value` (which contains a reference to the original string object), the changes to the object can be seen through any of its references, including the outer variable `s`. In fact, both of the outer variables `s` and `t` point to the same string object—this is explicitly confirmed by the last `puts` call: `puts s.object_id == t.object_id` outputs `true`.

If instead only non-mutating operations were performed on the calling object (such as reassignments), the reference to the original object would be disconnected from the local variable `value` which also changes what the variable references; these operations have no effect on the original object or its references. (In these cases, Ruby appears to exhibit "pass by value" object passing to methods.)

Output:

```
HELLO!
HELLO!
true
```

This code demonstrates:
- Ruby's pass by reference value behaviour: the method receives a reference to the object that's passed in as an argument, but what happens to the object is determined by what types of operations are performed on the object (mutating vs non-mutating operations, like assignments)
- Mutability of objects: strings are mutable objects, which means that they can be modified by mutating methods. These changes can be reflected in their references when the mutations are performed on the original object within methods
- The return value of methods vs output

### Question 4 (Advanced)-20250415

```
start 22:57
end   23:23
total 00:26
```

What will the following code output and why? Focus on variable shadowing, method definitions, and block execution.

```ruby
a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
  puts a
end

puts a
```

In the outer scope, variable `a` is initialised with a reference to the integer `7`. `array` is initialised with a reference to the array object `[1, 2, 3]`.

The `each` method is called on `array` and passed a block, which iterates over the collection it's called on and executes the code in the block for each iteration. In each iteration, the current element is assigned to the block parameter `a`, and then the block is executed: `a += 1` is evaluated, which increments the value of `a` by `1`. `+=` is a reassignment operator, which effectively creates a new integer object, and `a` is then bound to this object. Following the reassignment, `puts a` outputs the value of the new integer referenced by `a`. The block's return value is the same as the result of the last evaluated expression in the block, `puts a`, which returns `nil` (since `puts` returns `nil`). This return value is not used by `each`. Instead, at the end of the method's execution,`each` returns the original object that it is called on, `[1, 2, 3]`.

Line by line, it looks like this:

- On the 1st iteration (element at index 0), `a` is `1`. `a += 1` evaluates as `2`, which is then output. The block returns `nil`.
- On the 2nd iteration (element at index 1), `a` is `2`. `a += 1` evaluates as `3`, which is then output. The block returns `nil`.
- On the 3rd iteration (element at index 2), `a` is `1`. `a += 1` evaluates as `4`, which is then output. The block returns `nil`.

The `puts a` method call on the last line, which outputs `7`, reveals a key concept demonstrated throughout this code: variable scope in relation to blocks and in particular, variable shadowing.

Unlike method definitions that have self-contained scopes (outer code cannot access variables initialised inside of the method, and the method cannot access variables outside of it unless they are passed in as arguments), the variable scope of a block follows the rules that the outer code cannot access variables initialised inside of blocks, while the block can access and modify variables in the outer scope (including reassigning outer variables from within the block). While the outer variable `a` should be available to the block, it actually cannot access or modify it within this particular block due to variable shadowing. Within the block, the parameter `a`, which has the same name as the outer variable, shadows or hides the outer `a`, preventing access from within the block. Additionally, the reassignment occurring in the block `a += 1` is a reassignment of the local variable `a` that was initialised inside the block.

Output

```
2
3
4
7
```