### 4.  ​Advanced​

```
start 22:41
end   23:08
total 00:27
```

What will the following code output and why? 

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

The `names` variable is initialised with a reference to the array object `['bob', 'kim']`. The `add_name` method is called and passed two arguments, `names` and the string value `'jim'`. Inside the method definition, the method's first parameter `arr` is bound to the same array object that `names` references, and `name` is bound to the string `'jim'`. `arr = arr + [name]` is a reassignment of the variable `arr` to the return value of `arr + [name]`, which creates a new array object containing all the elements of `arr` followed by the elements of the other array, resulting in `["bob", "kim", "jim"]`. (The value of the last evaluated expression—the new array—is the method's return value, although this value is not used outside of the method definition.) 

Both `Array#+` and reassignments are non-destructive operations that not only create a new object but also changes what the variable references—the original array object and its reference are disconnected from the local variable `arr`, while `names` continues to point to the original array. The `puts names.inspect` call reveals how the non-destructive methods inside `add_name` do not have an effect on the original array. (`inspect` returns a string representation of the calling object, making its internal structure visible, so `puts` outputs `["bob", "kim"]`).

In contrast, the `add_name!` method invocation with two arguments (`names` and `'jim`') permanently modifies the original array object due to the mutating method `<<` inside the method definition. Unlike reassignment and `+`, which are non-destructive and therefore create a new array object, breaking the connection to the original object, `arr << name` is destructive, which means that the original object itself is mutated, and this mutation can now be seen through any of its references, including the outer variable `names`. The return value of this method is the evaluated result of `arr`, which is the mutated array `["bob", "kim", "jim"]`.

`puts names.inspect` will print a string representation of the mutated array.

The output is:

```
["bob", "kim"]
["bob", "kim", "jim"]
```