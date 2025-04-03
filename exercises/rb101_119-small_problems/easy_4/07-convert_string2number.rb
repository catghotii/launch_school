=begin

Convert a String to a Number!

The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

Examples

string_to_integer('4321') == 4321
string_to_integer('570') == 570

=end

# cannot use:
# to_i, Integer(), etc

# first attempt 2025-03-20
# literally cannot do math lol wtf

DIGITS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

BASE_INDEX = {0 => 1, 1 => 10, 2 => 100, 3 => 1000}

def string_to_integer(number_string)
  number_array = []
  number_string.chars.each { |digit| number_array << DIGITS[digit] }.reverse
  number_array = number_array.reverse.map.with_index { |element, i| element * BASE_INDEX[i] }
  number_array.reverse.inject(:+)
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# LS solution

DIGITS_LS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer_ls(string)
  digits = string.chars.map { |char| DIGITS_LS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

p string_to_integer_ls('4321') == 4321
p string_to_integer_ls('570') == 570

=begin

Discussion

As usual, this isn't the shortest or even the easiest solution to this problem, but it's straightforward. The big takeaway from this solution is our use of the DIGITS hash to convert string digits to their numeric values. This technique of using hashes to perform conversions is a common idiom that you can use in a wide variety of situations, often resulting in code that is easier to read, understand, and maintain.

The actual computation of the numeric value of string is mechanical. We take each digit and add it to 10 times the previous value, which yields the desired result in almost no time. For example, if we have 4, 3, and 1, we compute the result as:

10 * 0 + 4 -> 4
10 * 4 + 3 -> 43
10 * 43 + 1 -> 431

Further Exploration

Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.

Example:

hexadecimal_to_integer('4D9f') == 19871

=end