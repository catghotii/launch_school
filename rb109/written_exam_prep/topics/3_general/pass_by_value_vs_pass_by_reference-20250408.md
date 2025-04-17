
## LSBot

**Pass by Value vs Pass by Reference in Ruby**

**Definitions and Key Characteristics**

**Pass by Value**​: When an argument is passed to a method by value, the method receives a ​_copy_​ of the original object. Any operations performed on this object within the method have no effect on the original object outside the method.

**Pass by Reference**​: When an argument is passed to a method by reference, the method receives a ​_reference_​ to the original object. Operations performed on this object within the method can affect the original object outside the method.

**Ruby's Approach**

Ruby's behavior is often described as "pass by reference value" or "pass by value of the reference" because it exhibits characteristics of both approaches:

1.  When you pass an object to a method, Ruby passes a reference to that object (not a copy).  
2.  However, when you reassign a variable inside a method, you're only reassigning the local variable, not changing the original reference.

**Code Examples**

**Example 1: Reassignment (showing pass by value-like behavior)**

```ruby
def change_name(name)
  name = 'bob'  # reassignment only affects the local variable
end

name = 'jim'
change_name(name)
puts name  # => jim (unchanged)
```

In this example, the original `name` variable remains unchanged because the reassignment inside the method only affects the method's local parameter.

**Example 2: Mutation (showing pass by reference-like behavior)**

```ruby
def capitalize_name(name)
  name.capitalize!  # mutates the actual object
end

name = "jim"
capitalize_name(name)
puts name  # => Jim (changed!)
```

Here, the original `name` variable is modified because the method performed a mutating operation (`capitalize!`) on the object that `name` references.

**Example 3: Contrasting non-mutation vs mutation**

```ruby
def non_mutating_method(str)
  str.capitalize   # returns a new string, doesn't change original
end

def mutating_method(str)
  str.capitalize!  # modifies the original string
end

word = "hello"
non_mutating_method(word)
puts word  # => hello (unchanged)

mutating_method(word)
puts word  # => Hello (changed!)
```

**Common Use Cases**

1.  ​**Data transformation**​: When you want to transform data without modifying the original (use non-mutating methods).  
2.  ​**State modification**​: When you intentionally want to modify the state of an object across your program (use mutating methods).  
3.  ​**Method chaining**​: Creating methods that return new objects allows for elegant method chaining.

**Common Pitfalls and Misconceptions**

1.  ​**Misconception: "Ruby is pass by value" or "Ruby is pass by reference"**:
Ruby doesn't fit neatly into either category; it's more accurate to say Ruby passes references by value.
2. ​**Pitfall: Unintended mutation**:
Accidentally using mutating methods when you intended to preserve the original object.3.
3. **Misunderstanding method return values**
Confusing methods that return new objects (like `capitalize`) with methods that modify in place (like `capitalize!`).
4.  ​**Mutation complexity with nested objects**  
Nested collections can be especially tricky because you might mutate inner elements while leaving the outer structure unchanged.

Understanding the distinction between reassignment and mutation is crucial for predicting how your code will behave. When in doubt, you can always test your code in IRB to see exactly what happens.

