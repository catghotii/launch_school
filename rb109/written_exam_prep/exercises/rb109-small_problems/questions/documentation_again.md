
# Class and Instance Methods

Locate the ruby documentation for methods `File::path` and `File#path` for version 2.7.8 of Ruby [here](https://ruby-doc.org/2.7.8/File.html#method-c-path) (newer versions of Ruby have changed the implementation of these methods, so be sure to follow the link provided). How are they different?

# Optional Arguments Redux

Assume you have the following code:

```ruby
require 'date'

puts Date.civil
puts Date.civil(2016)
puts Date.civil(2016, 5)
puts Date.civil(2016, 5, 13)
```

What will each of the 4 `puts` statements print?

# Default Arguments in the Middle

Consider the following method and a call to that method:

```ruby
def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
```

Use the Ruby documentation to determine what this code will print.

We are using "default positional arguments" here.

# Mandatory Blocks

The `Array#bsearch` method is used to search ordered `Array`s more quickly than `#find` and `#select` can. Assume you have the following code:

```ruby
a = [1, 4, 8, 11, 15, 19]
```

How would you search this `Array` to find the first element whose value exceeds `8`?

# Multiple Signatures

What do each of these `puts` statements output?

```ruby
a = %w(a b c d e)
puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }
```

# Keyword Arguments

What does this code print?

```ruby
5.step(to: 10, by: 3) { |value| puts value }
```

# Parent Class

Use irb to run the following code:

```ruby
s = 'abc'
puts s.public_methods.inspect
```

You should find that it prints a list of all of the public methods available to the String `s`; this includes not only those methods defined in the `String` class, but also methods that are inherited from `Object` (which inherits other methods from the `BasicObject` class and the `Kernel` module). That's a lot of methods.

How would you modify this code to print just the public methods that are defined or overridden by the `String` class? That is, the list should exclude all members that are only defined in `Object`, `BasicObject`, and `Kernel`.

# Included Modules

For this exercise, start by using version **2.3.0** of the [Ruby Array Documentation](https://docs.ruby-lang.org/en/2.3.0/Array.html). If you use a more recent version of the documentation, you won't get the full benefit of this exercise. You don't have to install Ruby 2.3.0 - you can use any more recent version to test the code.

Use irb to run the following code:

```ruby
a = [5, 9, 3, 11]
puts a.min
```

Find the documentation for the `#min` method and change the above code to print the two smallest values in the `Array`.

# Down the Rabbit Hole

Sometimes, the documentation is going to leave you scratching your head.

In a very early assignment at Launch School, you are tasked with writing a program that loads some text messages from a YAML file. We do this with `YAML::load_file`:

```ruby
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
```

Find the documentation for `YAML::load_file`.

