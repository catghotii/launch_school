### [Variables as Pointers](https://launchschool.com/books/ruby/read/more_stuff#variables_as_pointers)

We'll take a deeper look at variables in this section, and specifically how they act as pointers to an **address space** in memory. That is, the variable doesn't actually contain the value. Instead, it contains a pointer to a specific area in memory that contains the value. This is a concept that confuses a lot of new programmers, and it's also one of the most important concepts to understand. The easiest way to understand variables as pointers is to look at some examples.

```ruby
a = "hi there"
b = a
a = "not here"
```

What is `b` in the above code? Think about it for a second. What about the code below?

```ruby
a = "hi there"
b = a
a << ", Bob"
```

What is `b` in this example? If you tried both code snippets in `irb` (if you didn't, you should before continuing), you'll see that `b` doesn't reflect the value of `a` in the former example, but does so in the second example. Why is this?

To understand the difference in the above two code snippets, you need to understand that **variables are pointers to physical space in memory**. In other words, variables are essentially labels we create to refer to some physical memory address in your computer. In the first example, this is what happened:

![Variables as Pointers 1](https://d2aw5xe2jldque.cloudfront.net/books/ruby/images/variables_pointers1.jpg)

From the above diagram, we can see that the code `a = "not here"` reassigned the variable `a` to a completely different address in memory; it's now pointing to an entirely new string. This is what the `=` operator does. It's important to understand that different memory space can in fact hold the same value, but they are still different places in memory. For example, if our last line of code was `a = "hi there"`, the result would still be the same: `a` and `b` in that case would still point to _different_ addresses in memory; they would just happen to have the same value.

Now let's see what the second snippet of code did.

![Variables as Pointers 2](https://d2aw5xe2jldque.cloudfront.net/books/ruby/images/variables_pointers2.jpg)

Interesting! The line of code `a << ", Bob"` did **not** result in reassigning `a` to a new string. Rather, it mutated the caller and modified the existing string, which is also pointed to by the variable `b`. This explains why in this code, `b` reflects the changes to `a` - they're both pointing to the same thing.

This is the major point of this section: some operations mutate the address space, while others simply make the variable point to a different address space.

This also applies to variables that point to arrays, hashes, or any data structure that has methods that mutate the caller or one or more of its arguments. If you call a method that mutates the caller or arguments, it will change the value in that object's address space, and any other variables that also point to that object will be affected. Therefore, always pay attention to whether your variables are pointing to the same object (address space) or if they are dealing with copies that occupy different address spaces.

Play around with some examples in `irb`. Some examples you can try are:

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
```

What are `a`, `b` and `c`? What if the last line was `c = a.uniq!`?

```ruby
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)
```

What is `a` after the `test` method returns? Did the method modify the value of `a`? Suppose we called `map!` instead of `map` from within `test`. Would that have any effect on the value of `a`?

When we use variables to pass arguments to a method, we're essentially assigning the value of the original variable (`a` in this case) to a variable inside the method (`b`). This is equivalent to executing `b = a`. Inside the method, the operations we perform on the `b` variable determine whether the value of `a` will change. Some operations, like `map`, will have no effect on `a`. Others, like `map!` will mutate the value assigned to `a`.

This is all you need to know for now and you may find this recorded [workshop](https://www.youtube.com/watch?v=PnWhlKRORIo) useful to watch.

It's almost guaranteed that you'll run into bugs in the future related to this topic, so the important thing here isn't to memorize the rules, but to understand the concept and be able to jump into `irb` to refresh your memory.


### variables as pointers

- variables act as pointers to an **address space** in memory
- the variable doesn't actually contain a value, instead is points to a specific area (a physical, address space!) in memory that contains a value
- important to understand that some operations (or methods!) mutate the address space, while others simply change where a variable is pointing to (i.e. a different address space)
- also: variables that point to arrays/hashes/data structures that have methods that mutate the caller or its arguments
	- --> possibly mutate the object in the address space
	- --> any variables pointing to the same address space will also be affected
	- *!!!* pay attention to whether variables are pointing to the same object (address space) or copies that occupy different address spaces

```ruby
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)

p a
```

### LSBot

**Variables as Pointers in Ruby**

**Definition and Key Characteristics**

In Ruby, variables don't actually contain values—they contain references (or pointers) to objects in memory. When you assign a value to a variable, you're creating a reference to an object, not storing the object itself in the variable.

Key characteristics:

•   Variables are labels that point to objects in memory 
•   Multiple variables can point to the same object 
•   When you reassign a variable, you change what it points to, not the object itself 
•   Whether an object can be modified depends on its mutability, not the variable pointing to it

**Common Use Cases and Scenarios**

1.  ​**Working with collections**​: Understanding pointers helps when manipulating arrays and hashes 
2.  ​**Method parameters**​: Knowing how objects are passed to methods helps predict behavior 
3.  ​**Avoiding unintended modifications**​: Prevents accidentally modifying objects referenced by multiple variables 
4.  ​**Memory efficiency**​: Multiple variables can reference the same object without duplicating it

**Code Examples**

**Example 1: Multiple Variables Pointing to the Same Object**

```ruby
# Both a and b point to the same array object
a = [1, 2, 3]
b = a

# Modifying the array through b also changes what a points to
b << 4
puts a.inspect  # Output: [1, 2, 3, 4]
puts b.inspect  # Output: [1, 2, 3, 4]

# Reassigning b doesn't affect a
b = [5, 6, 7]
puts a.inspect  # Output: [1, 2, 3, 4]
puts b.inspect  # Output: [5, 6, 7]
```

**Example 2: Immutable vs. Mutable Objects*

```ruby
# Strings are mutable
str1 = "hello"
str2 = str1
str2.upcase!  # Mutating method with !
puts str1      # Output: "HELLO" (str1 is affected)
puts str2      # Output: "HELLO"

# Integers are immutable
num1 = 5
num2 = num1
num2 += 2     # Creates a new object (7) and points num2 to it
puts num1      # Output: 5 (unchanged)
puts num2      # Output: 7
```

**Common Pitfalls and Misconceptions**

1.  ​**Assuming reassignment mutates the object**​: Reassignment (x = something) changes what the variable points to, not the object itself.
2.  ​**Confusing mutable vs. immutable objects**​: Some Ruby objects (like integers, symbols, and true/false) are immutable and cannot be changed. Others (like arrays, hashes, and strings) can be modified.
3.  ​**Misunderstanding method behavior**​: Methods ending with `!` typically mutate the original object, while their non-`!` counterparts usually return a new object without changing the original.
4.  ​**Forgetting about object duplication**​: If you need a separate copy of an object, use methods like `dup` or `clone` rather than simple assignment.
5. **Object passing confusion**​: Ruby is neither purely "pass by value" nor "pass by reference"—it's more accurately described as "pass by reference value" or "pass by object reference."

For a deeper understanding of how variables work as pointers in Ruby, you can read more in the [Variable References and Mutability of Ruby Objects](https://launchschool.com/blog/references-and-mutability-in-ruby) and [Object Passing in Ruby](https://launchschool.com/blog/object-passing-in-ruby) articles.

### My Summary

Variables in Ruby do not hold object values (with a few exceptions, most notably variables bound to integers) but rather contain a reference to objects in address space in memory.

In an assignment with a variable name on the left and an object on the right, the variable receives a reference to the object. In an assignment from one variable to another, the variable on the left receives a copy of the reference stored in the variable on the right, with the result that both variables now contain references to the same object.

```ruby
str = "Hello"
abc = str
p abc # "Hello"
```

Reassignment operations change what the variable points to, not the object itself. In other words, new objects are created and therefore the variable will point to that new object.

```ruby
str = "Hello"
abc = str
str = "Goodbye"
puts abc # Hello
puts str # Goodbye
```

The fact that variables hold references to objects has implications for operations that change/mutate objects: if an operation mutates an object, any variables that contain references to this object will also be affected; they will point to the modified object.

Example of mutating operation:

```ruby
def say_goodbye(str)
  abc = str # abc receives a copy of the reference to the object contained in the local variable str
  str.replace("Goodbye") # mutating method called on the reference to the object contained in str
  puts abc # => Goodbye # original object has been mutated
  puts str # => Goodbye
end

string = "Hello"
say_goodbye(string)
puts string # Goodbye # original object has been mutated
```

In the above code, the variable `string` is initialised to reference the string object `"Hello"`. On line 9, the `say_goodbye` method is called and a reference to the string object contained in `string` is passed as an argument.

Inside the method, local variable `abc` receives a copy of the reference to the string object that was passed in as an argument. The `replace` method is called on the `str` local variable, which replaces the contents of the string object `"Hello"` with `"Goodbye"` - this is a mutating method, which modifies the original object permanently.

When `puts abc` is called, the output shows that there has been a modification to the original string object - `"Goodbye"`.  Even though the mutating method `replace` was called on `str`, it also causes a cahnge to the object to which the reference in `abc` refers - printing `abc` and `str` shows the same result: `"Goodbye"`

On line 10, printing the `string` variable, which was initialised in the outer code, also displays this change: the original string object has been mutated.

```ruby
def say_goodbye(str)
  abc = str
  str = "Goodbye"
  puts abc
  puts str
end

string = "Hello"
say_goodbye(string)
puts string

# Output:
# Hello
# Goodbye
# Hello
```

In this version of the code, we can see that reassignment is not a mutating operation. 

#### my summary, again

Variables contain references to objects in address space in memory, not object values themselves. In an assignment where the variable is on the left and an object on the right, the variable receives a reference to the object. In an assignment from one variable to another, the variable on the left receives a copy of the reference contained in the variable on the right, with the result that both variables contain references to the same object.

The fact that variables hold references to objects has implications for operations that mutate objects.