# Breakfast, Lunch, or Dinner? (Part 1)

What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def meal
  return 'Breakfast'
end

puts meal
```

# Breakfast, Lunch, or Dinner? (Part 2)

What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def meal
  'Evening'
end

puts meal
```

# Breakfast, Lunch, or Dinner? (Part 3)

What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def meal
  return 'Breakfast'
  'Dinner'
end

puts meal
```

# Breakfast, Lunch, or Dinner? (Part 4)

What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts meal
```

# Breakfast, Lunch, or Dinner? (Part 5)

What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def meal
  'Dinner'
  puts 'Dinner'
end

p meal
```

# Breakfast, Lunch, or Dinner? (Part 6)

What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def meal
  return 'Breakfast'
  'Dinner'
  puts 'Dinner'
end

puts meal
```

# Counting Sheep (Part 1)

What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep
```

# Counting Sheep (Part 2)

What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep
```

# Counting Sheep (Part 3)

What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep
```

# Tricky Number

What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number
```