
# Searching 101

Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

Examples:

```plaintext
==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].
```

# Arithmetic Integer

Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

Example

```plaintext
==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
```

# Counting the Number of Characters

Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

input:

```plaintext
Please write word or multiple words: walk
```

output:

```plaintext
There are 4 characters in "walk".
```

input:

```plaintext
Please write word or multiple words: walk, don't run
```

output:

```plaintext
There are 13 characters in "walk, don't run".
```

# Multiplying Two Numbers

Create a method that takes two arguments, multiplies them together, and returns the result.

Example:

```ruby
multiply(5, 3) == 15
```

# Squaring an Argument

Using the `multiply` method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

Example:

```ruby
square(5) == 25
square(-8) == 64
```

# Exclusive Or

The `||` operator returns a truthy value if either or both of its operands are truthy. If both operands are falsey, it returns a falsey value. The `&&` operator returns a truthy value if both of its operands are truthy, and a falsey value if either operand is falsey. This works great until you need only one of two conditions to be truthy, the so-called **exclusive or**.

In this exercise, you will write a method named `xor` that takes two arguments, and returns `true` if exactly one of its arguments is truthy, `false` otherwise. Note that we are looking for a boolean result instead of a truthy/falsy value as returned by `||` and `&&`.

Examples:

```ruby
p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
p xor?('abc', nil) == true
p xor?(nil, 'abc') == true
p xor?('abc', 'abc') == false
p xor?(nil, nil) == false
```

The tests above should print `true`.

# Palindromic Strings (Part 1)

Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

Examples:

```ruby
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true
```

# Palindromic Strings (Part 2)

Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the `palindrome?` method you wrote in the previous exercise.

Examples:

```ruby
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
```

# Palindromic Numbers

Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

Examples:

```ruby
palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true
```

# Uppercase Check

Write a method that takes a string argument, and returns `true` if all of the alphabetic characters inside the string are uppercase, `false` otherwise. Characters that are not alphabetic should be ignored.

Examples:

```ruby
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true
```

