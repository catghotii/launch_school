## Each, Map, Select

### Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
array = [1, 2, 3, 4, 5]

array.select do |num|
  puts num if num.odd?
end
```

The variable `array` is initialised with a reference to the array object `[1, 2, 3, 4, 5]`

The `select` method is called on `array`. In each iteration, the block parameter `num` is assigned the element of the current iteration (starting from the element at the index position 0 of the array), and the conditional expression `puts num if num.odd?` is evaluated: if the if statement `if num.odd?` evaluates as true, then `puts num` is executed, which outputs the current element.

The `select` method returns a new array consisting of the elements for which the block returns a truthy value.

Line-by-line, execution looks like this:

- On the 1st iteration (index 0 of the array), `num` is `1`; the conditional expression `puts num if num.odd?` is evaluated as true so `1` is output. The return value of the block is `nil` (since `puts` always returns `nil`) which is falsy, so the temporary return array of the block is not populated with any elements.
- 2nd iteration (element at index 1): `num` is `2`; the if statement evaluates as false, and execution resumes at the next iteration. The return value of the block is `nil`.
- 3rd iteration (element at index 2): `num` is `3`; the if statement evaluates as true; `3` is output. The return value of the block is `nil`.
- 4th iteration (element at index 3): `num` is `4`; the if statement evaluates as false, and execution resumes at the next iteration. The return value of the block is `nil`.
- 5th iteration (element at index 4): `num` is `5`; the if statement evaluates as true; `5` is output. The return value of the block is `nil`.

The `select` method returns an empty array `[]`, since none of the block's iterations returned a truthy value, but it is not used in this code.

This code demonstrates how the `select` method can iterate over collections using conditional statements.

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```

The variable `arr` is initialised to reference the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

The `select` method is called on `arr`. In each iteration, the block parameter `n` is assigned the value of the current element of the array (starting from the element at index position 0). The expression `n.odd?` is executed, which calls the `odd?` method on the current iteration's value, returning either true or false.

The `select` method returns a new array containing the elements for which the block returns a truthy value. In other words, if the return value of the block for that iteration is truthy, the element will be added to the new return array, and if the return value of the block is falsy, nothing will happen during that iteration.

For odd numbers in the array (1, 3, 5, 7, 9), the block evaluates as true, so these values are added to the new return array, and when `n` is an even number, the block evaluates as false, so nothing will be added to the return array during these iterations.

The return array of `select` is `[1, 3, 5, 7, 9]`. This code does not output anything.

### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
              n + 1
            end

p new_array
```

`arr` is initialised with a reference to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

`new_array` is initialised with a reference to the resulting return array of the `select` method called on `arr`. The `select` method returns a new array containing elements for which the block returns a truthy value.

In each iteration, the block parameter `n` is assigned the value of the current element of the array (starting from index 0), and `n + 1` is executed. Since `n + 1` is evaluated as true (since everything in Ruby is considered truthy except for `false` and `nil`), the block evaluates as truthy and the return array is populated with the element of the current iteration. In this code, each iteration of the block returns a truthy value.

`p new_array` will output a 'raw' representation of its argument — when the argument is an array, the entire array will be printed in a single line including square brackets.

The output is:

```
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```


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

The variable `arr` is initialised with a reference to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

The variable `new_array` is initialised with a reference to the returning array of the `select` method called on `arr`. The `select` method returns a new array containing elements for which the block returns a truthy value.

In each iteration, the block parameter `n` is assigned the value of the current element (starting with the element at index 0 in the array), and `n + 1` is executed, although this does not affect the value of `n`. `puts n` outputs the value of `n`, which would remain as the element of the current iteration. The return value of the block is the result of the last evaluated line in the block `puts n`, which is `nil` (since `puts` always returns `nil`), so the block is evaluated as false, and nothing happens to the temporary return array at the end of each iteration.

The return value of `select` is the return array—an empty array `[]`—which is output to the console when `p new_array` is called.

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

This code demonstrates the concepts of:
- iteration with `select`
- return vs output
- truthiness

### Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
```

The variable `words` is initialised with a reference to the array object `["jump", "trip", "laugh", "run, "talk"].

The variable `new_array` is initialised with a reference to the resulting return array of `map` being called in `words`. The `map` method returns an array containing the return values of the block.

In each iteration, the block parameter `word` is assigned the value of the current element of the array, starting with the element at index 0. `word.start_with?("t")` is executed, which calls the `start_with?` method on `word` and passes the string `"t"` as an argument. `start_with?` evaluates whether the calling string object (in this case, the current element) starts with the character `"t"` and returns the evaluated boolean result, either `true` or `false`.

The return array is output to the screen when `p new_array` is called.

The output is:

```
[false, true, false, false, true]
```

This code demonstrates the concepts of:
- iterating over collections with `map`
- methods that return boolean objects `true` or `false`
- return values of blocks

•   Use of the `%w` syntax for creating an array of strings  
•   Boolean return values from predicate methods (methods ending with `?`)  
•   How the return value of a block affects the result of iterative methods

### Example 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |n| puts n }
```

