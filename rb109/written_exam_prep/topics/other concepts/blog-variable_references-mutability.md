
https://launchschool.medium.com/variable-references-and-mutability-of-ruby-objects-4046bd5b6717

## Variables and References

- an object is a bit of data that has some sort of state — sometimes called a value — and associated behaviour
- it can be simple (boolean object) or complex (like an object that represents database connection)

Objects can be assigned to variables, like this:

```irb
>> greeting = 'Hello'
=> "Hello"
```

- This tells Ruby to associate `greeting` with the string object whose value is `'Hello`
- In Ruby, `greeting` is said to *reference* (or point to) the string object
	- also okay to say: the variable is *bound* to the string object
- Internally: the string object represented by the literal `'Hello'` is assigned to a variable that has the name `greeting`
	- causes the variable `greeting` to reference the string object whose value is `'Hello'`
	- does so by storing the object id of the string
	- every object in Ruby has a unique object id, which can be retrieved by calling `object_id` on the object

Assign `greeting` to a new variable:

```
>> whazzup = greeting  
=> "Hello"

>> greeting  
=> "Hello"

>> whazzup  
=> "Hello"

>> greeting.object_id  
=> 70101471431160

>> whazzup.object_id  
=> 70101471431160
```

- both object ids are the same
- this demonstrates that both `greeting` and `whazzup` not only reference a string with the same value, but are in fact reference to the *same* string (`greeting` and `whazzup` are aliases for each other)

```irb
>> greeting.upcase!  
=> "HELLO"

>> greeting  
=> "HELLO"

>> whazzup  
=> "HELLO"

>> whazzup.concat('!')  
=> "HELLO!"

>> greeting  
=> "HELLO!"

>> whazzup  
=> "HELLO!"

>> greeting.object_id  
=> 70101471431160

>> whazzup.object_id  
=> 70101471431160
```

- since both variables are associated with the same object, using either variable to mutate the object is reflected in the other variable.
- the object id does not change

## Reassignment

Assign a new object to one of these variables:

```irb
>> greeting = 'Dude!'  
=> "Dude!"

>> puts greeting  
=> "Dude!"

>> puts whazzup  
=> "HELLO!"

>> greeting.object_id  
=> 70101479528400

>> whazzup.object_id  
=> 70101471431160
```

- `greeting` and `whazzup` no longer refer to the same object: they have different values and different object ids
- `greeting` is bound to the string object whose value is `'Dude!'`, while `whazzup` continues to reference the string object whose value is `HELLO!`

- ***reassignment to a variable does not mutate the object referenced by that variable***
- ***instead, the variable is bound to a different object***
- ***the original object is merely disconnected from the variable***

## Mutability

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

## brief intro to object passing

