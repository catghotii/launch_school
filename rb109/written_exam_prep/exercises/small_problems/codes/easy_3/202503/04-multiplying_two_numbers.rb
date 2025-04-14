# Create a method that takes two arguments, multiplies them together, and returns the result.

def multiply(a, b)
  a * b
end

p multiply(5,3)

# Further Exploration

# For fun: what happens if the first argument is an Array? What do you think is happening here?

array = [1,2]

multiply(array, 3)

=begin

LSBot explainer:

When you pass an array as the first argument to the multiply method, the * operator behaves differently than it does with numbers. Let me explain what's happening:
# ruby

def multiply(a, b)
  a * b
end

p multiply(5,3)      # This outputs 15 (5 * 3 = 15)

array = [1,2]

multiply(array, 3)   # This returns [1, 2, 1, 2, 1, 2]
In Ruby, the * operator's behavior depends on the objects it's working with:
1.  With numbers (like in multiply(5, 3)), it performs arithmetic multiplication, returning 15.
2.  With arrays (like in multiply(array, 3)), it performs repetition. When you multiply an array by an integer, Ruby repeats the elements of the array that many times, creating a new array.
So [1, 2] * 3 creates a new array with the elements of [1, 2] repeated 3 times, resulting in [1, 2, 1, 2, 1, 2].
This is an example of Ruby's operator overloading - the same operator (*) performs different operations depending on the types of operands. This is part of Ruby's design philosophy to make code more intuitive and readable.
If you want to see the result, you could modify your code to:
# ruby

p multiply(array, 3)  # This would output [1, 2, 1, 2, 1, 2]
This behavior is documented in the Ruby Array class documentation, where you can find more details about array operations.

=end