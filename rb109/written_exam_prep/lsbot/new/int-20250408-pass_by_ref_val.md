### Question 3: Pass by Reference vs Pass by Value (Intermediate)

Explain what the following code will output and why. Use examples from the code to support your explanation.

```ruby
def change_name(name)
  name = "Bob"
end

name = "Jim"
change_name(name)
puts name

def add_to_array(array)
  array << "new element"
end

my_array = ["original element"]
add_to_array(my_array)
p my_array
```

