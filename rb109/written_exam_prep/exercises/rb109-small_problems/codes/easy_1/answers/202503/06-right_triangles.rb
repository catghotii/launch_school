=begin

Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

Examples:

triangle(5)
    *
   **
  ***
 ****
*****

triangle(9)
        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

=end

# first attempt 2025-03-18
# using counter and while loop

def triangle(n)
  total_lines = n
  number_of_whitespaces = n - 1
  number_of_stars = 1
  counter = 1
  whitespace = ' '
  star = "*"
  line_output = "#{whitespace * number_of_whitespaces}#{star * number_of_stars}"
  puts line_output

while counter < total_lines
  number_of_whitespaces -= 1
  number_of_stars += 1
  line_output = "#{whitespace * number_of_whitespaces}#{star * number_of_stars}"
  puts line_output
  counter += 1
end

end

triangle(5)
triangle(10)

# using times method

def triangle_2(n)
  number_of_whitespaces = n - 1
  number_of_stars = 1

  n.times do |i|
    puts "#{" " * number_of_whitespaces}#{"*" * number_of_stars}"
    number_of_whitespaces -= 1
    number_of_stars += 1
  end
end

triangle_2(5)
triangle_2(10)

# Further Exploration

# Try modifying your solution so it prints the triangle upside down from its current orientation. 

# reverse method called on string output

def triangle_3(n)
  number_of_whitespaces = n - 1
  number_of_stars = 1

  n.times do |i|
    puts "#{" " * number_of_whitespaces}#{"*" * number_of_stars}".reverse
    number_of_whitespaces -= 1
    number_of_stars += 1
  end
end

triangle_3(5)

# Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.

# right angle positions: top left, top right, bottom left, bottom right

def triangle_4(n, corner="bottom right")
  if corner == "bottom right" || corner == "bottom left"
    number_of_whitespaces = n - 1
    number_of_stars = 1
  elsif corner == "top right" || corner == "top left"
    number_of_whitespaces = 0
    number_of_stars = n
  end

  case corner
  when "bottom right"
    n.times do |i|
      puts "#{" " * number_of_whitespaces}#{"*" * number_of_stars}"
      number_of_whitespaces -= 1
      number_of_stars += 1
    end
  when "bottom left"
    n.times do |i|
      puts "#{" " * number_of_whitespaces}#{"*" * number_of_stars}".reverse
      number_of_whitespaces -= 1
      number_of_stars += 1
    end
  when "top right"
    n.times do |i|
      puts "#{" " * number_of_whitespaces}#{"*" * number_of_stars}"
      number_of_whitespaces += 1
      number_of_stars -= 1
    end
  when "top left"
    n.times do |i|
      puts "#{" " * number_of_whitespaces}#{"*" * number_of_stars}".reverse
      number_of_whitespaces += 1
      number_of_stars -= 1
    end
  end
end

triangle_4(5)
triangle_4(5, "bottom right")
triangle_4(5, "bottom left")
triangle_4(5, "top right")
triangle_4(5, "top left")