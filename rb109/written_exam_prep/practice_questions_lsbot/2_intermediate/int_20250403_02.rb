# 3.  Intermediate: What does the following code output? 

# Explain why.

arr = [1, 2, 3, 4, 5]
new_arr = arr.map do |num|
 if num > 3
   puts num
 else
   num * 2
 end
end

p new_arr

=begin

On line 1, the `arr` variable is initialised with a reference to the array object `[1, 2, 3, 4, 5]. On line 2, the variable `new_arr` is initialised with the return value of the `map` method call on this array object. The `map` method invocation with a block, when called on an array, returns a new array of the resulting values of the code in the block: this block has a `num` parameter, which references the element of the current iteration, and runs the code within the block during each iteration.

The block has an if/else statement: the expression in the if clause `num > 3` must evaluate as true for the `puts num` expression to be executed, printing a string representation of any integers in the array that are greater than 3 followed by a newline and without quotes. The `puts` method also would return `nil` since the `puts` method returns `nil`, although this is not visible when the `puts` method is executed. This `nil` object is added to the new array object during those particular iterations. The else clause executes when the expression in the if statement evaluates as false: the else clause will execute the expression `num * 2` and the return value is also the same as the resulting value.

For this particular example, the output will display:

4
5

On line 10, the `p` method is passed the array object to which the variable `new_arr` is a reference. As we've seen, this array object is the resulting array of the `map` method called on the array object that `arr` is a reference to.

The `p` method prints its given argument in a "raw" representation; for array objects, `p` will print its argument in a single line with square brackets and `nil` objects made visible.

The output will also display:

[2, 4, 6, nil, nil]


# LSBot feedback (thanks, kind lsbot...)

Your answer to this mock question is excellent! You've provided a thorough and accurate explanation of the code's behavior and output.
Your analysis correctly identifies:
1.  The initialization of variables arr and new_arr
2.  How the map method works, returning a new array based on the block's return values
3.  The conditional logic within the block and its effect on each element
4.  The return value of puts being nil and how this affects the resulting array
5.  The complete output sequence, showing both the values printed by puts and the final array output by p
Your explanation of how map works is spot on. As discussed in the Ruby Basics Arrays exercise "Doubled", map returns a new array with each element transformed based on the block's return value. In your example, you correctly note that when num > 3, the block returns nil (the return value of puts), and otherwise returns num * 2.
One thing I particularly like about your answer is your attention to detail about how the p method displays arrays with their "raw" representation, making nil values visible in the output.
The expected output you provided is also correct:
4
5
[2, 4, 6, nil, nil]
This is an excellent demonstration of understanding how map transforms arrays based on block return values, not based on what gets printed within the block. Keep up the great work!

=end