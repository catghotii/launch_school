Question 5: Collections and Iteration (Advanced)
Explain what happens in the following code, line by line. What is the final value of array? Why?

```ruby
array = [1, 2, 3, 4, 5]

array.each do |num|
  if num.odd?
    array.delete(num)
  end
end

puts array
```

On line 1, the variable `array` is initialised with a reference to the array object `[1, 2, 3, 4, 5]`.

On line 3, the `each` method is called with a block, which will execute the code in the block for each iteration in the collection, assigning the current element to the local variable `num`. For each iteration, a conditional statement `if num.odd?` is evaluated: is the current element an odd number? If the expression is evaluated as `true`, the next line `array.delete(num)` will run, otherwise if the conditional expression is evaluated as `false`, execution will continue to the next iteration. The block code stops when all elements have been evaluated in the if statement, and execution resumes after the `each` method call.

If the conditional expression evaluates as true, `array.delete(num)` is executed, which is a mutating operation, which means that the original array object will be permanently changed: the `delete` method is called on the `array` object and passed an argument with the value of the current element, which removes this element from the array, leaving any elements that evaluated as `false` to the if statement. As arrays are mutable objects, the array itself will be modified.

Line by line, this means:

- During the first iteration, `num = 1`, so the if statement evaluates to `true`, and the following line `array.delete(num)` is executed. The integer `1` is passed as an argument to the `delete` method call, which is invoked on the array object `[1, 2, 3, 4, 5]`, which removes `1` from the array. `array` now returns `[2, 3, 4, 5]`
- On the second iteration, `num = 2`, so the if statement evaluates to `false`, and execution continues to the next iteration. `array` points to the array object `[2, 3, 4, 5]`.
- On the third iteration, `num = 3`, so the if statement evaluates to `true` once again, and `array.delete(num)` is executed, which removes the current element `3` from the array; the array object is mutated and has the contents `[2, 4, 5]`
- On the fourth iteration, `num = 4`, which evlautes to `false` in the if statement; execution continues to the next iteration without executing the next line code in the if statement. The array object is `[2, 4, 5]`
- On the fifth and last iteration, `num = 5`, the if statement evaluates to `true` and the mutating operation is executed. `array` now points to the array object `[2, 4]`, which is the resulting value of the `each` method call with a block in this program.

The result of these operations are visible when `puts array` is called on the last line of the program, which prints out the values of the array object with a newline separating each element and brackets removed.

The output will be:

```
2
4
```