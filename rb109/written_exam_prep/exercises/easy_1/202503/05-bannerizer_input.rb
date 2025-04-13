=begin

Write a method that will take a short line of text, and print it within a box.

print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+

CASUAL PSEUDOCODE

GET text

GET string_size

SUBPROCESS for adding box characters
SET padding = whitespace * string_size (in a string)
SET box_lines

=end

# first attempt 2025-03-18

def print_in_box(string)
  string_size = string.size
  padding = (" " * string.size)
  box_lines = ("-" * string.size)

  puts "+-#{box_lines}-+ \n" \
       "| #{padding} | \n" \
       "| #{string} | \n" \
       "| #{padding} | \n" \
       "+-#{box_lines}-+"
end

puts "What's in the box?"
user_input = gets.chomp
print_in_box(user_input)

# LS Solution

def print_in_box_ls(message)
   horizontal_rule = "+#{'-' * (message.size + 2)}+"
   empty_line = "|#{' ' * (message.size + 2)}|"

   puts horizontal_rule
   puts empty_line
   puts "| #{message} |"
   puts empty_line
   puts horizontal_rule
end


# Further Exploration

# Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box).

# For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.

