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

### Example 4-20250416

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
  puts n
end

p new_array
```

`new_array` is initialised with a reference to the return value of `select` called on the array object referenced by `arr`. Unlike `each`, which returns the original calling object, the `select` method returns a new array containing the elements for which the block returns a truthy value. (`select` first creates an empty array `[]` which is then populates with elements based on the truthiness of the block's return value: if the return value of is evaluated as true, then the original element is added to the return array.)

Inside the block, the block parameter `n` is assigned to the element for that iteration, and then `n + 1` is evaluated, which increments the value of `n` by `1` and returns that evaluated result (although this operation does not change the value of `n` because it is not an assignment operation). The next line, `puts n` is then evaluated, which outputs the value of `n` (which remains the value of the original element) and returns `nil` (since `puts` returns `nil`). This `nil` value is also the same as the block's return value (which is the last evaluated expression in the block). `select` then checks the truthiness of the block's return value to determine whether the element should be added to the return array: `nil` evaluates as falsy, so nothing happens to the array. On each iteration, the falsy value `nil` is returned by the block, so the returned array remains `[]` throughout execution of the `select` method. This empty return array is the return value of the `select` method—which is also the value that `new_array` now references.

`p new_array` outputs a "raw" representation of the return array, including square brackets.

The output is:

```
1
2
3
4
5
6
7
8
9
10
[]
```

#### LSBot

2.  You correctly identified that `n + 1` does not modify `n` - it simply returns a new value that isn't stored anywhere.

### Example 5-20250416

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
```

`new_array` is initialised with a reference to the return value of the `map` method called on `words`. Unlike `each`, which executes the block code for each iteration and returns the original calling object, `map` returns a new array containing the returned values from the block.

Inside the block, the block parameter `word` is assigned the value of the current element, starting at index 0. The predicate method `start_with?` is called on the element value which checks whether the string starts with the given argument string `"t"` and returns either boolean object `true` or `false`. The return value of the block is the same as the result of the last evaluated expression in the block, which would be either `true` or `false`. The return array by `map` contains the block's return values; `new_array` references this new return array.

For the string elements starting with `"t"`—`"trip"` and `"talk"`—the `start_with?` method returns `true` which is the subsequent return value of the block, and for the other elements, the return value is `false`. 

`p new_array` outputs the return array in a single line, including square brackets.

The output is:

```
[false, true, false, false, true]
```

This code demonstrates:
- iterating over collections using `map` for transformation: it returns a new array based on the return values of the block, containing these return values in the array

### Example 6-20250417

```
12:03
12:06
```

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |n| puts n }
```

The `each` method is called on `arr`, which executes the block code for each iteration, and returns the original calling collection. Inside the block, the parameter `n` is assigned the value of the current element, and then `puts n` outputs this value. The return value of the block is `nil` because `puts` returns `nil` (the block's return values are not used by `each`). `each` then returns the original collection `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`, which is also the return value of the code snippet as this is the evaluated result of the last expression in the code.

The output is:

```
1
2
3
4
5
6
7
8
9
10
```

### Example 7-20250417

1208
1213

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n|
  n + 1
end

p incremented
```

The variable `arr` is initialised with a reference to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

The variable `incremented` is initialised with a reference to the return value of `map` called on `arr`, which executes the block code in each iteration, and then returns a new array containing the return values of the block. In each iteration, the block parameter `n` is assigned the value of the current element, and then `n + 1` evaluates to the result of incrementing the value of `n` by `1`. This evaluated result is the same as the block's return value since it is also the evaluated result of the last expression in the block. `map` returns a new array containing all the return values of the block, and this array object is then stored in the variable `incremented`.

`p incremented` outputs a "raw" representation of the return array object in a single line and makes the square brackets visible. (The return value of the entire code snippet is the same as the evaluated result of the last line in the code—`p` returns `nil`, so the return value is `nil`.)

The output is:

```
[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
```

### Example 8-20250417

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
end

p new_array
```

The variable `new_array` is initialised with a reference to the return value of the `map` method called on `arr`, which executes the block for each iteration, and then returns a new array containing the return values from the block. This return array is then assigned to `new_array`.

In each iteration, the block parameter `n` is assigned the value of the current element, and `n > 1` is evaluated: this is a conditional expression that returns either boolean objects `true` or `false`, and this evaluated result is the subsequent return value of the block, as it is also the evaluated result of the last expression in the block.

For the first iteration, `n > 1` evaluates as `false`, so the block's return value is also `false`, while all subsequent iterations evaluate as `true`. `map` returns a new array whose elements correspond to to these boolean values that are returned by the block.

`p new_array` outputs the new array:

```
[false, true, true, true, true, true, true, true, true, true]
```

### Example 9-20250417

2042
2048

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
  puts n
end

p new_array
```

`new_array` is initialised with a reference to the return value of `map`. Unlike each, which executes the block code for each iteration and returns the original collection, `map` returns a new array containing elements returned from the block.

In each iteration, the block parameter `n` is assigned to the value of the current element and then the block code is executed: `n > 1` is a comparison statement that evaluates to either boolean object `true` or `false` (but this return value is not used in this code), and `puts n` outputs the value of the element and also returns `nil` (since `puts` returns `nil`). The return value of the block is the same as the result of the last evaluated expression in the block `puts n`—the block's return value is `nil`. The `map` method returns a new array whose elements correspond to the return values of the block, and this array is assigned to `new_array`.

`p new_array` outputs the return array:

```
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
```

### Example 10-20250417

2050
2055

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hello"

[1, 2, 3].map { |num| a }
```

The variable `a` is initialised with a reference to the string object `"hello"`.

The `map` method is called on an array `[1, 2, 3]`, which iterates over the collection and returns a block containing the return values from the block (unlike `each` which returns the original collection).

Inside the block, the block parameter `num` is assigned to the value of the current element, and then the block evaluates `a`, which evaluates to `"hello"`. This is because the block has access to variables initialised in its surrounding scope, so `a` can be evaluated from within the block. The return value of the block is the same result as the last evaluated expression in the block, `"hello"`.

`map` returns an array whose elements correspond to the block's return value, effectively transforming the  elements of the original array to the return values by the block—the return array is `["hello", "hello", "hello"]`. However, in this specific code, this new array is not used, nor is there any output.

### Example 11-20250417

2056
2058

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

The `each` method is called on the array `[1, 2, 3]`, which iterates over the collection, and returns the original collection. In each iteration of the block, the block parameter `num` is assigned to the value of the current element, and then `puts num` outputs the element and evaluates to `nil`, since `puts` returns `nil`. `each` then returns the original collection, `[1, 2, 3]` (which is also the return value of this code snippet, as it is the evaluated result of the last expression in the code).

The output is:

```
1
2
3
```