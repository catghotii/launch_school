# How old is Teddy?

Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

Example Output

```plaintext
Teddy is 69 years old!
```

You may find the `rand` method useful. It is documented in the `Kernel` module.

# How big is the room?

Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

Example Run

```plaintext
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).
```

# Tip calculator

Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

Example:

```plaintext
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
```

# When will I Retire?

Build a program that displays when the user will retire and how many years she has to work till retirement.

Example:

```plaintext
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
```

Use the `Time` class from the Ruby core library.

# Greeting a user

Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

Examples

```plaintext
What is your name? Bob
Hello Bob.
```

```plaintext
What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?
```

You may find `String#chomp` or `String#chop` handy.

# Odd Numbers

Print all odd numbers from `1` to `99`, inclusive, to the console, with each number on a separate line.

# Even Numbers

Print all even numbers from `1` to `99`, inclusive, to the console, with each number on a separate line.

# Sum or Product of Consecutive Integers

Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

Examples:

```plaintext
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.
```

# String Assignment

Take a look at the following code:

```ruby
name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name
```

What does this code print out? Think about it for a moment before continuing.

If you said that code printed

```
Alice
Bob
```

you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:

```ruby
name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
```

What does this print out? Can you explain these results?

# Always Return Negative

Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

Examples:

```ruby
# All test cases should return true
puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0      # There's no such thing as -0 in Ruby
```