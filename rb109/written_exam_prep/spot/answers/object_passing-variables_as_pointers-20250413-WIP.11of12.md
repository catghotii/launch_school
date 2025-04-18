## Object Passing/Variables As Pointers

### Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hi there"
b = a
a = "not here"
```

What are a and b?

The variable `a` is initialised with a reference to the string object `"hi there"`.

In the assignment of the one variable to another, the variable on the left `b` receives a copy of the reference stored in the variable on the right `a`. Both variables contain references to the same string object `"hi there"'.

`a` is reassigned to the string object `"not here"`. When reassignment occurs, a new object is created, effectively reassigning the variable with a different reference. In other words, `a` points to a different address space in memory that contains the new string object `"not here"`, while `b` continues to point to the original string object `"hi there"`.

This code demonstrates:
- assignment of one variable to another involves copies of references to objects
- reassignment of strings
- variables as pointers

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hi there"
b = a
a << ", Bob"
```

What are a and b?

The variable `a` is initialised with a reference to the string object `"hi there"`.

In the assignment from one variable to another, the variable on the left, `b`, receives a copy of the reference stored in the variable on the right, `a`. Both variables now point to the same address space in memory that contains the string object `"hi there"`.

In the last line of the code, `a << ", Bob"`, `<<` is a method call that mutates the string object to which `a` is a reference, by concatenating its argument to the calling object — `a` now points to to the concatenated string `"hi there, Bob"`.
23456
Although the shovel operator was called on `a`, the variable `b` is also affected. Methods that mutate objects have implications for variables that also contain references to the object that's being changed: any variables pointing to that mutated object are also affected.

Unlike reassignment (where new strings are created and therefore the variable's reference also changes), mutating methods change the object itself (which is stored in the same address in memory). This means that any variables that contain a reference to the mutated object continue to point to the same address space, but the address space itself has been mutated.

`a` is `"hi there, Bob"` and `b` is also `"hi there, Bob"`

### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
```

What are a, b, and c? What if the last line was `c = a.uniq!`?

The variable `a` is initialised with a reference to the array object `[1, 2, 3, 3]`.

In the assignment from one variable to another, the variable on the left, `b`, receives a copy of the reference contained in variable on the right, `a`.

The variable `c` is initialised to the return value of the `uniq` method called on `a`: `uniq` is a non-destructive method that removes any duplicate elements from the calling object and returns an array with those elements removed; it does not modify the original calling object.

At the end of execution, `a` is `[1, 2, 3, 3]`, `b` is also `[1, 2, 3, 3]`, and `c` is `[1, 2, 3]`.

 If the last line was instead `c = a.uniq!`, the `uniq!` method would mutate the calling object and return that object itself (the original object would be modified from `[1, 2, 3, 3` to `[1, 2, 3]`). Even though `uniq!` would have been called on `a`, mutating operations affect all variables with references to the original object, insofar as the variables pointing to this object continue pointing to the same address space in memory, but the object contained in that space would be modified. All three variables, which contain references to the same array object, would be affected: `a` is `[1, 2, 3]`, b is `[1, 2, 3]`,  and c is also `[1, 2, 3]`.

### Example 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def test(b)
  b.map { |letter| "I like the letter: #{letter}" }
end

a = ['a', 'b', 'c']

