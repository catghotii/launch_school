### Question 3: Truthiness in Ruby (Basic)

Describe the concept of truthiness in Ruby. Which values are considered "falsy" in Ruby, and how does this differ from other programming languages you might be familiar with? Provide examples.

Truthiness refers to what is considered as true ("truthy") or considered as false ("falsy"), especially in conditional contexts. In Ruby, everything is truthy except for the two falsy values, `false` and `nil`. Truthiness differs from the boolean objects `true` and `false` whose sole purposes are to convey `true` and `false`, respectively.

In conditional contexts, this means that boolean values are not used directly, but instead Ruby checks for truthiness: Ruby does not specifically check if a conditional expression evaluates to `true`, but rather whether a conditional expression does not evaluate to the falsy values `false` or `nil`.

This allows for writing more concise code to guard against `nil` values - for example, `if user_input != nil` could be written as `if user_input` since a `nil` value will evaluate to `false`.

Some examples of how truthiness is used in conditional contexts:


```ruby
x = 1

if x < 10 # Ruby checks for whether the conditional expression is truthy or falsy; if truthy, it will run the next line of code
          # in Ruby, the conditional can simply be written as such, instead of `if x < 10 == true`
  puts "x is less than 10"
else
  puts "no!"
end

if x > 10 # expression is falsy (evaluates to `false`)
  puts "not true!"
end

y = nil

if y
  puts "nil found!" # no output displayed because `if y` evaluates to false
end

```

It is important to take care if using assignments in a conditional statement, because the assignment itself will always return a truthy value.

```ruby
if some_variable = 2
  puts "some variable is 2"
else
  puts "some variable is not 2"
end
```

Compared to other programming languages, Ruby considers everything as truthy (except for `false` and `nil`), including empty strings, arrays, hashes, and even the integer `0`. In other programming languages, these objects may be considered falsy.