# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces.

def swap(string)
  new_string = ''
  first_char = string[0]
  last_char = string[-1]
  p new_string = new_string[0].replace(first_char)
end

# Examples:

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'