test(a)
```

What is `a`? What if we called `map!` instead of `map`?

The variable `a` is initialised with a reference to the array object `['a', 'b', 'c']`.

The line `test(a)` is a method invocation that's passed a reference to the array object to which `a` is a reference.

In the method definition, the local variable `b` is initialised with a copy of a reference to the array that is passed in as an argument when the method is called. The `map` method is called on the array object, which returns an array containing the returns values of the block (unlike `each` which returns the original array it's called on).

In each iteration, the block parameter `letter` is assigned the value of the current element of the array, starting at index 0. The interpolated string `"I like the letter: #{letter}"` is evaluated, and the return value of the block is the evaluated string. The `map` method returns an array containing the return values: `["I like the letter: a", "I like the letter: b", "I like the letter: c"]`.

The return value of the method is the result of the last evaluated expression in the method body, which is the same as the return array of the `map` method: `["I like the letter: a", "I like the letter: b", "I like the letter: c"]`. This return value is not used in the code.

At the end of execution, `a` remains `['a', 'b', 'c']`.

If instead the destructive method `map!` was called on the array object, then `a` would be changed to `["I like the letter: a", "I like the letter: b", "I like the letter: c"]`. This is because a mutating method modifies the original calling object, and any variables pointing to that object are also affected.

The variable scope of a method definition follows the rule that variables initialised outside of the block cannot be accessed from within a method unless they are passed as arguments. Even though  `a` was initialised outside of the block, the method call `test(a)` passes a reference to the array object to the method definition, which would modified by the `map!` method from within the method.

This code demonstrates:
- how references to objects are passed as arguments when a method is called
- return values of a block and how these are used in the `map` method
- return value of a method
- non-destructive vs destructive methods; how they modify existing objects and affect any variables that contain a reference to the modified object
- variable scope of a method definition

#### LSBot feedback

**Areas for Improvement:**

**1. Clarifying Block Return Values**

Your explanation is correct, but we can be more precise about how `map` works:
  
```
# The block returns a transformed value for each element:  
b.map { |letter| "I like the letter: #{letter}" }  
# Each original element is replaced with its transformed version in the returned array
```


**2. Simplified Method Scope Explanation**

While your explanation about variable scope is correct, this section could be streamlined:

```
# More concisely:  
# Method definitions create their own scope. While local variables from outside   
# cannot be accessed directly inside the method, objects can be modified if   
# they're passed in as arguments and mutating methods are called on them.
```

#### updated answer

The variable `a` is initialised with a reference to the array object `['a', 'b', 'c']`.

The line `test(a)` is a method invocation that's passed a reference to the array object to which `a` is a reference.

In the method definition, the local variable `b` is initialised with a copy of a reference to the array that is passed in as an argument when the method is called. The `map` method is called on the array object, which returns an array containing the returns values of the block (unlike `each` which returns the original array it's called on).

In each iteration, the block parameter `letter` is assigned the value of the current element of the array, starting at index 0. The block returns a transformed value for each element: `"I like the letter: #{letter}"`.

The `map` method returns an array containing the transformed versions of the original values: `["I like the letter: a", "I like the letter: b", "I like the letter: c"]`.

The return value of the method is the result of the last evaluated expression in the method body, which is the same as the return array of the `map` method: `["I like the letter: a", "I like the letter: b", "I like the letter: c"]`. This return value is not used in the code.

At the end of execution, `a` remains `['a', 'b', 'c']`.

Method definitions create their own scope. While local variables from outside cannot be accessed directly inside the method, objects can be modified if they're passed in as arguments and mutating methods are called on them. This means that any variables pointing to the mutated object will also be affected. If instead the destructive method `map!` was called on the array object, then `a` would be changed to `["I like the letter: a", "I like the letter: b", "I like the letter: c"]`. 


### Example 5


What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 5.2
b = 7.3
a = b
b += 1.1
```

What is `a` and `b`? Why?

The variable `a` is initialised with a reference to the floating number `5.2`. `b` is initialised with a reference to the float `7.3`.

In the assignment from one variable to another, the variable on the left, `a`, receives a copy of the reference contained in the variable on the right, `b`. Both `a` and `b` now point to the same float `7.3`.

The last expression `b += 1.1` is a reassignment which increments the value of `b` by `1.1`. In reassignments, a new object is created and the variable is reassigned with a different reference to this new object.  `b` contains a reference to the new float object `8.4`, while `a` contains a reference to the original float `7.3`.

### Example 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def test(str)
  str += '!'
  str.downcase!
end

test_str = 'Written Assessment'

test(test_str)