The variable `arr` is initialised with a reference to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

The `each` method is called on `arr`, which executes the block code for each iteration. In each iteration, the block parameter `n` is assigned the value of the current element of the array, starting at index 0. `puts n` outputs the current element. The return value of the block is `nil` since `puts` always outputs `nil`, although the block's return values are not used by `each` (unlike the `map` method which returns a new array containing the return values of the block for each iteration).

The `each` method always returns the original calling object, which in this code is `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

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

This code demonstrates the concepts of:
- iterating over collections using `each`
- the return value of `each` (vs output via printing methods inside of the method's block)

### Example 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n|
  n + 1
end

p incremented
```

The variable `arr` is initialised with a reference to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

The variable `incremented` is initialised with a reference to the resulting return array of the `map` method called on `arr`. Unlike `each` (which returns the original calling object), the `map` method returns an array containing the return values of the block for each iteration.

In each iteration, the block parameter `n` is assigned the value of the current array element, starting at index 0. `n + 1` is executed for each iteration. The evaluated result of `n + 1`, which is the last evaluated expression in the block, is the same value as the block's return value.

`p incremented` outputs the return value of the `map` method call in a 'raw' representation of the argument—for arrays, the output is on a single line and includes square brackets.

The output is:

```
[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
```

This code demonstrates the concepts of:
- iterating over collections using `map`
- the return values of a block and how they are used in the `map` method
- return values vs output (via `p`)

### Example 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
end

p new_array
```

The variable `arr` is initialised with a reference to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

The variable `new_array` is initialised with a reference to the resulting return array of `map` called on `arr`. The `map` method returns an array containing the return values of the block (unlike `each` which returns the original calling object).

In each iteration, the block parameter `n` is assigned the value of the current element of the array, starting with index 0. `n > 1` is evaluated, which returns either `true` or `false` boolean objects: if `n` is greater than `1`, then the expression is evaluated as true, otherwise it is evaluated as false. This result, which is also the last evaluated expression in the block, is the same as the block's return value.

`p new_array` outputs the return array by `map` in a 'raw' representation: the output is displayed in a single line, including square brackets.

The output is:

```
[false, true, true, true, true, true, true, true, true, true]
```

This code demonstrates:
- iterating over collections using `map`
- the return values of a block (and how they are used in the `map` method)
- expressions that return boolean objects `true` or `false`
- return values vs output (via `p`)

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

The variable `arr` is initialised with a reference to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

The variable `new_array` is initialised with a reference to the resulting return array of `map` called on `arr`. Unlike `each` (which returns the original calling object), the `map` method returns an array containing the return values of the block.

In each iteration, the block parameter `n` is assigned the value of the current element in the array, starting at index 0. `n > 1` is evaluated to either `true` or `false` (although this result is not used in the code), and then `puts n` outputs the value of `n`. The return value of the block, which is the same as the result of the last evaluated expression in the block, is `nil` since `puts` always returns `nil`.

The `p new_array` method call outputs its argument in a "raw" representation: for the return array, the output will be in a single line and include square brackets.

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
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
```

This code demonstrates:
- iterating over collections using `map`
- return values of a block and how they are used in the `map` method for transformation
- the difference between a method's side effects (output) and its return value

### Example 10

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hello"

[1, 2, 3].map { |num| a }
```

The variable `a` is initialised with a reference to the string object `"hello"`.

The `map` method is called on the array `[1, 2, 3]`. Unlike `each` (which returns the original calling object), `map` returns an array containing return values of the block.

In each iteration, the block parameter `num` is assigned the value of the current element of the array, starting at index 0. `a` is then evaluated: `a`, which was initialised in the outer scope, is accessible from within the block, and so is evaluated to `"hello"`. The block's return value, which is the same as the evaluated result of the last expression in the block, is `"hello"`. Thus, the return value of `map` in this code is `["hello", "hello", "hello"]`.

This code does not have any output.

This code demonstrates:
- iterating over collections using `map`
- return values of a block and how they are used in the `map` method for transformation
- variable scope rules of a block, whereby variables initialised in the outer scope can be accessed and modified from within the block

### Example 11

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

The `each` method is called on the array object `[1, 2, 3]`, which runs the code in the block for each iteration. `each` returns the original calling object.

In each iteration, the block parameter `num` is assigned the value of the current iteration of the array, starting from index 0. The code in the block is executed: `puts num` outputs the value of `num`. The return value of the block, which is the same as the result of the last evaluated expression, is `nil` since `puts` always returns `nil`. This return value is not used by `each` (unlike `map` which uses the return values to populate its return array).

The output is:

```
1
2
3
```

This code demonstrates:
- iterating over collections using `each`
- return values of a block vs output (via `puts`)
- return values of methods