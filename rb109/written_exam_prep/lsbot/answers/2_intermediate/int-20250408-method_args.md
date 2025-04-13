### Question 2: Method Arguments (Intermediate)

What will the following code output? Explain why.

```ruby
def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]} years old and I live in #{options[:city]}"
  end
end

greeting("Bob")
greeting("Bob", {age: 62, city: "New York"})
greeting("Bob", age: 62, city: "New York")
```

Inside the method definition, there are two parameters, `name` and `options = {}`; the second parameter is a default parameter, which allows arguments to be defined with preset values. If no corresponding argument is passed for that parameter, then the default value will be used instead.

In the method body, the if/else statement determines what the output of the method is: if the conditional expression `if options.empty?` evaluates as true, then `puts "Hi, my name is #{name}"` is executed; otherwise if the expression evaluates as false, `puts "Hi, my name is #{name} and I'm #{options[:age]} years old and I live in #{options[:city]}"` is executed.

The first call of `greeting` is passed a single argument with the string value `"Bob"`. When the method is called, the local variable `name` is initialised with the string argument `"Bob"`, and the default parameter `options = {}` is evaluated: Ruby uses the default value as the second argument, so the local variable `options` is assigned the value of `{}`. The predicate method `options.empty?` checks whether `options` contains an empty hash object: if statement evaluates as true so the `puts` method call outputs its argument: `"Hi, my name is Bob"`

The second `greeting` method call is passed two arguments: string `"Bob"` and the hash `{age: 62, city: "New York"}`. Inside the method, the if statement evaluates to false, since `options` contains hash entries, and `puts` outputs `"Hi, my name is Bob and I'm 62 years old and I live in New York"`.

The third `greeting` method call has the same output as the second `greeting`. The method calls are the same with the only difference being the syntax used in the method call: `greeting("Bob", age: 62, city: "New York")` does not include the curly braces for the hash argument, which are optional when the second argument is a hash.

The output is:

```
Hi, my anme is Bob
Hi, my name is Bob and I'm 62 years old and I live in New York
Hi, my name is Bob and I'm 62 years old and I live in New York
```

#### LSBot feedback

**Overall Assessment:**

Your explanation is thorough and demonstrates a strong understanding of Ruby's parameter handling and method behavior. The analysis correctly identifies key concepts like default parameters, hash syntax options, and conditional logic. There are a few minor typos and one small conceptual clarification needed.

**Strengths:**
1.  ​**Parameter Analysis**​: Excellent explanation of default parameters and how Ruby handles parameter assignment when arguments are missing  
2.  ​**Hash Behavior Understanding**​: Good explanation of the `empty?` method and how it affects the conditional flow  
3.  ​**Syntax Variations**​: Strong recognition of Ruby's flexible hash syntax in method arguments

**Areas for Improvement:**

**1. Typographical Error in Output**

There's a typo in your expected output:

```
# ruby  
  
# Your output has:  
Hi, my anme is Bob  # 'name' is misspelled as 'anme'  
  
# It should be:  
Hi, my name is Bob  
```

**2. Detailed Hash Access Explanation**Consider adding a brief explanation of how hash access works:

```
# ruby  
  
# When you write:  
options[:age]  
  
# You could clarify that this:  
# - Uses the symbol :age as a key to access the corresponding value in the options hash  
# - Returns nil if the key doesn't exist (though this doesn't happen in the provided examples)
```  

**3. Hash Argument Syntax Clarification**Your explanation about the third method call is mostly correct, but could be more precise:

```
# ruby  
  
# Current:  
greeting("Bob", age: 62, city: "New York")  
# You correctly state that the curly braces are optional, but it would be helpful to mention:  
  
# This is actually a Ruby shorthand syntax called "keyword arguments" which automatically   
# creates a hash. It's not just about omitting braces - it's a specific Ruby feature   
# that converts these key-value pairs into a hash when passed as the last argument.
```

#### Revised answer

Inside the method definition, there are two parameters, `name` and `options = {}`; the second parameter is a default parameter, which allows arguments to be defined with preset values. If no corresponding argument is passed for that parameter, then the default value will be used instead.

In the method body, the if/else statement determines what the output of the method is: if the conditional expression `if options.empty?` evaluates as true, then `puts "Hi, my name is #{name}"` is executed, otherwise the expression evaluates as false and `puts "Hi, my name is #{name} and I'm #{options[:age]} years old and I live in #{options[:city]}"` is executed. Within the string interpolation, the expressions `options[:age]` and `options[:city]` are `Hash#[]` methods that retrieve the corresponding value (and return `nil` if the key does not exist).

The first call of `greeting` is passed a single argument with the string value `"Bob"`. When the method is called, the local variable `name` is initialised with the string argument `"Bob"`, and the default parameter `options = {}` is evaluated: Ruby uses the default value as the second argument, so the local variable `options` is assigned the value of `{}`. The predicate method `options.empty?` checks whether `options` contains an empty hash object: if statement evaluates as true so the `puts` method call outputs its argument: `"Hi, my name is Bob"`

The second `greeting` method call is passed two arguments: string `"Bob"` and the hash `{age: 62, city: "New York"}`. Inside the method, the if statement evaluates to false, since `options` contains hash entries, and `puts` outputs `"Hi, my name is Bob and I'm 62 years old and I live in New York"`.

The third `greeting` method call has the same output as the second `greeting`. The method calls are the same with the difference being the syntax used in the method call. Visually, the third method call omits the curly braces, but it is also Ruby shorthand syntax called "keyword arguments" which automatically creates a hash, converting the key-value pairs into a hash when passed in as the last argument.

The output is:

```
Hi, my name is Bob
Hi, my name is Bob and I'm 62 years old and I live in New York
Hi, my name is Bob and I'm 62 years old and I live in New York
```