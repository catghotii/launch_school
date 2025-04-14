## Each, Map, Select

### Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
array = [1, 2, 3, 4, 5]

array.select do |num|
  puts num if num.odd?
end
```

The variable `array` is initialised with a reference to the array object `[1, 2, 3, 4 ,5]`.

The `select` method is called on `array`, which returns a new array containing the elements for which the block returns a truthy value.

In each iteration, the block parameter `num` is assigned the value of the current element of the array, starting at index 0. The if modifier `puts num if num.odd?` is evaluated: 
- if `num.odd?` evaluates as true, `puts num` is executed and outputs the value of `num`, and the block returns `nil` (since `puts` always returns `nil`), which is the the evaluated result of the last expression. After this entire expression is evaluated, `select` checks if the result is truthy and populates the return array based on its truthiness. Since the block's return value is `nil`,  a falsy value, nothing is added to the return array. 
- When `num.odd?` evaluates as false, the condition fails and nothing happens, and the block implicitly returns `nil`, a falsy value. `select` checks the truthiness of this value—since it is false, nothing is added to the return array.

`select` returns an empty array `[]`—since the return values of the block are falsy values of `nil`, the array is not populated by any values. This array is not used in the code.

The output is:

```
1
3
5
```

This code demonstrates:
- iterating over collections using `select`, which creates a return array based on the truthiness of the block's return values
- return values vs output (via `puts`)
- conditional expressions and their return values in a block

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```

The variable `arr` is initialised with a reference to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

The `select` method is called on `arr`, which returns an array containing elements for which the block returns a truthy value.

In each iteration, the block parameter `n` is assigned the value of the current element of the array, starting at index 0. `n.odd?` is evaluated, which calls `odd?` on `n`, the element for that iteration, returning either `true` or `false`. If the return value is truthy, the element is added to the return array, and if the return is falsy, nothing is added to the return array.

For odd numbers, `n.odd?` evaluates as true, the block returns `true` (which is the evaluated result of the last (and only) expression in the block `n.odd?`). `select` checks for the truthiness of the block's return value, which is truthy, and the element is added to the return array. For even numbers, the expression evaluates as false, the block returns `false`, `select` checks for the truthiness of the return value, which is a falsy value, so return array remains unchanged.

The return array by `select` is `[1, 3, 5, 7, 9]`. There is no output for this code.

This code demonstrates:
- iterating over collections using `select`, which creates an array based on the truthiness of the block's return values
- predicate methods like `odd?` which return boolean objects `true` and `false`

### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
              n + 1
            end

p new_array
```

The variable `arr` is initialised with a reference to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

The variable `new_array` is initialised with a reference to the resulting return array by the `select` method called on `arr`. The `select` method returns an array containing elements for which the block returns a truthy value.

In each iteration, the block parameter `n` is assigned the value of the current element of the array, starting at index 0. `n + 1` is evaluated, and the block returns the evaluated result of the last expression (in this case, `n + 1` is the only and last expression). `select` checks the truthiness of the block's return value and populates the return array based on whether the value is truthy or falsy. `n + 1` will always return a truthy value, since every expression in Ruby is considered true except for `false` and `nil`. This means that all elements will be added to the return array. The return array is the object to which `new_array` is a reference.

`p new_array` outputs a "raw" representation of the return array in a single line and including square brackets.

The output is:

```
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

This code demonstrates:
- iterating over collections using `select` which creates a new array based on the truthiness of the block's return values
- return vs output (via `p`)
- truthiness of expressions in Ruby: every expression is considered truthy except for the two falsy values `false` and `nil`

### Example 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
  puts n
end

p new_array
```

### Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
```

### Example 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |n| puts n }
```

### Example 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n|
  n + 1
end

p incremented
```

### Example 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
end

p new_array
```

### Example 9

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
  puts n
end

p new_array
```

### Example 10

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hello"

[1, 2, 3].map { |num| a }
```

### Example 11

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].each do |num|
  puts num
end
```