
# What's My Value? (Part 1)

What will the following code print and why? Don't run it until you have tried to answer.

```ruby
a = 7

def my_value(b)
  b += 10
end

my_value(a)
puts a
```

# What's My Value? (Part 2)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a
```

# What's My Value? (Part 3)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = 7

def my_value(b)
  a = b
end

my_value(a + 5)
puts a
```

# What's My Value? (Part 4)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end

my_value(a)
puts a
```

# What's My Value? (Part 5)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a
```

# What's My Value? (Part 6)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a
```

# What's My Value? (Part 7)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = 7
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a
```

# What's My Value? (Part 8)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a
```

# What's My Value? (Part 9)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a
```

# What's My Value? (Part 10)

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = 7
array = [1, 2, 3]

def my_value(ary)
  ary.each do |b|
    a += b
  end
end

my_value(array)
puts a
```