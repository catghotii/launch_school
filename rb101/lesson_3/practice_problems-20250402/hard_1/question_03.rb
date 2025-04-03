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

# C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# Ah! This one looks different. The same process applies: references to the three string objects are passed in as arguments to the method, but this time there are mutating methods used within the method body on those calling arguments. The gsub! methods with two given arguments replace the first argument string with the second argument string. This means that the original objects themselves are modified and any variables outside of the method body are affected: the three variables initialised after the method definition in this code will point to those changes, which are displayed in the `puts` method invocations as follows:

# one is two
# two is three
# three is one



# String#gsub!

# gsub!(pattern, replacement) → self or nil click to toggle source
# gsub!(pattern) {|match| ... } → self or nil
# gsub!(pattern) → an_enumerator

# Performs the specified substring replacement(s) on self; returns self if any replacement occurred, nil otherwise.