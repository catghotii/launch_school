# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# Further Exploration

# Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array. 

def palindromic_array?(array)
  array == array.reverse
end

p palindromic_array?([1,2,1])
p palindromic_array?([1,2,3,2,1])

# Now write a method that determines whether an array or a string is palindromic; that is, write a method that can take either an array or a string argument, and determines whether that argument is a palindrome. You may not use an if, unless, or case statement or modifier.

def palindromic?(string_or_array)
  string_or_array == string_or_array.reverse
end

p palindromic?('madam')
p palindromic?([1,2,3,2,1])
p palindromic?('launch school')