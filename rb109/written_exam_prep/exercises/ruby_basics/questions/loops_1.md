
# Runaway Loop

The code below is an example of an infinite loop. The name describes exactly what it does: loop infinitely. This loop isn't useful in a real program, though. Modify the code so the loop stops after the first iteration.

```ruby
loop do
  puts 'Just keep printing...'
end
```

# Loopception

The code below is an example of a nested loop. Both loops currently loop infinitely. Modify the code so each loop stops after the first iteration.

```ruby
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
  end
end

puts 'This is outside all loops.'
```

# Control the Loop

Modify the following loop so it iterates 5 times instead of just once.

```ruby
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break
end
```

# Loop on Command

Modify the code below so the loop stops iterating when the user inputs `'yes'`.

```ruby
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
end
```

# Say Hello

Modify the code below so `"Hello!"` is printed 5 times.

```ruby
say_hello = true

while say_hello
  puts 'Hello!'
  say_hello = false
end
```

# Print While

Using a `while` loop, print 5 random numbers between 0 and 99 (inclusive). The code below shows an example of how to begin solving this exercise.

```ruby
numbers = []

while <condition>
  # ...
end
```

Example output (your numbers will most likely be different):

```plaintext
62
96
31
16
36
```

# Count Up

The following code outputs a countdown from 10 to 1. Modify the code so that it counts from 1 to 10 instead.

```ruby
count = 10

until count == 0
  puts count
  count -= 1
end
```

# Print Until

Given the array of several numbers below, use an `until` loop to print each number.

```ruby
numbers = [7, 9, 13, 25, 18]
```

Expected output:

```plaintext
7
9
13
25
18
```

# That's Odd

The code below shows an example of a `for` loop. Modify the code so that it only outputs `i` if `i` is an odd number.

```ruby
for i in 1..100
  puts i
end
```

# Greet Your Friends

Your friends just showed up! Given the following array of names, use a `for` loop to greet each friend individually.

```ruby
friends = ['Sarah', 'John', 'Hannah', 'Dave']
```

Expected output:

```plaintext
Hello, Sarah!
Hello, John!
Hello, Hannah!
Hello, Dave!
```

