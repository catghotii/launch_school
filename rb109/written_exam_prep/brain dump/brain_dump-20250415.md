
### Passing and using blocks with methods

**Block**: a piece of code that can be passed to a method; associated with method invocation

Passing a block to a method is essentially passing a behaviour as an argument to a method.

- defined using `do/end` or `{}`; can accept parameters which are defined between `||`
- methods can execute blocks using the `yield` keyword
- can access variables from their surrounding scope
- have their own return values, which can be used by calling the method

**Things to remember!**

- blocks have return values: the return value of the block is the value of the last evaluated expression, and can only be used by the method that called the block
- variable scope: blocks can access variables in its surrounding scope, but methods cannot.
- a block is part of a method invocation, not a method definition.
- to use a block in a method, the block must be passed as an argument to the method, but the method must also be defined to use the block

**Code examples**

Example 1: simple iteration with blocks

```ruby
animals = ['cat', 'dog', 'pig']

animals.each { |animal| puts animal }

# cat
# dog
# pig
```

The `each` method is called on `animals` and passed a block as an argument. In each iteration of the block, the current element of the array is bound to the block parameter `animal`, and `puts animal` is executed, which outputs the string element. The block's return value is the same as the evaluated result of the last expression, which is `nil`, since `puts` always returns `nil`. The each method returns its calling object—in this case the array object `['cat', 'dog', 'pig']`.

Example 2: writing a custom method that uses a block

```ruby
def my_method
  puts "Before the block"
  yield if block_given? # execute the block if one was provided
  puts "After the block"
end

# calling with method with a block
my_method do
  puts "I'm inside the block!"
end

# calling a method without a block
my_method

# output:

# Before the block
# I'm inside the block!
# After the block
# Before the block
# After the block
```

Example 3: using block return values

```ruby
def calculate(num1, num2)
  result = yield(num1, num2) if block_given?
  puts "The result is #{result}"
end

calculate(5, 3) { |a, b| a + b }
calculate(5, 3) { |a, b| a - b }
calculate(5, 3) { |a, b| a * b }
```

Example 3: methods must be defined to use a block. just because a block is passed to a method does not mean that it will be executed!

```ruby
def greeting
  puts "Goodbye"
  # no yield statement, so block is never executed
  # yield if block_given?
end

word = "Hello"

greeting do
  puts word
end
```

### Implicit vs explicit return values

Everything in Ruby is an expression, and every expression can be evaluated to something.
Methods are expressions, so they can be evaluated to something.
This something is the return value.

The return value of a method is the last evaluated expression in the method body, unless an explicit `return` keyword is used prior. The method execution terminates once the `return` statement is reached, even when it is the middle of a method. The value following the `return` keyword is passed back to the calling code.

If no `return` keyword is explicitly used, methods implicitly return its value, which is the last evaluated expression of the method, and that value is passed back to the calling code.

Whether `return` is used or not, something will be returned from every method call (a call to an empty method returns `nil`).

**Code examples**

Example 1: implicit vs explicit return

```ruby
def greeting_explicit(name)
  return "Hello, #{name}!"
end

def greeting_implicit(name)
  "Hello, #{name}!"
end

puts greeting_explicit("Ruby")
puts greeting_implicit("Cat")
```

Example 2: early return and guard clauses

```ruby
def calculate_discount(price, quantity)
  return 0 if price <= 0 || quantity <= 0 # guard clause with early return

  discount = 0
  discount = 0.1 if quantity >= 5
  discount = 0.15 if quantity >= 10

  price * discount * quantity # implicit return for final calculation
end

puts calculate_discount(10, 0)    # => 0
puts calculate_discount(10, 5)    # => 5.0
puts calculate_discount(10, 15)   # => 22.5

# Here, the explicit return provides a guard clause to handle edge cases, while the actual calculation uses an implicit return.
```

#### Output vs return

Remember that methods either return a meaningful value (which can be used in further operations or variable assignments), or have side effects (like output), but not both.

### Using method return values as arguments to other methods

This refers to using the return value of a method and immediately passing that value as input to another method, without storing it in a variable first (i.e. eliminate intermediate variables). This creates a chain of method calls where the output of one becomes the input to the next.

Example 1: basic string processing

```ruby
# without using return values as arguments

name = "ruby"
screaming_name = name.upcase
greeting = "Hello, #{screaming_name}!"
puts greeting

# using return values as arguments
puts "Hello, #{name.upcase}!"
```

Example 2:

```ruby
# without using return values as arguments
def double_characters(word)
  arr = word.chars
  arr_doubled = arr.map { |letter| letter * 2 }
  word_double = arr_doubled.join
end

# using return values as arguments
def double_characters_2(word)
  word.chars.map { |letter| letter * 2 }.join
end

puts double_characters("ruby") # rruubbyy
puts double_characters_2("cat") # ccaatt
```

Example 3: array processing pipeline

```ruby
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# without using return values as arguments
evens = numbers.select  { |num| num.even? }
squared = evens.map { |num| num ** 2 }
sum = squared.reduce(0) { |total, num| total + num } # the ‘0’ in `reduce(0)` sets the initial value
puts sum

# using return values as arguments
puts numbers.select { |num| num.even? }.map { |num| num ** 2 }.reduce(0) { |total, num| total + num }
```

### Truthiness

In Ruby, everything is considered truthy except for the two falsy values, `false` and `nil`. Truthy values include empty strings, arrays, hashes and the integer `0`; in other programming languages, these objects may be considered falsy.

Truthiness refers to how a value is evaluated in conditional contexts, like if statements. In other words, truthiness refers to whether a value is considered true ("truthy") or considered false ("falsy"). It differs from the boolean objects `true` and `false`, whose only purpose is to convey `true` or `false`.

In conditional contexts, expressions are evaluated based on their truthiness: Ruby does not specifically check for whether the expression evaluates to `true` but rather if it doesn't evaluate to one of the falsy values (`false` or `nil`).


Example 1: checking if a value exists

```ruby
def display_greeting(name)
  if name # using truthiness instead of != nil
    puts "Hello, #{name}!"
  else
    puts "No name provided."
  end
end

display_greeting("Ruby")
display_greeting(nil)
```

Example 2: using truthiness in method calls

```ruby
def create_address(id)
  id < 0 ? "#{id}@mail.com" : nil
end

user_id = 69
if user = create_address(user_id) # assignment in conditional
  puts "Address created: #{user}"
else
  puts "Cannot create address"
end
```

Example 3: short-circuit evaluation

- When using `&&` and `||`, the return value is always the value of the operand evaluated last. They can return truthy values too.

```ruby
def process_data(data)
  # only process if data exists and has elements
  if data && data.size > 0
    puts "Processing #{data.size} elements..."
    true
  else
    puts "No data to process."
    false
  end
end

process_data(['cat', 'dog', 'pig'])
process_data([])
process_data(nil)
```

Example 3: be careful with variable assignments in conditionals!

```ruby
# assignment in conditional (could be a mistake!)
if number = 2
  puts "`number = 2` returns 2 which is always truthy"
else
  puts "you will never see this"
end

# == comparison operator used instead
if number == 1
  puts "you will not see this because number was assigned to 2!"
else
  puts "now you'll see this"
end
```