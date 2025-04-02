# To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the user's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Answer:

# Similar to the last problem, the reference to the string object that's passed in to the method as the first argument is assigned to the new local variable `a_string_param` and is mutated by the `<<` method. Any variables pointing to it outside of the method will be affected.

# The reference to the array object is passed as the second argument and assigned to `an_array_param`. The operation on the second line of the method body is an assignment operation, which creates a new object, and this variable holds a different reference to the newly created array object. The original reference that was passed in parts company from the variable from here, and any variables in the outer code pointing to the array object that was originally passed in are not affected.

# The respective output values will contain the string object "pumpkinsrutaba" and the 1-element array object ["pumpkins"].


# LS:

# As you can see, we have achieved the opposite effect from our last example.

# We are still passing in the same two string and array arguments, but the results are the opposite, because our method does the "same thing" to each, but in a different way than before. That is, in both cases, the method attempts to change the string from "pumpkins" to "pumpkinsrutabaga" and add "rutabaga" to the array.

# Despite the similarity of the results inside the method definition, the results outside the method definition are the opposite.

# As before, the explanation is all about what Ruby does with a variable when we change the object it points to. Does it create a new object? Or is it able to just modify the existing object? In this case, our literal ['pumpkins', 'rutabaga'] array is a new object, and we are assigning it to the local variable an_array_param.