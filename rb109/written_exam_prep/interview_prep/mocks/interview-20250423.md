
**Mock RB109 Interview Questions**

1.  ​**Basic**​: Explain the difference between `puts` and `return` in Ruby. Provide a short code example that demonstrates this difference.

2.  ​**Intermediate**​: What will the following code output and why?<!---->

```ruby
a = 'hello'
b = a
a = 'goodbye'

puts a
puts b
```

3.  ​**Intermediate**​: What is variable scope in Ruby? How does a method definition differ from a block in terms of variable scope? Include a code example.

4.  ​**Advanced**​: Consider the following code:

```
# ruby  
  
   def fix(value)  
     value.upcase!  
     value.concat('!')  
     value  
   end  
     
   s = 'hello'  
   t = fix(s)  
     
   puts s  
   puts t  
```

What will this code output and why? Explain the concepts of mutability and pass-by-reference/pass-by-value as they relate to this example.

5.  ​**Advanced**​: Describe what happens in each step of the following code, including any concepts related to local variable scope and method definition:

```ruby  
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]  
 
new_array = arr.map do |n|   
  n > 5 ? n : nil
end  
 
p new_array.compact
```