puts test_str
```

The variable `test_str` is initialised with a reference to the string object `"Written Assessment"`.

The expression `test(test_str)` is a method call that's passed in an argument of the reference to the string object to which `test_str` is a reference.

Inside the method definition, the local variable `str` is initialised with a copy of the reference to the string `"Written Assessment"`. `str += '!'` is a reassignment: `str` points to a new string object `"Written Assessment!"`, which effectively means the reference to the original string object that was passed in is no longer used in the rest of the method body. Any mutating methods that are called on the new string will not have any affect on the original string object.

The destructive `downcase!` method is called on the local variable `str`, which modifies the new string to `"written assessment!"`. The return value of the method is the same result of the last evaluated expression in the method, which is `"written assessment!"` (the method's return value is not used in this code).

`puts test_str` will output `'Written Asessment'` which is the original string object that was initially initialised.

The output is:

```
Written Assessment
```

This code demonstrates:
- passing in references to objects when a method is called
- reassigning variables creates new objects and changes what a variable references (vs mutation)
- output (via `puts`) vs method return values
- method scope and variable isolation(?)

---

[Link](https://launchschool.com/blog/object-passing-in-ruby) to explanation of examples below

### Example 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)

puts a
puts b
```

The variable `a` is initialised with a reference to the integer `3`. The variable `b` is initialised to the return value of the `plus(a, 2)` method call.

