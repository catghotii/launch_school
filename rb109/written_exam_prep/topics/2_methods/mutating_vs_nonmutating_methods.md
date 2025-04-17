
## LSBot

**Mutating vs. Non-mutating Methods in Ruby**

**Definition and Key Characteristics**

**Mutating methods**​ change or modify the original object that they're called on. When a method mutates an object, it alters the object's state or content in place, rather than creating a new object.

**Non-mutating methods**​ leave the original object unchanged. Instead of modifying the original object, they typically return a new object with the desired changes, while the original remains the same.

A key characteristic to identify mutating methods in Ruby is the presence of a bang symbol (`!`) at the end of the method name (e.g., `map!`, `upcase!`). However, not all mutating methods have this symbol, and not all methods with the symbol are necessarily mutating.

**Common Use Cases and Scenarios**

**Mutating methods**​ are valuable when:
•   You want to modify data in place to save memory  
•   You need multiple parts of your program to see the updated version of an object  
•   You're performing operations on a collection while iterating through it

**Non-mutating methods**​ are valuable when:
•   You need to keep the original data intact for later use  
•   You want to avoid unexpected side effects in other parts of your code  
•   You're working with multiple threads that might access the same data

**Code Examples**

**Example 1: String Methods**

```ruby
# Non-mutating method: upcase
original_string = "hello"
uppercase_string = original_string.upcase
puts original_string      # => "hello" (unchanged)
puts uppercase_string     # => "HELLO" (new string)

# Mutating method: upcase!
original_string = "hello"
original_string.upcase!
puts original_string      # => "HELLO" (original modified)
```

**Example 2: Array Methods**

```ruby
# Non-mutating method: select
numbers = [1, 2, 3, 4, 5]
even_numbers = numbers.select { |num| num.even? }
puts numbers.inspect      # => [1, 2, 3, 4, 5] (unchanged)
puts even_numbers.inspect # => [2, 4] (new array)

# Mutating method: <<
numbers = [1, 2, 3]
numbers << 4
puts numbers.inspect      # => [1, 2, 3, 4] (original modified)
```

**Common Pitfalls and Misconceptions**

1.  ​**Misconception**​: All methods with a bang (!) are mutating, and all mutating methods have a bang.  

   ​**Reality**​: Many common methods like `<<`, `[]=`, and `concat` are mutating but don't have a bang. The bang symbol often indicates a more "dangerous" version of a non-mutating method, but not always.
  
  2. **Pitfall**​: Forgetting that assignment (`=`) is not mutation.

```
# ruby

   def change_value(str)
     str = str.upcase
   end
   
   name = "bob"
   change_value(name)
   puts name  # => "bob" (not changed, because = is reassignment, not mutation)
```

3.   **Pitfall**​: Not understanding that some objects in Ruby are immutable.  
   •   Numbers, booleans, and `nil` are immutable (can't be modified).  
   •   When you perform operations on immutable objects, you always get a new object.

Understanding the difference between mutating and non-mutating methods is crucial for debugging and writing predictable code.
 
If you'd like to explore this topic more deeply, I recommend reading the article [Mutating and Non-Mutating Methods in Ruby](https://launchschool.com/blog/mutating-and-non-mutating-methods) from Launch School's blog.