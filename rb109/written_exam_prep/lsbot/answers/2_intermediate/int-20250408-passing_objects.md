Question 2: Passing Objects (Intermediate)
What will the following code output? Explain the concept demonstrated in this code:

```ruby
def change_string(str)
  str.replace("new string content")
end

s = "original string"
change_string(s)
puts s
```

On line 4, the variable `s` is initialised with a reference to the string object `"original string"`. On line 5, the method invocation of the `change_string` method is passed an argument to the reference contained in variable `s`. 

In the method definition, this argument value is assigned to the local variable `str` and the `replace` method is called on the string object that the variable points to, `"original string"`. This method mutates the string object, replacing the contents of the string to `"new string content"`; the original string itself is changed, and therefore any variables that point to it are also changed.

When `puts s` is called on the last line, the permanent changes to the string object are visible: `s` holds a reference to the original string object that has been mutated to the string `"new string content"`.

The output will be:

```
new string content
```