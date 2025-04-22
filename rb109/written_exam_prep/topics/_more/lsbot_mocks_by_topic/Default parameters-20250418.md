
```
start 20:16
end   20:21

start 20:22
end   20:41

start 20:42
end   20:47
```

1.  ​**Basic**​: Explain what default parameters are in Ruby methods and provide a simple example showing their usage.

Method definitions can be defined with parameters, which indicate what inputs the method accepts when it is called. Arguments are the values passed to the method when it is called.

Default parameters allow methods to be defined with arguments with default values. If no values are supplied when an method is called, the default values are used instead.

```ruby
def greeting(name = "friend")
  puts "Hello #{name}"
end

greeting("Ruby")
greeting
```

In this example, the first method invocation of `greeting` is passed an argument with the string value `"Ruby"`. This value is bound to the method parameter `name` and then `puts` outputs the resulting string interpolation, which is `"Hello Ruby"`.

In the second method invocation, no argument is supplied, so the default value `"friend"` is assigned to the parameter `name`. The `puts` method call outputs the string concatenation of `"Hello"` and the default string value, resulting in `"Hello friend"`.

The output is:

```
Hello Ruby
Hello friend
```


2.  ​**Intermediate**​: What will the following code output and why?

```ruby
def greeting(name = "stranger", message = "Hello, #{name}!")
  puts message
end

greeting
greeting("Bob")
greeting("Alice", "Welcome!")
greeting(message: "Good day!")
```

Default parameters allow for methods to be defined with arguments with default values when a method is called. If no arguments are supplied in a method invocation, the default values are used instead.

The `greeting` method is defined with two default parameters, `name = "stranger", message = "Hello, #{name}!"`. The second default parameter is the evaluated result of the string interpolation, `"Hello, #{name}!"`, where the embedded expression is evaluated before it is converted into a string.

The first method invocation, `greeting`, is not supplied with any arguments, so the default values are assigned to the method's parameters. This method call outputs `"Hello, stranger!"`

The second method invocation is only supplied one argument, `"Bob"`, which is bound to the first parameter `name`, and the second parameter defaults to the default value. This method call outputs `"Hello, Bob!"`

The third method invocation is supplied two arguments, `"Alice"` and `"Welcome!"`, which are bound to the method's parameters, `name` and `message`. The `puts` method call only outputs the value of `message`, which in this case is the string `"Welcome!"`. The `name` parameter is not actually used in the method definition in this particular method call.

In the fourth invocation, the hash object `message: "Good day!"` is passed as an argument. This object is bound to the `name` parameter, while `message` is assigned the default value specified in the second default argument. When `puts message` is evaluated, the string interpolation `"Hello, #{name}!"` is evaluated, which interpolates the return value of the embedded expression—in this case, `name` evaluates to the hash object `{message=>"Good day!"}`—and then outputs the interpolated string, `"Hello, {message=>"Good day!"}"`

The output is:

```
Hello, stranger!
Hello, Bob!
Welcome!
Hello, {:message=>"Good day!"}!
```


3.  ​**Advanced**​: Examine the following code and explain the behavior of default parameters when they depend on each other:

```ruby
def calculate_total(price, quantity = 1, discount = 0, tax_rate = 0.05)
  subtotal = price * quantity
  discount_amount = subtotal * discount
  tax_amount = (subtotal - discount_amount) * tax_rate
  subtotal - discount_amount + tax_amount
end

puts calculate_total(10)
puts calculate_total(10, 2)
puts calculate_total(10, 2, 0.1)
puts calculate_total(10, 2, 0.1, 0)
```

The default parameters allow the `calculate_total` method to be defined with arguments with default values; this method has one required parameter, and three default parameters. This means that when the method is called and it is not supplied at least one argument, the default parameters will be evaluated and the corresponding arguments will be the default values indicated in the method definition.

In the first method call, only one argument is supplied, so the remaining three default parameters will be assigned with the preset values defined in the method definition.

```
price=10, quantity=1, discount=0, tax_rate=0.05
result: 
```

In the second method call, two arguments are supplied, so the remaining two parameters are assigned with the default values.

```
price=10, quantity=2, discount=0, tax_rate=0.05
result: 21.0
```

In the third method call with three arguments, only the last default parameter will be evaluated and that parameter will be assigned the default value.

```
price=10, quantity=2, discount=0.1, tax_rate=0.05
result: 18.9
```

The fourth method call is passed four arguments, so none of the default values will be assigned to the parameters.

```
price=10, quantity=2, discount=0.1, tax_rate=0
result: 18.0
```