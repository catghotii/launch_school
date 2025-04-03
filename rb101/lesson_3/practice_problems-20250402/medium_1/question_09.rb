# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the return value of the following method invocation?

bar(foo)

# The return value would be "no".

# The method invocation takes the return value of the `foo` method without any arguments. In Ruby, default parameter values are used only when arguments are not passed to the method. 

# When no argument is passed to the `foo` method, a default parameter has been defined to equal to the the string value "no", however the method returns the string value "yes". This string is passed as an argument to the `bar` method.

# The `bar` method definition is declared with a default parameter, which isn't used since the method invocation of `foo` is passed an argument. The ternary operator inside the `bar` method definition evaluates whether the `param` variable is equal to the string "no". In this case, the `param` variable receives a reference to the string value "yes"; the ternary expression is evaluated as false, returning the string "no", which is the return value of the `bar(foo)` method invocation.

# LS:

# This is because the value returned from the foo method will always be "yes" , and "yes" == "no" will be false.