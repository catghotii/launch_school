1213
1224

1.  ​**Advanced**​: Consider the following code snippet. What will be output and why?<!---->

```ruby
def change_string(str)
  str.replace("new string")
  str = "another string"
end

s = "original string"
change_string(s)
puts s
```

The variable `s` is initialised with a reference to the string object `"original string"`. The `change_string(s)` method call is passed `s` as an argument. Inside the method definition, the parameter `str` is bound to the same string object `"original string"` that `s` references—effectively, the method receives a reference to the string object.

The method body is evaluated: the destructive `replace` method is called on `str`, modifying the original object in place by replacing the string's contents with its argument, resulting in `"new string"`. This mutation can be seen through any of the original object's references, including the outer variable `s`, which points to the same modified object, `"new string"`.

The next line is a reassignment operation that creates a new string object, `"another string"`, that is assigned back to the local variable `str`, which changes what the variable references, disconnecting the reference to the original object from the local variable. The reassignment has no effect on the original object.

The method's return value is the same value as the last evaluated expression, `"another string"`, which is passed back to the calling code (however, this entire code snippet does not use the return value).

`puts s` will output `"new string"`.

```
# Diagram

# Original state
s --> "original string"

# During change_string method call
s --> "original string" <-- str

# After replace method (mutating)
s --> "new string" <-- str

# After reassignment (non-mutating)
s --> "new string"
str --> "another string"

# After execution of fix method
(method's return value => "another string")
s --> "new string"

# Final output
new string
```

This code demonstrates:
- Variable scope of a method definition: variables initialised in the outer scope cannot be directly accessed or modified unless they are passed as arguments during a method call and mutating operations are performed on those corresponding objects.
- Ruby's pass by reference value behaviour: the method receives a reference of the original object, but what happens to that object depends on whether the operations inside the method are mutating or non-mutating.
- Mutation vs reassignment: mutating operations modify original objects in place and these changes can be examined through any of their references, while reassignments create new objects and change what a variable references (which has no effect on the original object).

2.  ​**Advanced**​: What will the following code output? Explain the concept of variables as pointers that leads to this result.<!---->

# ruby  
  
   arr1 = ["a", "b", "c"]  
   arr2 = arr1  
   arr3 = arr1.dup  
     
   arr1[1].upcase!  
   arr2[2] = "d"  
   arr3[0] = "z"  
     
   p arr1  
   p arr2  
   p arr3  

3.  ​**Advanced**​: Analyze this code and explain its output, focusing on variables as pointers and mutability concepts:<!---->

# ruby  
  
   def add_name(arr, name)  
     arr = arr + [name]  
   end  
     
   def add_name!(arr, name)  
     arr << name  
   end  
     
   names = ["Bob", "Kim"]  
   add_name(names, "Jim")  
   p names  
   add_name!(names, "Sue")  
   p names  

4.  ​**Advanced**​: This code demonstrates variables as pointers in nested collections. What will the final `p people` output, and why?<!---->

# ruby  
  
   people = [["Bob", 25], ["Jim", 30], ["Sue", 28]]  
   temp = people[1]  
   temp[0] = "Jimmy"  
   temp = ["Tom", 32]  
     
   people[2][1] += 2  
     
   p people