## Truthiness

### Example 1-20250423

1833
1840

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```

In Ruby, every expression is considered truthy except for the two falsy values `false` and `nil`. Truthiness refers to whether a value is considered true (is "truthy") or considered false ("falsy")—in other words, truthiness refers to whether a value evaluates as true or false; it is distinct from when expressions are evaluated as the boolean objects `true` and `false`, whose only purpose is to convey `true` or `false`.

Truthiness is used in conditional contexts. When a conditional expression is evaluated, Ruby checks for its truthiness: it does not check specifically for the boolean `true` but rather whether the expression evaluates to neither falsy values `false` or `nil`.

In this code, `a` is initialised with a reference to the string value `"Hello"` whose truthiness value is truthy, since it does not evaluate to either falsy values, `false` or `nil`.

`if a` will therefore always evaluate as true, which executes the `if` branch in the `if` statement. If instead `a` evaluated to a falsy value (e.g. `a = puts "Hello"` which returns `nil`), then the `else` branch would be executed instead.

```ruby
# Comments added

a = "Hello" # "Hello" evaluates as truthy

if a # evaluates as truthy
  puts "Hello is truthy" # if branch is executed
else
  puts "Hello is falsey"
end

# Output:
# Hello is truthy

# Alternate example

a = puts "Hello" # returns nil

if a # evaluates as falsy
  puts "Hello is truthy"
else
  puts "Hello is falsey" # else branch executed
end

# Output:
# Hello is falsey
```

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

def test  puts "written assessment"end

var = testif var  puts "written assessment"else  puts "interview"end