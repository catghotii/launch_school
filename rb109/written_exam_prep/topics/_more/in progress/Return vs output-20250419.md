1.  ​**Basic**​: Explain the difference between `return` and `puts` in Ruby methods. What happens when you use both in the same method?

When a method is called, a method returns a value which is passed back to the caller. The return value of a method is the same value of the last expression during execution of the method, unless an explicit `return` keyword is used prior (any lines in the method body after `return` will not be executed if the keyword is reached).

If `puts` is used in a method, output will be displayed to the user, however it would not necessarily affect the return value. It's important to remember that `puts` returns `nil`.

```ruby
def some_method(message)
  message.upcase
end

def some_method(message)
  return message
  puts message
end

def some_method(message)
  puts message
  message.upcase
end
```


2.  ​**Intermediate**​: What will the following code output and what will it return? Explain your answer.<!---->

```ruby
def display_number(num)
  puts "The number is #{num}"
  num * 2
end
 
result = display_number(4)  
puts result
```

The variable `result` is initialized with a reference to the return value of `display_number`. The method is passed the integer `4` which is bound to the parameter `num`. The puts method call outputs the interpolated string 'the number is 4.' the last expression in the method, 4 * 2 is evaluated, resulting in 8, which is the subsequent return value, and this value is passed back to the caller. Result references the integer 8.

Puts result outputs 8.

The output is 
The number is 4
8

3.  ​**Intermediate**​: Identify and fix the issue in the following code that violates the guideline about methods mixing output and meaningful return values:<!---->

```ruby
def calculate_and_show_total(items)
  total = items.sum
  puts "Total: $#{total}"
  return total
end  
 
bill = calculate_and_show_total([10, 5, 3])
new_bill = bill * 1.15
```

4.  ​**Advanced**​: Refactor the following code to follow the guideline that methods should either return a meaningful value or have side effects (like output), but not both:

```ruby
def process_data(data)  
  if data.empty?  
  puts "Error: No data provided"  
  return nil  
end  

result = data.map { |item| item * 2 }  
  puts "Processed #{result.size} items"  
  return result  
end
```

```ruby
def process_data(data)
  return nil if data.is_a?(Array)
  return nil if data.empty?

  data.map { |item| item * 2 }
end

result = process_data(data)

if result == nil
  puts "Error: No data provided"
else
  puts "Processed #{result.size} items"
end
```