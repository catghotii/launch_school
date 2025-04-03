# Let's take a look at another example with a small difference in the code:

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# Answer:

# All three variables will return the same object_id value.

# Even though assignment occurs separately for variables `a` and `b`, unlike strings, Integer objects are immutable, which means that the value of an Integer object cannot be changed.

# Integer objects in Ruby are immediate values, which means in an assignment of an Integer object to a variable, the variable holds the value itself rather than a reference to it.

# As Integer objects are represented as immediate values, it doesn't matter how many variables an Integer may be assigned to; the immediate value is always exactly the same.