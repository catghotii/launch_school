### Question 4: Truthiness (Basic)

What values in Ruby are considered "falsey"? What do the following expressions evaluate to and why?

```ruby
puts !!nil
puts !!false
puts !!0
puts !!""
puts !!(3 > 5)
```

Unlike the boolean objects `true` and `false` whose only purpose is to convey either `true` or `false`,  truthiness refers to what values are considered true (truthy) or considered false (falsy).  In Ruby, everything is an expression that can be evaulated, and every expression is considered truthy, except for the two falsy values `false` and `nil`. Truthy objects in Ruby include empty strings, empty arrays, and empty hashes, and also the integer `0` (this differs from other programming languages that may consider these empty objects falsy).

Truthy and falsy objects can be converted to their boolean equivalent using Ruby syntax: when `!!`  is used before an object, Ruby turns the object into its boolean equivalent.

The `puts` method calls in the code will output the boolean equivalent of the expressions:

```
false
false
true # integer 0 is considered truthy in Ruby
true # empty strings are considered truthy in Ruby
false
```

### LSbot feedback

Your explanation of the double bang (`!!`) operator is accurate - it converts an object to its boolean equivalent. The first `!` converts the object to the opposite of its boolean value, and the second `!` converts it back, giving you the true boolean equivalent.