=begin

Take a look at the following code:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

What does this code print out? Think about it for a moment before continuing.

If you said that code printed

Alice
Bob

you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

What does this print out? Can you explain these results?

---

Answer:

The output will be:

BOB
BOB

On line 1, the variable `name` is initialised with reference to the string object "Bob". On line 2, the variable `save_name` receives a copy of the reference to which `name` is a reference: both variables point to the same string object "Bob".

When the `upcase!` method is called on `name`, it mutates the string object to "BOB". Even though this mutating method is called on `name`, any variables that also have a reference to the original string object will also be affected. Thus printing `name` and `save_name` will have the same result.

=end

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name