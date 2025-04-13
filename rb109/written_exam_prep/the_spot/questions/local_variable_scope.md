## Local Variable Scope

### Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = “Hello”
b = a
a = “Goodbye”

puts a
puts b
```

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4

loop do  
  a = 5  
  b = 3

  break
end

puts a
puts b
```

### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4
b = 2

loop do  
  c = 3  
  a = c  
  break
end

puts a
puts b
```

### Example 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def example(str)
  i = 3  
  loop do    
    puts str    
    i -= 1    
    break if i == 0  
  end
end

example('hello')
```

### Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def greetings(str)  
  puts str  
  puts "Goodbye"
end

word = "Hello"
greetings(word)
```

[Problem link](https://launchschool.com/lessons/a0f3cd44/assignments/9e9e907c)

### Example 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4]
counter = 0
sum = 0

loop do  
  sum += arr[counter]  
  counter += 1  
  break if counter == arr.size
end 

puts "Your total is #{sum}"
```

### Example 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 'Bob'

5.times do |x|  
  a = 'Bill'
end

p a
```

### Example 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
animal = "dog"

loop do |_|  
  animal = "cat"  
  var = "ball"  
  break
end

puts animal
puts var
```

## Variable Shadowing

### Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
animal = "dog"

loop do |_|  
  animal = "cat"  
  var = "ball"  
  break
end

puts animal
puts var
```

a = 4 b = 22.times do |a|  a = 5  puts aendputs aputs b

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

n = 101.times do |n|  n = 11endputs n

### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

animal = "dog"loop do |animal|  animal = "cat"  breakendputs animal