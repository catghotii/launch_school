
## Array

### Assign

#### []=

modifies the array by replacing the element at the index of the given argument with the value to the left of `=`.

### Add
#### unshift

`unshift(*args)`

- prepends the array with its arguments

### Remove

#### compact / compact!

- Removes all occurrences of `nil` from array

### Iteration

#### inject / reduce

Allows for iteration while also accumulating a value.

##### Practice question

```
##### Practice question

9.  ​**Advanced**​: What does the `Array#inject` method do? Provide an example of using `inject` to solve a problem.

The `inject` (or `reduce`) method allows for iterating over a collection of elements while also accumulating a value. The block parameters refer to the accumulator and current element of the iteration. If no argument is given, `inject` will use the first element as the accumulator and begin iteration from the second element. `inject` returns a final accumulated value when the operation is complete.

The `inject` method allows for iteration over a collection while also accumulating a value. The block parameters refer to the accumulator and the current element of the iteration. If no argument is given, the first element will be used as the accumulator value, and iteration begins from the second element. `inject` returns the final accumulated value.

```ruby
# `inject` with block & without argument

result = [1, 2, 3].inject do |accumulator, element|
  accumulator + element
end

p result # => 6

# 1st iteration
# accumulator => 1
# element => 2
# accumulator + element --> 1 + 2 => 3

# # 2nd iteration
# accumulator => 3
# element => 3
# accumulator + element --> 3 + 3 => 6

# # After execution of inject method
# return accumulator value => 6


# Could also simply be written in the following format:
# collection.inject(:+)

result = [1, 2, 3,].inject(:+)
p result # => 6


# using `each` method to accomplish same result

sum = 0 # sum is initialised outside of block to capture result
[1, 2, 3].each do |n|
  sum += n
end

p sum # => 6


# `inject` with argument

result = [1, 2, 3].inject(10) do |accumulator, element|
    accumulator + element
end

p result # => 16

# initial accumulator => 10

# 1st iteration
# accumulator => 10
# element => 1
# accumulator + element --> 10 + 1 => 11

# # 2nd iteration
# accumulator => 11
# element => 2
# accumulator + element --> 11 + 2 => 13

# # 2nd iteration
# accumulator => 13
# element => 3
# accumulator + element --> 13 + 3 => 16

# # After execution of inject method
# return accumulator value => 16

# simpler expression

result = [1, 2, 3].inject(10, :+)
p result # => 16
```

```ruby
names = ["cat", "ruby", "emerald"]

# Finding longest word

result = names.inject do |longest, word|
  longest.size > word.size ? longest : word
end

p result

# Creating a hash

names_hash = names.inject({}) do |hash, name|
  hash[name] = name.length
  hash
end

p names_hash
```


