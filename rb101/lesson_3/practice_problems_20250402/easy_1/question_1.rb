=begin

Question 1

What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# My answer

The expected output is:
1
2
2
3

- The uniq method called on the `numbers` variable does not mutate (permanently modify) the array object that it references. Instead it only returns a new array with duplicate elements removed.
- When this variable is passed to the `puts` method, the program outputs the elements of the array in successive lines.

# LS solution

numbers.uniq returned a new Array object with unique elements, but it did not modify the numbers object. The puts method, in addition to calling to_s on its argument, writes each element on a new line if passed an array. That’s why the output appears as shown above.

Additional note: had the last line been p numbers instead, the output would have been [1, 2, 2, 3] because the p method automatically calls inspect on its argument, which gives a different formatting on the output. Furthermore, we could have also done puts numbers.inspect and the output would have been the same as using the p method.

=end