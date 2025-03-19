# Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

def palindromic_number?(integer)
  integer == integer.to_s.reverse.to_i
end

# Examples:

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# Further Exploration

# Suppose your number begins with one or more 0s. Will your method still work? Why or why not? Is there any way to address this?

# explanation by LS student Bob Rodes:

# Further exploration: it depends on what is meant by "work." Putting a zero in front of a number means that it is octal, and Ruby translates the number to decimal before you can evaluate it. So, 013 might be a palindrome, because in decimal it is 11.

# But the question doesn't clarify whether or not this means that 013 "works." By "working," do we mean that our method, when provided a literal octal number as an argument, correctly determines whether its decimal equivalent is a palindrome? If so, the answer is yes. If "work" means that the method can tell whether the actual digits of a literal octal number are a palindrome (e.g. 0123210), then the answer is no (and as far as I'm able to tell, that can't be done). If it means that the method can take a number expressed as a string, but with leading zeros, then the answer is no, but it could be made to do so.