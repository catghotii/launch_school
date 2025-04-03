# In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

# To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

# A)

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# Within the method definiton, there are reassignment operations occurring which will create new objects and new references to these objects; any variables that hold the same references to those the original objects that were initially passed in will not be affected. Therefore when references to the three string objects are passed in as arguments, those original references are no longer used within the method body and are not affected by any operations in that method.

# The resulting output will be:
# one is one
# two is two
# three is three