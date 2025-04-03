# In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

# To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

# B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# Similar to the last problem, there are reassignment operations occurring in the method body, so the references to the string objects that were passed in part ways, as new objects are created within the method, and any variables pointing to the original references will not be affected by operations carried out in the method.

# The output will be:
# one is one
# two is two
# three is three