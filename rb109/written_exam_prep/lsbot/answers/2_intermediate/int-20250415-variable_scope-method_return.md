### Question 2 (Intermediate)-20250415

```
start 21:45
end 22:15
time taken 00:30
```

Explain what happens in the following code, including discussion of variable scoping rules and method return values.

```ruby
def greeting(name)  
  puts "Hello, #{name}!"  
  name = name.upcase  
  "Hi, #{name}"  
end  
  
name = "Bob"  
return_value = greeting(name)  
puts name  
puts return_value  
```

The variable `name` is initialised with a reference to the string object `"Bob"`. The variable `return_value` is initialised with a reference to the return of the method call `greeting(name)`. The `greeting` method is called and passed the string object `"Bob"` as an argument.

Inside the method definition, the local variable `name` is bound to the same string object `"Bob"` to which `name` is a reference—essentially, the method parameter `name` receives a reference to this object. `puts "Hello, #{name}!"` is evaluated: the string interpolation is evaluated and concatenated with the surrounding string, which is then output (`"Hello, Bob!")`. Then the local variable `name` is reassigned to the return value of the `upcase` method called on `name`: the non-mutating `upcase` method returns a new string with uppercase letters. The locally scoped variable `name` now references this new string `"BOB"`. The last line in the method is evaluated: after string interpolation and concatenation, it evaluates to `"Hi, BOB"`—this result is also the method's implicit return value, as it is the last evaluated expression in the method, which is then passed back to the calling code. In the outer code `return_value` receives a reference to the string `"Hi, BOB"`.

The `puts name` method call reveals that the outer variable `name` still points to the original object `"Bob"`. It has not been modified! This is due to a method definition's scoping rules: method definitions create their own scope, and any variables initialised in the outer code cannot be accessed or modified unless they are passed in as arguments and mutating methods are called on those corresponding objects within the method. While the string object `"Bob"` (which the outer variable `name` references) was passed in as an argument, it was not mutated by any operations within the method.

Instead, only non-mutating operations were performed in the method: while the method's local variable `name`  initially received a reference to the string object that the outer variable `name` references, reassignment operation changes what the variable references—in this case, it was reassigned to the result of the non-destructive `upcase` method call on `name`, which returns a new string. This means that the reference to the original object is no longer connected to the variable `name` inside the method. If a mutating method was then called on that variable after the reassignment, it would have no effect on any of the original object's references outside of the method.

That the outer variable name references the string initialised in the outer scope also demonstrates another key aspect of a method definition's scope: variables initialised within the method cannot be accessed by the outer code. This means that the local variable `name` inside the method definition is not visible to the outer code, so `puts name` can only output the value of variables available to it in the outer code.

Finally, `puts return_value` outputs the string which was returned by the `greeting` method call. (The return value of the code snippet is `nil` because the return value is the result of the last evaluated expression in the code—`puts` returns `nil`.)

The output is:

```
Hello, Bob!
Bob
Hi, BOB
```

This code demonstrates:
- Ruby's pass by reference value behaviour: methods receives references to objects that are passed in as arguments, but what happens to the original object is determined by the operations in side the method
- Variable scope of method definitions: variables initialised in the method cannot be accessed by the outer code, and variables initialised in the outer code cannot be accessed and modified from within the method unless they are passed in as arguments and mutating operations are performed on the object in the method
- Return values vs output