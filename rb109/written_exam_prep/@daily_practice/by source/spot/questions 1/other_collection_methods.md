## Other Collection Methods

[Link to all examples below](https://launchschool.com/lessons/85376b6d/assignments/d86be6b5)

### Example 1-20250423

1825
1830

```ruby
[1, 2, 3].any? do |num|
  num > 2
end
```

The `any?` method is a predicate method that iterates over the collection and returns either boolean objects `true` or `false` based on the truthiness of return values by the block. If at least one of the block's return values is truthy, `any?` returns `true`, otherwise `false` is returned if all of the return values are falsy.

In this code, `any?` is called on the array object `[1, 2, 3]`. The parameter `num` is assigned the value of the current iteration, and then the conditional expression in the block is evaluated to either `true` or `false`, which is also the block's return value. The block's return value is then evaluated for its truthiness, which will determine what boolean `any?` returns.

```
# 1st iteration
num => 1
num > 2 => false
block's return value --> falsy

# 2nd iteration
num => 2
num > 2 => false
block's return value --> falsy

# 3rd iteration
num => 3
num > 2 => true
block's return value --> truthy

# After all iterations
any? returns `true`
```

### Example 2

```ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
```

### Example 3

```ruby
[1, 2, 3].all? do |num|
  num > 2
end
```

### Example 4

```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```

### Example 5

```ruby
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end
```

### Example 6

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
```

### Example 7

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
```

### Example 8

```ruby
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

p odd
p even
```
