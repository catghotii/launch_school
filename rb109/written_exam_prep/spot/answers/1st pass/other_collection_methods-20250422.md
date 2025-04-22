## Other Collection Methods

[Link to all examples below](https://launchschool.com/lessons/85376b6d/assignments/d86be6b5)

### Example 1-20250422

```ruby
[1, 2, 3].any? do |num|
  num > 2
end
```

The `any?` method is a predicate method that returns `true` or `false` depending on the truthiness of the return value of the block. If the return value of the block evaluates as truthy for at least one element, `true` is returned, otherwise `false` is returned by the method.

In this code, `any?` is called on the array object `[1, 2, 3]` and the block parameter `num` is assigned the value of the current element. `num > 2` is a conditional expression that evaluates to either a truthy or falsy value, which is also the same value as the block's return value (the block's return value is the same value as the last evaluated expression in the block).

```ruby
# First iteration
num => 1
num > 2 evaluates as false
# the block's return value is falsy

# Second iteration
num => 2
num > 2 evaluates as false
# the block's return value is falsy

# Third iteration
num => 3
num > 2 evaluates as true
# the block's return value is truthy
# any? returns the boolean object `true`
```

In this code, the third iteration of the block returns a truthy value, so the `any?` method returns `true`.

### Example 2-20250422

```ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
```

The `any?` method is a predicate method that returns either `true` or `false` depending on the truthiness of the return values from the block. If any of the block's return values is truthy (that is, if at least one of the block's return values is truthy), `true` is returned, otherwise `false` is returned by the method.

