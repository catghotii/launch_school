# Write a method that will take a short line of text, and print it within a box.

# Example:

# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# You may assume that the input will always fit in your terminal window.

def print_in_box(string)
  top_or_bottom = "+-#{"-" * string.size}-+"
  middle_padding = "| #{" " * string.size} |"
  middle = "| #{string} |"

  puts top_or_bottom
  puts middle_padding
  puts middle
  puts middle_padding
  puts top_or_bottom
end

print_in_box('To boldly go where no one has gone before.')
