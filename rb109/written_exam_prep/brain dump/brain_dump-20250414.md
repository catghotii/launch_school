
### mutable vs immutable objects

Mutable objects can be changed — the values of objects can be modified, and any variables bound to the object remain unchanged; that is, variables that are bound to mutable objects keep the same reference when the object is modified by a mutating method

Immutable objects cannot be changed — instead, they are reassigned. When a variable is reassigned, a new object is created and the variable is bound to a different reference; the original reference is disconnected from the variable. Any variables containing the original reference are unaffected by reassignments.

Integers in Ruby are immutable objects, which means that the object cannot be changed once it is created.

###### code example

```ruby
a = 4.2
b = a
b += 2.7

puts a
puts b
```

`a` is initialised with a reference to the float object `4.2`. In the assignment of one variable to another, `b` receives a copy of the reference stored in `a`. Both variables contain references to the same float `4.2`.

`b += 2.7` is evaluated: the object referenced by `b` is incremented by `2.7`, which yields `6.9`, and this result is bound to `b`. This expression is a reassignment, not a mutating operation. Since numbers in Ruby are immutable objects that cannot be mutated, `+=` creates a new float object and binds `b` to the new object.

`a` still points to the original float `4.2`. The original reference is disconnected from `b`, so any variables containing references to the original reference (like `a`) are unaffected by reassignments.

`puts a` and `puts b` display the effects of these variables assignments and reassignments.

The output is:

```
4.2
6.9
```

### reassignment vs mutation

To understand reassignments and mutations, it's important to distinguish immutable objects from mutable objects.

In Ruby, mutable objects can be modified (or mutated) — any variables bound to these objects remain unchanged (they continue to point to the same object).

Immutable objects (like numbers) cannot be mutated — instead variables bound to these objects are reassigned to new objects. This means the original reference is disconnected from the variable, the variable is bound to a new object (it contains a different reference to the new object), and any variables containing the original reference are not affected (they continue to point to the original object).

Reassignments, and any assignment operations for that matter, create new objects, and therefore any variables containing the original reference remain unchanged.

```ruby
a = 1
b = a  # b receives a copy of the reference stored in a
a = 2  # a is reassigned to reference 2

puts a # 2 — the new object created by the reassignment operation
puts b # 1 — reassignment does not affect references to the original object
```

Mutating operations (or mutating methods) change the state of existing objects. This has important implications for variables holding references to the same object that's being mutated:

```ruby
animal = "cat"
pet = animal
animal.replace("sloth")

puts animal
puts pet
```

`animal` is initialised with a reference to the string object `"cat"`. `pet` receives a copy of the reference stored in `animal`, so both variables have references to the same string object `"cat"`. 

The mutating method `replace` is called on `animal`, which replaces the value of the string with its argument `"sloth"`. Since this is a mutating method, the original object is modified and any references to this object also see this change. This is why calling `puts pet` outputs `"sloth"`: even though the method was called on `animal`, the mutation to the string can be examined through any of its references, including `pet`.

The output is:

```
sloth
sloth
```

---

Mutating operations (or mutating methods) change the state of existing objects. This has important implications for variables holding references to the same object that's being mutated:

```ruby
animal = "cat"
me = animal
animal.replace("sloth")

puts animal
puts me
```

`animal` is initialised with a reference to the string object `"cat"`. `me` receives a copy of the reference stored in `animal`, so both variables have references to the same string object `"cat"`. 

The mutating method `replace` is called on `animal`, which replaces the value of the string with its argument `"sloth"`. Since this is a mutating method, the original object is modified and any references to this object also see this change. This is why calling `puts me` outputs `"sloth"`: even though the method was called on `animal`, the mutation of the string can be examined through any of its references, including `me`.

The output is:

```
sloth
sloth
```

## pass by...

**pass by value**

When an argument is passed to a method by value, the method receives a *copy* of the original object.
Any operations performed on this object within the method have no effect on the object outside of the method.

**pass by reference**

When an argument is passed to a method by value, the method receives a *reference* to the original object.
Operations performed on this object within the method can affect the original object outside of the method.

**pass by reference**

Ruby's pass by reference value behaviour: the method receives a reference of the original object, but the operations within the method determine what happens to the original object and its references outside of the method.

When an object is passed to a method, Ruby exhibits behaviours of both pass by value and pass by reference:

- When an argument is passed to a method, the method receives a reference to the original object.
- However, when reassignment occurs within the method, the local variable is reassigned, which does not change the original object.

Pass by value - when an argument is passed to a method, the method receives a copy of the original object: any operations performed on this object within the method have no effect on the original object

Pass by reference - when an argument is passed to a method, the method receives a reference of the original object: any operations performed on the object within the method can affect the original object outside of the method

Pass by reference value - when an argument is passed to a method, the method receives a reference of the original object, but the operations performed on the object within the method determine what happens to the original object outside of the method

Ruby:
- a method receives a reference to the original object
- mutating methods affect the original object and its references
- non-mutating operations (like reassignments or non-mutating methods) have no effect on the original object outside of the method

### code examples

##### pass by value

Ruby appears to pass by value when dealing with immutable objects, or when assignment operations or non-mutating methods occur in the method

```ruby
def change_name(name)
  name = 'Ruby'
end

name = 'Cat'
change_name(name)
puts name
```

The variable `name` is initialised with a reference to the string object `'Cat'`. The `change_name` method is called and passed the string object `'Cat'` as an argument.

Method definitions create their own scope: variables initialised in the outer scope cannot be accessed or modified from within the method unless they are passed in as arguments and mutating methods are called on those corresponding objects.

Inside the method definition, the local variable `name` is bound to the same string object `'Cat'` to which the outer variable with the same name `name` is a reference (essentially the method receives a reference to the same string object). The assignment operation `name = 'Ruby'` is evaluated: this is a reassignment operation, which creates a new string; the local variable `name` is disconnected from the original reference; and the variable now contains a different reference to the new string. Any references to the original string object `'Cat'` remain unchanged, including the outer variable `name`.

The return value of the method is the same as the result of the last expression in the method body `name = 'Ruby'`. `change_name(name)` returns the method's return value: `'Ruby'`.

The `puts name` method call outputs its argument `name`, which is a reference to the original string object `'Cat'`. The operations within the `change_name` method are non-mutating, therefore the original object that was initially passed in as an argument is not affected by the method call.

The output is:

```
Cat
```

##### pass by reference

- when a method is called and passed an argument, the method receives a *reference* to the original object. Any operations on the object in the method have an affect on the original object outside of the method.

