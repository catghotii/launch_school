### 3.  ​Advanced​: 

```
20250416
start 22:19
end   22:30
total 00:11
```

Explain the output of this code with specific attention to variable scoping rules:

```ruby
a = 'hello'

def my_method
 puts a
end

def my_method2
 a = 'goodbye'
 my_method
end

my_method2
```

Output:

```
# Error - undefined local variable or method - error comes from inside the my_method method definition
```

On line 1, in the outer code, `a` is initialised with a reference to the string object `'hello'`.

On the last line of the code snippet, `my_method2` is called. In the `my_method2` method definition, another variable called `a` is initialised with a reference to the string object `'goodbye'` (although this `a` is locally scoped to the `my_method2` method definition). After this initialisation, the method invocation of `my_method` is executed.

In the `my_method` method definition, `puts a` is called, which throws an error message, stating that there is an undefined local variable or method called `a`—in other words, there is no variable (or method) available to pass an argument to `puts`.

Although there are two separate variables called `a`—one initialised in the outer code, and the other initialised in the `my_method2` method definition—`my_method` cannot access either of these variables due to the self-contained scope of a method definition: variables initialised outside of the method definition cannot be accessed or modified unless they are passed as arguments. The variable `a` in the outermost scope cannot be accessed by either `my_method` or `my_method2`, and the `a` inside `my_method2` is only available within that method definition.