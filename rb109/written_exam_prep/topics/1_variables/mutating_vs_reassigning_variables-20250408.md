### My summary, brain only

Variables contain references to objects in address space in memory, not object values themselves. In other words, variables are merely point to an address space in memory that contains an object.

In an assignment where the variable is on the left and an object is on the right, the variable receives a reference to the object on the right. In an assignment from one variable to another, the variable on the left receives a copy of the reference that is contained in the variable on the right.

The fact that variables contain references to objects has implications for operations that change objects.

#### mutating values/objects

In operations that mutate objects, any variables that hold a reference to the mutated object will also be affected.

```ruby
str = "Hello"
abc = str
str.replace("Goodbye")
puts str
puts abc
```

In this example, calling the `replace` method on `str` mutates the contents of the string object `"Hello"` with its argument string `"Goodbye"`. These changes are visible when both `str` and `abc` are printed: even thought `replace` was called on `str`, they both point to the same object and print `"Goodbye"`, which is the newly mutated string object.

Calling `object_id` on `str` and `abc` would reveal that both variables hold references to the same str object.

#### reassigning variables

Reassignment changes what a variable points to, not the object itself.

Every time a variable is assigned/initialised, the variable is wiped clean and a new assignment is made.

```ruby
str = "Hello"
abc = str
str = "Goodbye"
puts abc
puts str
```

The second assignment to `str` gives a reference to a different string object "Goodbye". `str` and `abc` part company at this point: `abc` still points to the old string "Hello", while `str` points to the new string "Goodbye".

The semantics of references and (re)assignment have important implications for how things play out when a method is called with arguments:
- what does the method receive?
- and what can a method do with it?

### LSBot

**Mutating Variables vs Reassigning Variables****Definitions and Key Characteristics****Reassigning variables**​ means changing what object a variable points to. When you reassign a variable, you're making it reference a completely different object in memory.**Mutating variables**​ is actually a misleading term - we don't mutate variables, we mutate the objects that variables reference. Mutation means changing the content or state of an object without changing the object's identity or the variable's binding.**Common Use Cases****Reassignment**​ is useful when:•   You need a variable to reference a completely different object  
•   You want to preserve the original object for later use  
•   Working with methods that return new objects (like many string methods)**Mutation**​ is valuable when:•   You want to modify data in place to conserve memory  
•   Multiple variables reference the same object and should all see the change  
•   Working with collections that need to be gradually built or modified**Code Examples****Example 1: Reassignment vs. Mutation with Strings**

# ruby

# Reassignment
name = "john"
name = "john doe"  # Reassignment - points to a new string
puts name          # => "john doe"

# Mutation
name = "john"
name << " doe"     # Mutation - same string object modified in place
puts name          # => "john doe"

**Example 2: Multiple References and Mutation**

# ruby

# Reassignment doesn't affect other references
a = "hello"
b = a
a = "world"     # Reassignment - only affects variable a
puts a          # => "world"
puts b          # => "hello"

# Mutation affects all references
a = "hello"
b = a
a << " world"   # Mutation - affects the object that both a and b reference
puts a          # => "hello world"
puts b          # => "hello world"

**Common Pitfalls and Misconceptions**1.  ​**Confusing reassignment with mutation**​:<!---->

# ruby

   def change_name(name)
     name = "bob"     # This is reassignment, not mutation
   end
   
   name = "jim"
   change_name(name)
   puts name          # => "jim" (unchanged)

The reassignment inside the method only affects the method's local variable, not the original object.2.  ​**Thinking all methods are non-mutating**​:  
    Some methods modify objects, others don't. Method names ending with `!` often indicate mutation, but not always.3.  ​**Overlooking different behaviors with different data types**​:  
    •   Numbers, booleans, and `nil` are immutable in Ruby  
    •   Strings, arrays, and hashes are mutable  
    •   This affects how variables behave when passed to methods4.

![white_check_mark](https://a.slack-edge.com/production-standard-emoji-assets/14.0/apple-small/2705.png)![eyes](https://a.slack-edge.com/production-standard-emoji-assets/14.0/apple-small/1f440.png)![raised_hands](https://a.slack-edge.com/production-standard-emoji-assets/14.0/apple-small/1f64c.png)

[12:13](https://launchschool.slack.com/archives/D08J3DADQBW/p1744078408918119?thread_ts=1744078382.552099&cid=D08J3DADQBW)

**Misunderstanding assignment within collections**​:<!---->

# ruby  
  
   a = [1, 2, 3]  
   b = a  
   b[1] = 8       # This mutates the array, not reassigns b  
   puts a          # => [1, 8, 3]  

Element assignment (`b[1] = 8`) calls the `[]=` method, which mutates the array.Understanding the distinction between reassignment and mutation is critical when working with variables and passing objects to methods in Ruby. This concept is closely related to pass-by-reference vs. pass-by-value behavior, which is explained in detail in the [Object Passing in Ruby blog post](https://launchschool.com/blog/object-passing-in-ruby).