
# Repeat Yourself

Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

Example:

```ruby
repeat('Hello', 3)
```

Output:

```terminal
Hello
Hello
Hello
```

# Odd

Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns `true` if the number's absolute value is odd. You may assume that the argument is a valid integer value.

Examples:

```ruby
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
```

Keep in mind that you're not allowed to use `#odd?` or `#even?` in your solution.

# Stringy Strings

Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

Examples:

```ruby
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
```

The tests above should print `true`.

# What's my Bonus?

Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is `true`, the bonus should be half of the salary. If the boolean is `false`, the bonus should be `0`.

Examples:

```ruby
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
```

The tests above should print `true`.

# Bannerizer

Write a method that will take a short line of text, and print it within a box.

Example:

```ruby
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
```

```ruby
print_in_box('')
+--+
|  |
|  |
|  |
+--+
```

You may assume that the input will always fit in your terminal window.

# Right Triangles

Write a method that takes a positive integer, `n`, as an argument, and displays a right triangle whose sides each have `n` stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

Examples:

```ruby
triangle(5)
    *
   **
  ***
 ****
*****
```

```ruby
triangle(9)
        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********
```

# Madlibs

Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adjective, and an adverb and injects those into a story that you create.

Example

```
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!
```

# Reverse the Digits in a Number

Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

```ruby
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1
```

Don't worry about arguments with leading zeros - Ruby sees those as octal numbers, which will cause confusing results. For similar reasons, the return value for our fourth example doesn't have any leading zeros.

# Get Middle Character

Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

Examples:

```ruby
center_of('I love Ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
```

