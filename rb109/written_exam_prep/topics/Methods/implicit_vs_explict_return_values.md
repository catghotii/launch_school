## LSBot

**Definition and Key Characteristics**

**Explicit Return Values:**

•   Return values that are clearly specified using the `return` keyword in Ruby  
•   The method execution terminates immediately when a `return` statement is reached  
•   The value following the `return` keyword is passed back to the calling code

**Implicit Return Values:**

•   Return values that occur without using the `return` keyword  
•   Ruby automatically returns the value of the last evaluated expression in a method  
•   No early termination of method execution unless an error occurs

**Common Use Cases**

**Explicit Returns:**

•   When you need to exit a method early based on certain conditions  
•   For returning multiple values from different points in a method  
•   When you want to make it visually clear what a method returns  
•   For handling guard clauses or preconditions in methods

**Implicit Returns:**

•   For simple, single-purpose methods where the return value is obvious  
•   When following Ruby's idiomatic style (Ruby developers often prefer implicit returns)  
•   For methods that focus on a single transformation or calculation  
•   When writing concise, readable code that follows Ruby conventions

**Code Examples**

**Example 1: Explicit vs. Implicit Returns**

```ruby
# Explicit return
def greeting_explicit(name)
  return "Hello, #{name}!"
end

# Implicit return
def greeting_implicit(name)
  "Hello, #{name}!"
end

puts greeting_explicit("Alice")  # => "Hello, Alice!"
puts greeting_implicit("Bob")    # => "Hello, Bob!"
```

Both methods produce the same result, but the implicit version is more concise and follows Ruby conventions.

**Example 2: Early Return with Guard Clauses**

```ruby
# Using explicit return for guard clauses
def calculate_discount(price, quantity)
  return 0 if price <= 0 || quantity <= 0  # Guard clause with early return
  
  discount = 0
  discount = 0.1 if quantity >= 5
  discount = 0.15 if quantity >= 10
  
  price * quantity * discount  # Implicit return for final calculation
end

puts calculate_discount(10, 0)    # => 0
puts calculate_discount(10, 5)    # => 5.0
puts calculate_discount(10, 15)   # => 22.5

# Here, the explicit return provides a guard clause to handle edge cases, while the actual calculation uses an implicit return.
```

**Common Pitfalls and Misconceptions**

1.  ​**Confusing Return Value with Output:**  
    •   Methods always return a value in Ruby, even if they use `puts`  
    •   `puts` displays output but returns `nil`  
    •   This is related to the guidance that methods should either return a meaningful value OR have side effects like output, but not both
    
    2.  ​**Forgetting that** `**return**` **Exits the Method:**  
    •   Any code after a `return` statement won't execute  
    •   This can lead to unexpected behavior if not used carefully
    
    3. **Not Realizing Block Return Values Matter:**  
   •   Blocks also have implicit return values (the last evaluated expression)  
   •   These return values are often used by methods like `map` and `select`
   
   4.  ​**Mistaking Method Assignments for Returns:**  
   •   Assigning a value to a variable inside a method doesn't automatically return that value unless it's the last expression
   
   Remember that in Ruby, methods should focus on either returning a meaningful value or performing side effects, but generally not both. 
   
   This helps make your code more maintainable and easier to understand, as mentioned in the [RB101 Coding Tips](https://launchschool.com/lessons/8a39abff/assignments/4806e825).

## Summary

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