# 2025-04-03 01:59:13

#### default parameters

Parameters are local variables initialised with references to objects when a method is called. Default parameters allow for methods to be defined with preset values when a method is called. If a method is passed no arguments when it's called, the default values will be used instead.

example

```ruby
def greeting(name = "friend")
  "Hello #{name}"
end

puts greeting      # output: Hello friend
puts greeting(nil) # nil overrides default parameters
```

#### truthiness

Truthiness refers to what values are considered as true (is "truthy") and considered as false ("falsy") in conditional contexts. In Ruby, every expression is considered truthy, except for the two falsy values `false` and `nil`. This differs from boolean objects true and false, whose only purpose is to convey the boolean true and false.

In conditional contexts, like if statements, Ruby uses truthiness to help build conditional flow or logical sequences. Boolean objects are not directly used in conditional expressions: Ruby does not specifically check for the boolean `true` but rather checks for whether the expression does not evaluate to the falsy values `false` or `nil`. This means that 