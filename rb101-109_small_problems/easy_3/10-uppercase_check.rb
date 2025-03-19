# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Further Exploration

# Food for thought: in our examples, we show that uppercase? should return true if the argument is an empty string. Would it make sense to return false instead? Why or why not?

# hmmm. not necessarily. The upcase method call on an empty string is still technically equivalent to the string contents prior to the call... and if everything in Ruby considers every expression to be truthy except for false and nil...