In the `plus` method call, two arguments are passed in: references to the integers `3` and `2`. Inside the method definition, two local variables `x` and `y` are initialised with copies of references to the integer objects `3` and `2`, respectively. `x = x + y` is a reassignment of the variable `x` to the evaluated result of `x + y` (`3 + 2)`, which creates a new integer object `5`. This reassignment does not have any effect on the variables in the outer code because new objects are created by reassignment operations, which means that any variables pointing to original object that was passed in remains unchanged. This particular code is also dealing with integers which are immutable objects in Ruby, meaning that their values cannot be changed once they are created.

The return value of the method is the result of the last evaluated expression in the method body, which is `5`. The method's return value of `5` is what the variable `b` is initialised to reference.

The `puts` method calls at the end of the code outputs:

```
3
5
```

This code demonstrates:
- how the return value of a method can be used in variable assignments
- reassignment of variables
- return values vs output
- immutability of integer objects
- method definitions have a self-contained scope

### Example 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def increment(x)
  x << 'b'
end

y = 'a'

increment(y)
puts y
```

The variable `y` is initialised with a reference to the string object `'a'`. The `increment(y)` method call is passed an argument with a reference to the string to which `y` is a reference.

Inside the method definition, the local variable `x` is initialised with a copy of the reference to the string object `'a'`, and the mutating method `x << 'b'` is executed. The shovel operator is a destructive method, which concatenates the original string `'a'` with the argument string `'b'`, modifying the original string to `'ab'`. 

A method definition creates its own scope, which means outer code variables cannot be directly accessed or modified from within the method unless they are passed in as arguments and mutating methods are called on those corresponding objects. Mutating methods change existing objects, which means that any variables pointing to the mutated object will also be affected. 

The `puts y` method call displays the results of the mutating method called inside of the method definition. `y` contains a reference to the original string object that was passed in as an argument and modified by the shovel operator; in other words, it points to the same object that was mutated by the method.

The output is:

```
ab
```

This code demonstrates:
- variable scope of a method definition and how variables in outer code can be modified form within methods when passed in as arguments and mutating methods are called on these objects
- how mutating methods within method definitions can modify objects and the implications for variables that point to the same object that's being modified

#### LSBot feedback

**Code Review: String Mutation in Method**

**Overall Assessment:**

Your analysis is accurate and shows strong understanding of Ruby's method scope and mutability concepts. You've correctly identified how string mutation works across method boundaries and traced the execution flow well.

**Strengths:**
1.  ​**Object Reference Understanding**​: Excellent explanation of how references are passed to methods and how the shovel operator works on the original object  
2.  ​**Method Scope Clarity**​: Clear explanation of method definition scope and its implications for variable access  
3.  ​**Mutation vs Reassignment**​: Good distinction between mutating operations that modify existing objects versus reassignment operations

**Areas for Improvement:**

**1. Return Value Specification**

Your answer accurately describes the output but doesn't explicitly address what the method returns:

```
# ruby  
  
def increment(x)  
  x << 'b'  # This returns the mutated string 'ab'  
  # The last evaluated expression is the return value  
end  
  
# So increment(y) returns 'ab'  
```

**2. Terminology Precision**

While your explanation is correct, consider using more precise terminology when describing object references:

```
# ruby  
  
# Instead of:  
x is initialised with a copy of the reference to the string object  
  
# Consider:  
x is bound to the same string object that y references
```

**3. Core Concept Identification**You could more explicitly identify the core concept being demonstrated - pass by reference value:

```
# ruby  
  
# This code demonstrates Ruby's "pass by reference value" behavior:  
# - The method receives a reference to the same object y points to  
# - When we mutate the object through that reference, all variables  
#   pointing to that object (including y) see the change  
```

**Summary:**

You've demonstrated excellent understanding of Ruby's object model, particularly how mutating methods affect objects across different scopes. The code demonstrates the crucial distinction between mutation and reassignment, showing how objects can be modified within methods in ways that affect the original variable. This is a fundamental concept that distinguishes Ruby's "pass by reference value" approach from pure "pass by value" or pure "pass by reference" languages. Well done!

#### Revised answer

The variable `y` is initialised with a reference to the string object `'a'`. The `increment(y)` method call is passed an argument with a reference to the string to which `y` is a reference.

Inside the method definition, ***the local variable `x` is bound to the same string object that `y` references***, and the mutating method `x << 'b'` is executed. The shovel operator is a destructive method, which concatenates the original string `'a'` with the argument string `'b'`, modifying the original string to `'ab'`.  ***This result is the same value as the return value of the method, which is the evaluated result of the last expression in the method body. `increment(y)` evaluates to the method's return value `ab`.***

A method definition creates its own scope, which means outer code variables cannot be directly accessed or modified from within the method unless they are passed in as arguments and mutating methods are called on those corresponding objects. Mutating methods change existing objects, which means that any variables pointing to the mutated object will also be affected. 

The `puts y` method call displays the results of the mutating method called inside of the method definition. `y` contains a reference to the original string object that was passed in as an argument and modified by the shovel operator; in other words, it points to the same object that was mutated by the method.

The output is:

```
ab
```

This code demonstrates:
- variable scope of a method definition and how variables in outer code can be modified form within methods when passed in as arguments and mutating methods are called on these objects
- Ruby's pass by reference value behaviour: the method receives a reference to the same object that `y` points to; changes to objects through the reference are visible when examining an object through any of its references (i.e. any variables pointing to the modified object see these changes)

### Example 9

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def change_name(name)
  name = 'bob'      # does this reassignment change the object outside the method?
end

name = 'jim'
change_name(name)
puts name
```

The variable `name` is initialised with a reference to the string object `'jim'`. The `change_name` method is called and passed the string object `'jim'` as argument.

Methods create their own scope: variables initialised in the outer code cannot be accessed or modified unless they are passed in as arguments and mutating methods are called on the corresponding objects.

In the method definition, the local variable `name` is bound to the string object `'jim'` to which the outer variable passed as an argument, also called `name`, is a reference. The expression `name = 'bob'` is evaluated: the method's locally scoped variable `name` is reassigned to a new string object `'bob'`. Unlike mutating operations which change existing objects themselves, this expression is a reassignment, which creates a new string object, and the inner variable `name` now contains a different reference to this new string. The original object that was passed in as an argument is not affected by the reassignment operation, and any references to the original object remain unchanged as well, including the outer variable `name`.

The return value of the method is the same as the evaluated result of the last (and only) expression in the method body, `name = 'bob'`, which evaluates to `'bob'`. Thus `change_name(name)` returns `'bob'`.

The `puts name` method call prints the value of its argument `name` — in this case, `name` contains a reference to the original string object `'jim'` that was initialised in the outer scope. It is not affected by the reassignment operation in the method.

The output is:

```
jim
```

And the return value of the entire code is the result of the last evaluated expression `puts name`, which is `nil`, since `puts` returns `nil`.

This code demonstrates:
- Ruby's pass by reference value behaviour: the reference to the object is passed in as an argument to a method, but the operation inside the method will determine what happens to that object and its reference
- reassignments vs mutation: reassignments create new objects and change what a variable references, while mutating operations modify existing objects and any variables pointing to the object remain unchanged
- variable scope of a method definition: a method definition creates its own scope and variables outside of the method can only be accessed and modified if they are passed in as arguments and mutated by the method

### Example 10

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def cap(str)
  str.capitalize!   # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name
```

The variable `name` is initialised with a reference to the string object `"jim"`. The `cap` method is called and passed the string object `"jim"` as an argument.

Methods create their own scope: variables initialised in the outer scope cannot be accessed or modified unless they are passed in as arguments and mutating methods are called on those corresponding objects.

Inside the method definition, the local variable `str` is bound to the same string object `"jim"` to which the outer variable `name` is a reference. The `capitalize!` method is called on `str`, which mutates the string's contents to `"Jim"`. Unlike assignment operations that create new strings and change what a variable references, `str.capitalize!` is a mutating operation which means that the original object itself is modified, and any references to the same object will see this change, including the outer variable `name`. If the non-mutating `capitalize` was called on `str`, then the original object would remain unchanged and instead `str` would be bound to a new string object (and the variable is disconnected from the original reference).

The return value of the method is the same as the evaluated result of the last (and only) expression in the method body `str.capitalize!`, which is `"Jim"`. Thus `cap(name)` returns `"Jim"`.

The `puts name` method call outputs its argument `name`, which points to the string object `"Jim"` that has been mutated by the `cap` method invocation.

The output is:

```
Jim
```

The return value of the entire code snippet is the result of the last evaluated expression `puts name`, which is `nil`, since `puts` always returns `nil`.

This code demonstrates:
- Ruby's pass by reference value behaviour: when a method is called, a reference to the object is passed in as an argument, and what happens to the object and any of its references is determined by the operations inside the method
- Variable scope of a method definition: outer code variables can only be accessed and modified from within a method if they are passed in as arguments and mutating methods are called on these objects
- Mutating methods (like `capitalize!`) that modify objects affect any of its references: destructive changes are visible when examining variables that point to the same object
- Mutating methods vs non-mutating operations/methods

### Example 11

What is `arr`? Why? What concept does it demonstrate?

```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr[1] = 5
arr
```

On the first two lines, variables `a` and `b` are initialised with references to two different array objects, `[1, 3]` and `[2]`, respectively. On line 3, `arr` is initialised with a reference to a nested array containing the arrays referenced by `a` and `b`—this evaluates to `[[1,3], [2]]`.

`arr[1] = 5` is evaluated: `Array#[]=` is a setter method that (re)assigns an object to the the element at the index specified by the argument—the element at index 1, which is `[2]`, is replaced by the integer `5`. While arrays are mutable objects and setter methods can modify the elements in the array, it's important to note that reassignment of an element is occurring, not a mutation of the element itself. (`b` still references the original array element `[2]`.)

On the last line, `arr` returns the modified array, which is `[[1, 3], 5]`.

(From LSBot:)

This code demonstrates several important concepts:1.  Variables as references to objects  
2.  Element assignment in arrays using the `Array#[]=` method  
3.  The distinction between modifying an element in an array versus replacing it entirely  
4.  How element assignment affects nested arrays without changing the original objects (`b` still references `[2]` even though `arr` no longer contains that array)


### Example 12

[Link to example](https://launchschool.com/lessons/c53f2250/assignments/1a6a2665)

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup

arr2.map! do |char|
  char.upcase
end

puts arr1
puts arr2
```

The variable `arr1` is initialised with a reference to the array object `["a", "b", "c"]`, and the variable `arr2` is initialised with a reference to the duplicated array resulting from the `dup` method called on `arr1`. The `dup` method duplicates the values of that object it's called on, with the important distinction that it does not copy the reference. Thus `arr1` and `arr2` point to different array objects; even though the arrays appear to look the same, the objects are held in different address spaces in memory (this can be shown by calling `object_id` on the arrays).

The destructive `map!` method is called on `arr2` and passed a block. In each iteration, the block parameter `char` is assigned the current element of the array and then evaluates `char.upcase`, which returns a new string with uppercase characters. The block's return value is the result of the last evaluated expression, which is the transformed all capitals string. The `map!` method replaces the element with the block's return value, so the array referenced by `arr2` is now `["A", "B", "C"]`.

The `puts arr1` and `puts arr2` method calls will output the elements of each array in a newline and with the quotes removed. (The return value of this code is the value of the last evaluated expression, which is `nil` because `puts` returns `nil`.) The output shows that `arr1` and `arr2` do not reference the same array object: `dup` only returned a shallow copy of the array object it was called on (not the references to the object(s)), and  the mutating method `map!` modified `arr2` only.

The output is:

```
a
b
c
A
B
C
```