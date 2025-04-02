# Let's call a method, pass two strings as arguments and see how they can be treated differently depending on the method invoked on them inside the method definition.

# Study the following code and state what will be displayed...and why:

def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga"
  string_param_two << "rutabaga"
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}"
puts "String_arg_two looks like this now: #{string_arg_two}"

# Answer:

# The variable assignments following the method definition give the respective variables separate references to two different string objects (these string objects are comprised of the same characters, even though they are completely different objects).

# The `tricky_method` method invocation is passed two arguments: the references stored in the variables previously mentioned are passed as arguments to the method and these references are stored in the parameter variables defined by the method definition.

# The operation performed on `string_param_one` is a reassignment, which concatenates the value of the string that was passed in as the first argument to "pumpkinsrutabaga". Notably, when this reassignment occurs a new string object is created; now `string_param_one` holds a new reference to this new string object, and no longer contains a reference to the original object that was initially passed in. Effectively this means that any variables that hold references to the original string object will not be affected by any operations in the method definition.

# On the other hand, the second operation in the method body is a mutating method `<<`. When this method is called on `string_param_two`, it mutates the original string object passed in as the second argument to "pumpkinsrutabaga". Unlike reassignment, the original string is mutated, and so any variables that hold a reference to this object are also changed—in this case, the variable in the outer code, `string_arg_two` points to the same object that has been mutated.

# The first `puts` method call will display the string object "pumpkins" which was not affected by `tricky_method`, whereas the second `puts` method call will display the mutated concatenated value "pumpkinsrutabaga"


# LS:

# Why? It seems clear from the above that Ruby treats the two string arguments differently...but not so fast. Actually the arguments are treated in exactly the same way...but the results are different.

# In both cases, Ruby passes the arguments "by value", but unlike some other languages, the value that gets passed is a reference to some object. The string arguments are passed to the method as references to objects of type String.

# The important distinction is that while a reference is passed, the method initializes new local variables for both strings and assigns each reference to the new local variables. These are variables that only live within the scope of the method definition.

# So, if both arguments live inside the method as new variables that store a reference to the passed objects...why don't the strings behave the same way in our output?

# The difference lies in what Ruby does when the program executes either a String#+= operation or a String#<< operation.

# The String#+= operation is re-assignment and creates a new String object. The reference to this new object is assigned to string_param_one. The local variable string_param_one now points to "pumpkinsrutabaga", not "pumpkins". It has been re-assigned by the String#+= operation. This means that string_param_one and string_arg_one no longer point to the same object.

# On the other hand, String#<< mutates the calling object. Therefore, string_param_two << "rutabaga" mutates the object referenced by string_param_two, so that it becomes "pumpkinsrutabuga". So, because the local variable string_param_two still points to the original object, the local variables string_arg_two and string_param_two are still pointing at the same object, and we see the results of what happened to the string "outside" of the method.