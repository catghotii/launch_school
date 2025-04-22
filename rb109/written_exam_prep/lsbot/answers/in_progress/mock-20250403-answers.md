
20250422

### 1.  ​Basic​: 

What is the difference between puts and return in Ruby? Provide an example that demonstrates this difference.

Every expression in Ruby evaluates to something, which is its return value. A method call's return is the same value as the last expression during execution of the method, unless a `return` keyword is explicitly used in the middle of the method body for an early return. The return value is the evaluated result following the `return` keyword.

Output is information that is printed to the screen for the user. It is considered a side effect of a method call. Generally, methods should produce either output or return a meaningful value, but not both.

```ruby
# method with only output
def display_greeting(name)
  puts "Hello, #{name}!"
end

display_greeting("Ruby") # outputs Hello, Ruby!
p display_greeting("Ruby") # outputs "Hello, Ruby!" and `nil` (puts returns nil)

# method - only return meaningful value
def greeting(name)
  "Hello, #{name}!"
end

display_greeting("Ruby") # => Hello, Ruby!
p display_greeting("Ruby") # returns string `"Hello, Ruby!"`

# method with both output and return value (advised not to do)
def greeting(name)
  puts "Hello, #{name}!"
  "Hello, #{name}!"
end

display_greeting("Ruby") # outputs Hello, Ruby!
p display_greeting("Ruby") # outputs Hello, Ruby! again, and returns string `"Hello, Ruby!"`
```

### 2.  ​Intermediate​:

Examine the following code and explain what happens on each line and the return value of the example method:

```ruby
def example(str)
 i = 3
 loop do
   str = str.upcase
   i -= 1
   break if i == 0
 end
 str + "!"
end

result = example("hello")
puts result
```

The variable `result` is initialised with a reference to the return value of the `example` method call with the string `"hello"` passed as an argument.

Inside the method definition, the parameter `str` is bound to the value of the string `"hello"`. The variable `i` is initalised with a reference to the integer `3`. The `loop` method is called and passed a block: inside the block, `str` is reassigned to the evaluated result of `str.upcase`—calling `upcase` on `str` returns a new string, `"HELLO"`, and this new string is assigned to `str`. `i` is then decremented by `1`. The conditional statement `break if i == 0` is evaluated: if it evaluates as true, `break` is executed and execution resumes after the `loop` method, otherwise the next iteration of the loop is executed.

Once `break` is reached, the last expression in the method, `str + "!"`, is evaluated, resulting in the concatenated string `"HELLO!"`—this is the subsequent method return value, as it is also the last evaluated expression in the method. This return value is passed back to the calling code: `result` references to string `"HELLO!"`. `puts result` outputs this returned string.

### 3.  ​Intermediate​:

What does the following code output? Explain why:

```ruby
arr = [1, 2, 3, 4, 5]

new_arr = arr.map do |num|
 if num > 3
   puts num
 else
   num * 2
 end
end

p new_arr
```

The variable `arr` is initialised with a reference to the array object `[1, 2, 3, 4, 5]`. `new_arr` is initialised with a reference to the return value of the `map` method called on `arr`. Unlike `each`, which iterates over a collection and returns the original collection, `map` iterates over a collection and returns a new array whose elements are the return values from the block. The return value of the block for each iteration is the same value as the last evaluated expression in the block.

Inside the block, the parameter `num` is assigned the value of the current iteration, and then the conditional `if/else` statement is evaluated: `if num > 3`, then `puts num` outputs the value of of `num` and the return value of the block is `nil` because `puts` returns `nil`, otherwise `num * 2` is evaluated and the evaluated result is the block's return value.

For the first two iterations, where the elements are `1` and `2`, the `if` statement evaluates as false, so the `else` branch is executed (`num * 2`); the block's return values are `2` and `4` for the first and second iterations, respectively. For the latter three iterations, `if num > 3` evaluates as true, so `puts num` is output and returns `nil`, which is also the block's return value for these iterations.

When all iterations are completed, `map` returns the new array containing the return values of the block, which is passed back to the calling code. `new_arr` references this return array, and `p new_arr` outputs this return array as well.

Output is:

```
3
4
5
[2, 4, nil, nil, nil]
```

##### LSBot feedback

```
# For elements 4 and 5, the block returns nil because puts returns nil  
# Map captures the block's return value for each element, so:  
# [1, 2, 3, 4, 5].map → [1*2, 2*2, puts 3, puts 4, puts 5] → [2, 4, nil, nil, nil]
```

### 4.  ​Advanced​:

Explain what the concept of "variable scope" means in Ruby. Illustrate your explanation with examples of local variable scope within methods, blocks, and conditionals.

Variable scope refers to where a variable is available in the program. "Local" ref