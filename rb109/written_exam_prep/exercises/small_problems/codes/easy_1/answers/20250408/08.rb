# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

# Examples:

# triangle(5)
#     *
#    **
#   ***
#  ****
# *****

# triangle(9)
#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

def triangle_with_loop(number)
  line_number = 1

  loop do
    line = (" " * (number - line_number)) + ("*" * line_number)
    puts line
    line_number += 1
    break if line_number > number
  end
end

triangle_with_loop(9)

def triangle_with_while(number)
  line_number = 1
  
  while line_number <= number
    line = (" " * (number - line_number)) + ("*" * line_number)
    puts line
    line_number += 1
  end
end

triangle_with_while(3)

# Further Exploration

# Try modifying your solution so it prints the triangle upside down from its current orientation. Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.