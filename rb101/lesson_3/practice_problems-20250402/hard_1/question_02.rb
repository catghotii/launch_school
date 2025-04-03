# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# On line 2, `informal_greeting` receives a copy of the reference to the `:a` key's value (a string object "hi") from inside of the `greetings` hash.

# On line 3, the shovel operator is called on this object (to which `informal_greeting` is a reference) and passed the string " there". This operation mutates the original object to "hi there", and therefore any variables referencing this object are also affected. In this case, the variable `greetings` would also be affected. Keep in mind that while the greetings variable contains a reference to a hash object, the contents of that hash object contain other key-value pair objects that are mutable—as the string object in this hash is mutated, the entire hash is also mutated.

# The last line of code will print {:a=>"hi there"}

# LS:

# The output is {:a=>"hi there"}. The reason is because informal_greeting is a reference to the original object. The line informal_greeting << ' there' was using the String#<< method, which modifies the object that called it. This means that the original object was changed, thereby impacting the value in greetings. If instead of modifying the original object, we wanted to only modify informal_greeting but not greetings, there are a couple of options:

#     we could initialize informal_greeting with a reference to a new object containing the same value by informal_greeting = greetings[:a].clone.
#     we can use string concatenation, informal_greeting = informal_greeting + ' there', which returns a new String object instead of modifying the original object.