In this code, `any?` is called on the hash object `{ a: "ant", b: "bear", c: "cat" }`, and the parameters `key` and `value` are assigned to the values of the key-value pair, respectively. `value.size > 4` is a conditional statement that returns either a truthy or falsy value, which is the subsequent return value of the block (as this value is also the last evaluated expression in the block, which is the block's return value). If any of the block's return values is evaluated as truthy, `true` is returned (otherwise `false` is returned).

```ruby
# size method returns the number of characters in the string

# First iteration
key => :a
value => "ant"
value.size => 3
value.size > 4 evaluates as false
the return value of the block is falsy

# Second iteration
key => :b
value => "bear"
value.size => 4
value.size > 4 evaluates as false
the return value of the block is falsy

# Third iteration
key => :c
value => "cat"
value.size => 3
value.size > 4 evaluates as falsy
the return value of the block is falsy

# Execution of any? terminates
# any? returns false
```

`any?` returns `false`, since none of the return values of the block were truthy.

If instead there was an iteration where the block returned a truthy value, short-circuit evaluation would occur, since at least one return value was evaluated as truthy, and the `any?` method can return `true` without processing all other iterations.

```ruby
# If { a: "tiger", b: "bear", c: "cat" } was the calling hash object

# First iteration
key => :a
value => "tiger"
value.size => 5
value.size > 4 evaluates as true
the return value of the block is truthy

# Short circuit evalaution occurs, since the return value of the block in the first iteration is truthy
# `any?` terminates early
# `any?` returns `true`
```

### Example 3-20250422

```ruby
[1, 2, 3].all? do |num|
  num > 2
end
```

The `all?` method is a predicate method that returns either `true` or `false` depending on the truthiness of the block's return values. If all of the block's return values evaluate as truthy, then `true` is returned, and if at least one of the return values is falsy, then `false` is returned.

In this code, `all?` is called on the array object `[1, 2, 3]` and passed a block. Inside the block, the parameter `num` is assigned the value of the current element, and then the conditional expression `num > 2` is evaluated to either `true` or `false`. This result is the same value as the block's return value, as it is also the last expression in the block code.

```ruby
# First iteration
num => 1
num > 2 evaluates as false
the return value of the block is falsy

# Short-circuit evalation occurs since at least one return value is falsy
# Execution of the `all?` method terminates
# `all?` returns `false`
```

### Example 4-20250422

```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```

The `all?` method is a predicate method that returns either `true` or `false` depending on the truthiness of the return values from the block. If all of the block's return values are truthy, `true` is returned, otherwise if at least one of the return values from the block is falsy, `false` is returned.

In this code, `all?` is called on the hash object `{ a: "ant", b: "bear", c: "cat" }`, and the block parameters `key` and `value` are assigned to the respective key-value pairs of the current iteration. `value.length >= 3` is evaluated to either true or false, which is also the same value of the block's return value, which is then checked for its truthiness to determine the return value of the method.

```ruby
# value.length returns the number of characters in the string

# First iteration
key => :a
value => "ant"
value.length => 3
value.length >= 3 evaluates as true
the return value is truthy

# Second iteration
key => :b
value => "bear"
value.length => 4
value.length >= 3 evaluates as true
the return value is truthy

# Third iteration
key => :b
value => "cat"
value.length => 3
value.length >= 3 evaluates as true
the return value is truthy

# All return values by the block are truthy
# `all?` returns `true`
```

```ruby
# Alternate code demonstrating short-circuit evaluation
# the conditional in the block --> value.length < 3

# First iteration
key => :a
value => "ant"
value.length => 3
value.length < 3 evaluates as false
the return value is falsy

# Short-circuit evaluation occurs; the next iterations are not evaluated
# Execution terminates early since at least one of the block's return values is falsy
# `all?` returns `false`
```
### Example 5-20250422

```ruby
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end
```

The `each_with_index` method allows for iteration over a collection of data and executes the block code, where the parameters in the block are assigned to the value of the element and its index. `each_with_index` returns the original calling object.

In this code, `each_with_index` is called on the array object `[1, 2, 3]`. The `puts` method in the block code outputs the interpolated string with the values of the current iteration's element and its index.

```ruby
# First iteration
num => 1
index => 0
output --> "The index of 1 is 0."

# Second iteration
num => 2
index => 1
output --> "The index of 2 is 1."

# Third iteration
num => 3
index => 2
output --> "The index of 3 is 2."
```

Output:

```
The index of 1 is 0.
The index of 2 is 1.
The index of 3 is 2.
```

### Example 6-20250422

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
```

The `each_with_object` method allows for iterating over a collection of data, but unlike the `each` method, which returns the calling object, `each_with_object` returns a new collection while iterating.

In this code:
- `each_with_object` is called on the hash object `{ a: "ant", b: "bear", c: "cat" }`, and passed an empty array `[]`, which provides this empty array as the initial object
- the block parameter `pair` is assigned to the key-value pair of the current iteration in an array (e.g. `[:a, "ant"]`)
- the parameter `array` is assigned the value of the object that's passed (initially an empty array that gets populated per iteration)
- `pair.last` returns the last element of the pair array
- `array << pair.last` pushes the last element of the pair array to the array object bound to the parameter `array`

```ruby
# First iteration
pair => [:a, "ant"]
pair.last => "ant"
array << pair.last => ["ant"]

# Second iteration
pair => [:b, "bear"]
pair.last => "bear"
array << pair.last => ["ant", "bear"]

# Third iteration
pair => [:c, "cat"]
pair.last => "cat"
array << pair.last => ["ant", "bear", "cat"]

# `each_with_object` returns `["ant", "bear", "cat"]`
```

### Example 7-20250422

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
```

The `each_with_object` method allows for iterating over a collection and, unlike the `each` method, which returns the original collection, `each_with_object` returns a new collection while iterating over the original collection.

In this code:
- `each_with_object({})` is passed an empty hash `{}` which gets populated after each iteration
- the block parameters `(key, value)` are assigned the current key-value pair in a hash (e.g. `{:a => "ant"})
- the block parameter `hash` is assigned the value of the object passed as an argument (initially an empty hash `{}` which gets populated with values)
- `hash[value] = key` reassigns the `hash[value]` 

```ruby
# First iteration
(key, value) => {:a => "ant"}
hash[value] --> hash["ant"]
key => :a
hash[value] = key => {"ant" => :a}
# return collection updated => {"ant" => :a}

# Second iteration
(key, value) => {:b => "bear"}
hash[value] --> hash["bear"]
hash[value] = key => {"bear" => :b} # creates a new key-value pair in the return hash
# return collection updated => {"ant" => :a, "bear" => :b}

# Third iteration
(key, value) => {:c => "cat"}
hash[value] --> hash["cat"]
hash[value] = key => {"cat" => :c} # creates a new key-value pair in the return hash
# return collection updated => {"ant" => :a, "bear" => :b, "cat" => :c}
```

### Example 8-20250422

```ruby
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

p odd
p even
```

The `partition` method returns an array of two arrays: the first array contains the elements for which the block returns a truthy value, and the second array contains the elements for which the block returns a falsy value.

The two variables `odd` and `even` are initialised to reference the return arrays, respectively.

When `partition` is called on the array object `[1, 2, 3]`, the block parameter `num` is assigned the value of the current element, and then the conditional expression `num.odd?` evaluates to either `true` or `false`, which is also the same value as the return value of the block (as this value is also the last evaluated expression in the block). `partition` then checks the truthiness of the block's return value: if the return value is truthy, the first array is populated with the element, but if it's falsy, the second array is populated with the element instead.

```ruby
# First iteration
num => 1
num.odd? evaluates to true
# the block's return value is truthy
first array => [1], second array => []
return array => [[1], []]

# Second iteration
num => 2
num.odd? evaluates to false
# the block's return value is falsy
first array => [1], second array => [2]
return array => [[1], [2]]

# Third iteration
num => 3
num.odd? evaluates to true
# the block's return value is truthy
first array => [1, 3], second array => [2]
return array => [[1, 3], [2]]

# Return array
[[1, 3], [2]]

# After the `partition` method call, multiple variable assignment occurs, splitting the return array
odd => [1, 3]
even => [2]
```

The `p` method calls will output the resulting return arrays by the `partition` method:

```
[1, 3]
[2]
```