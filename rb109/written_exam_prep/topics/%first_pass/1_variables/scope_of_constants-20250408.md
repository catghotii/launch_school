### LSBot

**Understanding the Scope of Constants in Ruby**

**Definition and Key Characteristics**

Constants in Ruby are variables whose values are intended to remain unchanged throughout the program execution. They are identified by starting with an uppercase letter, though by convention are typically written in ALL_CAPS with underscores separating words.

Key characteristics of constant scope:

•   Constants have ​**lexical scope**​, which means they are available within the code where they are defined and any nested code blocks  
•   Unlike local variables, constants can be accessed outside the block in which they are defined  
•   Constants defined at the top level of a program are globally accessible  
•   Ruby allows constants to be modified, though it will issue a warning

**Common Use Cases**

Constants are valuable in these scenarios:
1.  Storing configuration values that shouldn't change during program execution  
2.  Defining application-wide values like mathematical constants or conversion rates  
3.  Improving code readability by using descriptive names instead of "magic numbers"  
4.  Creating a single place to manage values that might need to be updated in future versions

**Code Examples**

**Example 1: Basic Constant Behavior vs. Local Variables**

```ruby
FAVORITE_COLOR = 'blue'

1.times do
  puts "I love #{FAVORITE_COLOR}!"  # => I love blue!
  
  # Define a constant inside a block
  MY_NUMBER = 42
end

puts FAVORITE_COLOR  # => blue
puts MY_NUMBER       # => 42 (accessible outside the block)

# Compare with local variable behavior
1.times do
  local_var = "can't escape"
end

# puts local_var  # Would raise: NameError: undefined local variable
```

**Example 2: Constants in Methods and Blocks**

```ruby
MAX_SCORE = 100

def calculate_percentage(score)
  percentage = (score.to_f / MAX_SCORE) * 100
  "#{percentage}%"
end

puts calculate_percentage(75)  # => 75.0%

loop do
  PASSING_GRADE = 65  # Defining a constant in a block
  break
end

puts "You need at least #{PASSING_GRADE} to pass"  # => You need at least 65 to pass
```

**Common Pitfalls and Misconceptions**

1.  ​**Mutability misconception**​: While Ruby warns against reassigning constants, it does NOT prevent mutation of the object a constant references:

```ruby
NAMES = ['Alice', 'Bob']
NAMES << 'Charlie'  # No warning, object is mutated
puts NAMES.inspect  # => ["Alice", "Bob", "Charlie"]

NAMES = ['Dave']    # Warning: constant already initialized
```

Best practice: Treat constants as truly immutable by using freeze to prevent modification:

```ruby
NAMES = ['Alice', 'Bob'].freeze
# NAMES << 'Charlie'  # Would raise: FrozenError
```

2.  ​**Scope confusion**​: Despite their accessibility, constants still follow lexical scoping rules in more complex contexts like classes and modules, which differs from local variable scoping.

3. **Style inconsistency**​: Failing to follow the ALL_CAPS naming convention makes code harder to read and understand for other developers. As noted in the Launch School [Variable Scope lesson](https://launchschool.com/lessons/8a39abff/assignments/e3cd8bb9), "constants have different scoping rules from local variables," and the [Ruby Style guide](https://launchschool.com/lessons/8a39abff/assignments/5026c713) recommends using "all uppercase letters in SCREAMING_SNAKE_CASE" for constants.

Remember that while Ruby allows you to modify constants, the [Coding Tips assignment](https://launchschool.com/lessons/8a39abff/assignments/4806e825) explicitly states: "CONSTANTS should be immutable."

### My Summary

Constants are variables that are intended to remain unchanged during execution of a program. They have lexical scope, which means they are available within the code they are defined and any nested code blocks. Unlike local variables, constants are available outside of the block in which they are defined.

In Ruby, constants are defined by starting with an uppercase letter, although the convention is to typically name a constant variable in ALL_CAPS casing, and initialise them at the top of a program. Although constants are intended to remain unchanged (i.e. should be immutable), Ruby does allow constants to be changed.