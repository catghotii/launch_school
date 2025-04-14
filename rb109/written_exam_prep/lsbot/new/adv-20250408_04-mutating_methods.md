### 4.  ​Advanced​: What will the following code output and why? 

Please be precise about how destructive vs. non-destructive methods affect the result.

```ruby
def add_name(arr, name)
 arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect

def add_name!(arr, name)
 arr << name
 arr
end

add_name!(names, 'jim')
puts names.inspect
```

