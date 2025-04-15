## Truthiness

### Example 1-20250415

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```

The variable `a` is initialised with a reference to the string object `"Hello"`.

The if/else statement is then evaluated: `if a` evaluates as truthy, `puts "Hello is truthy"` is executed, otherwise `puts "Hello is falsey"` is executed.

In Ruby, every expression is considered truthy, except for the two falsy values `false` and `nil`. In order to determine which clause to execute, Ruby checks for truthiness in conditional contexts—that is, whether the expression is truthy (rather than specifically checking for the boolean object `true`), or in other words, whether the expression does not evaluate to either of the the falsy values `false` or `nil`. 

The output of this code is `"Hello is truthy"`, which is the result of the `puts` method call following `if a`. This is because `if a` evaluates as truthy: `a` is considered to be truthy, so the if statement evaluates as true and executes `puts "Hello is truthy"`. (If `a` was assigned to `false` or `nil` (or `!"Hello"` which evaluates to `false`), the else clause would be executed.)

The return value of the if statement is `nil` which is the return value of the last evaluated expression `puts "Hello is truthy"` (since `puts` returns `nil`). The return value of the code snippet is `nil` as well, which is the same value as the last evaluated expression (the if statement which returns `nil`).

This code demonstrates:
- Truthiness in conditional contexts
- Return values vs output: the return value is not necessarily the same as the output

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def test
  puts "written assessment"
end

var = test

if var
  puts "written assessment"
else
  puts "interview"
end
```