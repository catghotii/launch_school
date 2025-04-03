=begin

# Question 2

Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

    what is != and where should you use it?
    put ! before something, like !user_name
    put ! after something, like words.uniq!
    put ? before something
    put ? after something
    put !! before something, like !!user_name

# My answer

The ! and ? symbols are syntactical conventions in Ruby that signify two things:
- ! used at the end of a method name can signify that a method is destructive - that is, it mutates its calling object. 
- ? is a way of signifying a predicate when used at the end of a method name. A predicate is a way of saying if something is true or not; therefore for Ruby methods, the ? typically would indicate that a method returns a Boolean value of true or false.

As these symbols are syntactical conventions, they are not properties of actual Ruby syntax—that is, methods in Ruby (built-in or defined wtihin the program) can be destructive or return Boolean objects without requiring the suffix of either ! or ? respectively.

    1. what is != and where should you use it?
    - a comparison operator that means 'is not'
    - it should be used in a comparitive expression, and returns a Boolean object

    2. put ! before something, like !user_name
    - 'not'
    - in this example, it signifies 'not `user_name`', or the opposite of the object's Boolean equivalent

    3. put ! after something, like words.uniq!
    - when after something, the ! denotes a mutating method, although this is only a syntactical convention and not a property of Ruby syntax itself (i.e. not all mutating methods require the suffix ! in the method name)
    - in this example, the uniq! method would permanently modify the object referenced by the words variable

    4. put ? before something
    - used in a ternary operator for if...else

    5. put ? after something
    - denotes a predicate method, where the method evaluates whether the calling object is true, and returns a Boolean value
    - this is only a syntactical convention and not a required property of Ruby syntax methods

    6. put !! before something, like !!user_name
    - turns an object into their Boolean equivalent

# LS solution

Just to clarify, if you see ! or ? at the end of the method, it's actually part of the method name, and not Ruby syntax. Therefore, you really don't know what the method is doing, even if it ends in those characters -- it depends on the method implementation. The other uses are actual Ruby syntax:

    != means "not equals"
    ? : is the ternary operator for if...else
    !!<some object> is used to turn any object into their boolean equivalent. (Try it in irb)
    !<some object> is used to turn any object into the opposite of their boolean equivalent, just like the above, but opposite.

=end