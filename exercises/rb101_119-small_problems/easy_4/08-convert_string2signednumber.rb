=begin

In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

Examples

string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

=end

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

def string_to_signed_integer(string)
  number = string

  if number.start_with?('+')
    number.slice!(0)
    string_to_integer(number)
  elsif number.start_with?("-")
    number.slice!(0)
    -string_to_integer(number)
  else
    string_to_integer(number)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

=begin

Solution

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

Discussion

In this solution, we opt to reuse the string_to_integer method from the previous exercise. Why waste effort reinventing the wheel? (Oh, wait. That's exactly what we're doing, isn't it?)

This solution is reasonably easy: it simply looks at the first character of string. If the character is a -, the negative of the number represented by the rest of the string is returned. If it is not a -, it returns the value of the rest of the string as a number, skipping over a leading + if present.

Note that we rely on the fact that case returns the value returned by the when (or else) branch selected.

The most interesting aspect of this method is the use of string[1..-1] to obtain the remainder of the string after a leading + or -. This notation simply means to extract the characters starting at index 1 of the string (the second character) and ending with the last character (index -1).
Further Exploration

In our solution, we call string[1..-1] twice, and call string_to_integer three times. This is somewhat repetitive. Refactor our solution so it only makes these two calls once each.

=end

def string_to_signed_integer_ls(string)
  string.start_with('-') ? -string_to_integer(string[1..-1]) : string_to_integer(string[1..-1])
end