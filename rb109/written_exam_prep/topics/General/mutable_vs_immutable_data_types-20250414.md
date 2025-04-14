
## LSBot

**Definition and Key Characteristics**

**Mutable data types**​ can be changed after they are created. When you perform operations on mutable objects, the original object can be modified in place without creating a new object.

**Immutable data types**​ cannot be changed after they are created. Operations on immutable objects always create new objects rather than modifying the original.

In Ruby:
•   ​**Mutable types**​: Arrays, Hashes, custom objects  
•   ​**Immutable types**​: Numbers, Booleans, Symbols, `nil`  
•   ​**Special case**​: Strings are mutable, but many string methods return new strings

**Common Use Cases and Scenarios**

Understanding mutability is crucial when:
1.  ​**Passing objects to methods**​: If you pass a mutable object to a method that modifies it, the original object will change.
2.  ​**Using objects as hash keys**​: Immutable objects make reliable hash keys since their values won't change unexpectedly.
3.  ​**Managing memory efficiently**​: Mutating existing objects can be more memory-efficient than creating new objects.
4.  ​**Working with constants**​: Constants should generally reference immutable objects or at least not be mutated, even though Ruby technically allows it.

**Code Examples**

**Example 1: Demonstrating mutability with arrays**

```ruby
def add_element(arr)
  arr << 4
end

original = [1, 2, 3]
add_element(original)

puts original.inspect  # [1, 2, 3, 4] - original array was modified
```

In this example, the array is mutable, so when we pass it to the method and append an element, the original array is modified.

**Example 2: Comparing string operations (some mutating, some non-mutating)**

```ruby
# Mutating operation
str = "hello"
str << " world"
puts str  # "hello world" - original string modified

# Non-mutating operation
str = "hello"
new_str = str + " world"
puts str      # "hello" - original unchanged
puts new_str  # "hello world" - new string created
```

This example shows how some operations mutate the original string (`<<`), while others create new strings (`+`).

**Common Pitfalls and Misconceptions**

1.  ​**Misconception: All Ruby methods that modify an object end with an exclamation mark (!)**    

Reality: While many destructive methods use `!`, not all do. For example, `Array#<<` is mutating but doesn't use `!`. The `!` typically indicates there's a safer non-mutating version of the method.

2.  ​**Pitfall: Freezing only affects the object, not its contents**

```ruby
arr = [1, 2, [3, 4]]
arr.freeze

arr << 5        # Error - can't modify frozen array
arr[2] << 5     # Works! [1, 2, [3, 4, 5]] - nested array can still be modified
```

3.  ​*Pitfall: Unexpected variable reassignment vs. mutation*

```ruby  
a = [1, 2, 3]  
b = a  
 
# This mutates the array that both a and b point to  
a << 4  
puts b.inspect  # [1, 2, 3, 4] - b reflects the change  
 
# This reassigns a to a new array, b still points to the original  
a = [5, 6, 7]  
puts b.inspect  # [1, 2, 3, 4] - b is unchanged  
```

Understanding the distinction between mutable and immutable data types is essential for writing predictable Ruby code and avoiding unexpected side effects, especially when dealing with methods that might modify their arguments.

For more in-depth information, you can refer to the [Variable References and Mutability of Ruby Objects](https://launchschool.com/blog/references-and-mutability-in-ruby) and [Mutating and Non-Mutating Methods in Ruby](https://launchschool.com/blog/mutating-and-non-mutating-methods) articles.

## Notes from article

- Mutable objects can be mutated: their values can be altered
- Immutable objects cannot be mutated: they can only be reassigned

### Immutable objects

- In Ruby, numbers and boolean values are immutable
- Once we create an immutable object, we cannot change it

```irb
>> number = 3  
=> 3

>> number  
=> 3

>> number = 2 * number  
=> 6

>> number  
=> 6
```

- This is a reassignment, which does not mutate the object
- Instead, it binds a different object to the variable

- In this case, a new integer object is created with the value of `6` which is assigned to `number`
- There are no methods available that let you mutate the value of any immutable object
- All you can do is reassign the variable so it references a different object; this disconnects the original object from the variable

```irb
>> a = 5.2  
=> 5.2

>> b = 7.3  
=> 7.3

>> a  
=> 5.2

>> b  
=> 7.3

>> a.object_id  
=> 46837436124653162

>> b.object_id  
=> 65752554559609242
```

The float values `5.2` and `7.3` are assigned to the variables `a` and `b`. These values and their object ids are displayed when `object_id` is called on the variables. The object ids differ, so the variables reference different objects.

```irb
# b is assigned to a

>> a = b  
=> 7.3

>> a  
=> 7.3

>> b  
=> 7.3

>> a.object_id  
=> 65752554559609242

>> b.object_id  
=> 65752554559609242
```

irb displays the same value and the same object ids for both `a` and `b`. The object that originally held the value `5.2` is no longer available through either `a` or `b`.

```irb
# try to alter the object

>> b += 1.1  
=> 8.4

>> a  
=> 7.3

>> b  
=> 8.4

>> a.object_id  
=> 65752554559609242

>> b.object_id  
=> 32425917317067566
```

On the first line, the object referenced by `b` is incremented by `1.1`, which yields `8.4` and, as we can see, `b` is also set to `8.4`. `a` has not been changed, and still references the `7.3` object. But, `b` now references a completely new object.

Though we changed the value associated with `b`, we didn't mutate the object — the object is immutable. Instead, `+=` created a brand new float object and bound `b` to the new object.

Simple assignment never mutates an immutable object:

```
>> a = 5.5  
=> 5.5

>> a.object_id  
=> 49539595901075458
```

Instead of mutating the original object, a new float is created and `a` is bound to the new object.

### Mutable objects

- Most objects in Ruby are mutable; they are objects of a class that permit changes to the object's state in some way
- As long as you can mutate an object, it is mutable.

- A *setter* method is a method defined by a Ruby object that allows a programmer to explicity change the value of part of an object.
- Setters always use a name like `something=`

- Array element setters e.g. `Array:[]=` 

```irb
>> a = [1, 2, 3, 4, 5]  
>> a[3] = 0       # calls setter method  
>> a # => [1, 2, 3, 0, 5]
```

Consider Ruby Array objects; you can use index assignment to alter what object is referenced by an element:

```irb
>> a = %w(a b c)  
=> ["a", "b", "c"]

>> a.object_id  
=> 70227178642840

>> a[1] = '-'    # calls `Array#[]=` setter method  
=> "-"

>> a  
=> ["a", "-", "c"]

>> a.object_id  
=> 70227178642840
```

- this demonstrates that we can mutate the array that `a` refers to. However, it doesn't create a new array since the object id remains the same.
- `a` is a reference to an array, and in this case, that array contains three elements: each element is a reference to a string object
- when we assign `-` to `a[1]`, we are binding `a[1]` to a new string; we're mutating the array given by `a` by assigning a new string to the element at index 1 (`a[1]`).

Strings and other collection classes are similar in the way they behave:
- variables reference the collection (or string), and the collection contains reference to the actual objects in the collection