For more detailed explorations of these concepts, you can review the [Object Passing in Ruby - Pass by Reference or Pass by Value](https://launchschool.com/blog/object-passing-in-ruby) blog post from Launch School.

## Core notes

- disagreement among Rubyists whether Ruby is "pass by reference" or "pass by value"
- doesn't matter what term you use as long as you understand how to invoke methods with the behaviour you expect.

- the discussion stems from trying to determine what happens to objects when they are passed into methods
- in most programming languages, there are two ways of dealing with objects passed into methods:
	- treat them as "references" to the original object
	- OR as "values" which are copies of the original

#### What does pass by "value" mean?

- traditionally, (like in the traditional language C), when you "pass by value", the method only has a *copy* of the original object
- operations performed on the object within the method have no effect on the original object outside of the method.

- some Rubyists say Ruby is "pass by value" because reassigning the variable within the method doesn't affect the object outside the method.
	- e.g.

```ruby
def change_name(name)
  name = 'bob'      # does this reassignment change the object outside the method?
end

name = 'jim'
change_name(name)
puts name           # => jim
```

^^ e.g.
- two different local variables named `name`:
	- one scoped within the method
	- one in the main scope
- this is NOT variable shadowing because the main scope variable is not accessible to the method
- within the method, we could have named the variable something other than `name`

the question is: when the main scope `name` is passed into the method, via `change_name(name)`, did we pass in a reference or did we pass in the value?

- it looks like it was passed by value, since re-assigning the variable only affected the method-level variable, and not the main scope variable.

#### What does pass by "reference" mean?

- however, it's not quite that simple
- if Ruby were purely "pass by value", there should be no way for operations within a method to cause changes to the original object
- BUT you can plainly do this in Ruby

e.g. destructive method call

```ruby
def cap(str)
  str.capitalize!   # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name           # => Jim
```

- this implies Ruby is "pass by reference" because operations within the method affected the original object.
- However, not all operations affect the original object, as we've just seen, and as demonstrated in the modified code below:

e.g. non-destructive method call

```ruby
def cap(str)
  str.capitalize
end

name = "jim"
cap(name)
puts name           # => jim
```

#### What Ruby does

- Ruby exhibits a combination of behaviours from both "pass by value" and "pass by reference".
- some people call this *pass by value of the reference* OR *call by sharing*
- whatever you call it, the most important concept to remember:
	- ***when the operation within the method mutates the caller or argument, it will affect the original object***

which operations mutate the caller or argument?
- can only know through usage and reading documentation whether a method is destructive or not (i.e. mutates the calling object or its arguments)
- typically in Ruby, methods with a `!` signify a destructive behaviour, however this is merely convention and not a syntactic rule

examples:

**example 1**
`Arary#<<` - destructive, but doesn't have a `!`

```ruby
def add_name(arr, name)
  arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect          # => ["bob", "kim", "jim"]
```

- ^ sending the `names` array through the `add_name` method permanently changed the original `names` array

**example 2**
re-assignment is NOT considered a destructive operation

Also, study the below code and remember that re-assignment is not considered a destructive operation.

```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect          # => ["bob", "kim"]
```

Notice how the above code doesn't change the `names` array. Note that if we made a very tiny change to the above code, the result is dramatically different:

```ruby
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect          # => ["bob", "kim", "jim"]
```

^^the differences between the two codes:
- changed the `+` to a `<<` and moved `name` out of an array

- this implies that when we use `+` to concatenate two arrays together --> *returns a new array* and NOT mutating the original
- however, when we use `<<` to append a new value into an array --> *mutating the original array* and not returning a new array

It's a guarantee that you will run into this issue over and over in your programming career. Learn to train your brain to recognize this as a potential problem, and you'll be able to debug future problems much faster.

#### Variables as Pointers

review section: [Variables as Pointers](https://launchschool.com/books/ruby/read/more_stuff#variables_as_pointers)

variables as pointers
  
key takeaways
- variables are pointers to an address space in memory (they do not necessarily contain data)  
- if you call a method on an object that mutates its calling object or arguments, then it modifies the object in that address space, and any other variables pointing to that object will be affected  
- some operations mutate the address space, while others simply make the variable point to a different address space

- if a destructive method is calling onto an object (i.e. the method call mutates its calling object or arguments), the object in that address space is mutated/permanently modified, and any variables pointing to that address space will also be affected
- some operations mutate the address space, while others simply make the variable point to a different address space

## Articles

Along with that, take some time to read the following articles, where these concepts are explored further:

- [Variable References and Mutability of Ruby Objects](https://launchschool.com/blog/references-and-mutability-in-ruby)
- [Mutating and Non-Mutating Methods in Ruby](https://launchschool.com/blog/mutating-and-non-mutating-methods)
- [Object Passing in Ruby - Pass by Reference or Pass by Value](https://launchschool.com/blog/object-passing-in-ruby)

Don't skip over this, as these are some of the most important concepts to understand in your journey of learning to program.

# my notes

**Pass by value**

**Pass by reference**

**Pass by reference value (Ruby's approach)**

### Code examples

**Pass by value**

**Pass by reference**

**Pass by reference value (Ruby's approach)**