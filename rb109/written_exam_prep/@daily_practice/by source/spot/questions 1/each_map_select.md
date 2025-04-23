## Each, Map, Select

### Example 1-20250423

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
array = [1, 2, 3, 4, 5]

array.select do |num|
  puts num if num.odd?
end
```

The `select` method is called on `array`, which references the array object `[1, 2, 3, 4, 5]`. The `select` method iterates over the collection, executing the code in the block, and returns a new array containing the elements based on the truthiness of the block's return values. If the block's return value evaluates as truthy, the element is selected and added to the new array (which initially is an empty array `[]`), otherwise if the block's return value evaluates as falsy, nothing happens to the return array on that iteration.

Inside the block, the parameter `num` is assigned the value of the current element, and the block code is executed. The `if` modifier is evaluated: `if num.odd?` evaluates as true, then `puts num` will be executed, which outputs the value of `num` and returns `nil` (since `puts` returns `nil`)—otherwise, `if num.odd?` evaluates as false, `nil` is also returned because an `if` statement without any branch to execute will also return `nil`. 

This `nil` value is also the block's return value, as it is the last evaluated expression in the block. `select` then checks for the truthiness of the return value, which in this code would be falsy for odd numbers, as well as for even numbers. The return array is only populated with elements for which the block returns a truthy value; when the block's return value evaluates as falsy, nothing happens to the return array. In this code the return array is `[]`.

```
# Beginning of select method call
return array => []

# 1st iteration
num => 1
if num.odd? => true
puts num --> outputs 1 # => returns nil
block's return value => nil
truthiness of block's return value value --> falsy
new return array => []

# 2nd iteration
num => 2
if num.odd? => false
if statement evaluates as nil
block's return value => nil
truthiness of block's return value value --> falsy
new return array => []

# 3rd iteration
num => 3
if num.odd? => true
puts num --> outputs 3 # => returns nil
block's return value => nil
truthiness of block's return value value --> falsy
new return array => []

# 4th iteration
num => 4
if num.odd? => false
if statement evaluates as nil
block's return value => nil
truthiness of block's return value value --> falsy
new return array => []

# 5th iteration
num => 5
if num.odd? => true
puts num --> outputs 5 # => returns nil
block's return value => nil
truthiness of block's return value value --> falsy
new return array => []

# After iteration
new return array => []
```

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```

### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
              n + 1
            end

p new_array
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