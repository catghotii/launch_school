Hello! Hope it's okay to ask this here, apologies for it being a long one! Prepping for the RB109 written test and encountered a tricky question. Can anyone help clarify how/when the `select` method return array is built if the block has a mutating operation inside of it?

After a bit of back and forth with LSBot (and coming out of it with a better understanding of what happens when `select` is called, as well as a practical example of why it's advised not to modify collections during iteration), I think my explanation is accurate enough. But I'm still unsure why implementation of the `select` method would be different, particularly at what point during execution the return array is built.

To me, it seems that the return array in LSBot's explanation consists of the elements for which the block returns a truthy value, suggesting that `select` is still iterating over the original array object or "remembers" the original array and the elements at each position where the block returns a truthy value — is the return array being built with each successive iteration, or after all iterations?

Meanwhile, when I run this code through irb, the return array consists of the elements at 'truthily' evaluated positions in the modified array, based on the modified array's indexing of elements. I ran this code with another `arr` object which suggests that a return array is being populated at the end of each iteration that evaluates as truthy. I've included this code at the bottom!

Thanks in advance!

---

What will the following code output and why? Please explain step-by-step.

```ruby
arr = [1, 2, 3, 4, 5]
new_arr = arr.select do |num|
  arr.delete(num) if num.odd?
end
p arr
p new_arr
```

My irb's output:

```
[2, 4]
[2, 4, nil]
```

---

LSBot explainer:

```
Output:
[2, 4]
[1, 3, 5]
```

Let's analyze this code step by step:

This is a tricky problem that demonstrates what happens when you modify a collection while iterating over it. Let's break it down:

1.  We start with arr = [1, 2, 3, 4, 5]
2.  We call select on arr, which iterates through each element
3.  Inside the block, we're deleting elements from arr if they're odd
4.  The select method builds a new array with elements for which the block returns a truthy value

The key issue here is that we're modifying arr while we're iterating over it using select. This causes unexpected behavior because the collection is changing during iteration.

When we delete elements from arr during iteration:
•   select evaluates the first element (1), which is odd
•   We delete 1 from arr, so arr becomes [2, 3, 4, 5]
•   select evaluates the second element in the original position, which is now 3 (not 2!)
•   We delete 3 from arr, so arr becomes [2, 4, 5]
•   select evaluates the third element in the original position, which is now 5 (not 4!)
•   We delete 5 from arr, so arr becomes [2, 4]
•   Iteration completes

The return value of the block for each iteration is the return value of delete when the condition is true, which is the deleted element itself. When the condition is false, the return value is nil.
So, the output will be:

[2, 4]
[1, 3, 5]

---

LSBot's updated step-by-step after further prodding:

1.  First iteration:
    •   num = 1 (first element of original array)
    •   Since 1.odd? is true, we execute arr.delete(1)
    •   arr.delete(1) returns 1 (the deleted value), which is truthy
    •   Since the block returns a truthy value, select will include the current element being iterated (1) in the new array
    •   arr is now [2, 3, 4, 5]

2.  Second iteration:
    •   num = 2 (second element of original array, now at index 0)
    •   Since 2.odd? is false, we don't execute the delete
    •   The block returns nil (since the condition is false)
    •   Since nil is falsy, select does not include 2 in the new array
    •   arr remains [2, 3, 4, 5]

3.  Third iteration:
    •   num = 3 (third element of original array, now at index 1)
    •   Since 3.odd? is true, we execute arr.delete(3)
    •   arr.delete(3) returns 3, which is truthy
    •   Since the block returns a truthy value, select will include the current element (3) in the new array
    •   arr is now [2, 4, 5]

4.  Fourth iteration:
    •   num = 4 (fourth element of original array, now at index 1)
    •   Since 4.odd? is false, we don't execute the delete
    •   The block returns nil
    •   Since nil is falsy, select does not include 4 in the new array
    •   arr remains [2, 4, 5]

5.  Fifth iteration:
    •   num = 5 (fifth element of original array, now at index 2)
    •   Since 5.odd? is true, we execute arr.delete(5)
    •   arr.delete(5) returns 5, which is truthy
    •   Since the block returns a truthy value, select will include the current element (5) in the new array
    •   arr is now [2, 4]

In most Ruby implementations, select initially creates a temporary array before populating the final result. This means that even though we're modifying arr during iteration, it doesn't affect which elements select iterates over. Each element from the original array is processed exactly once.

However, the surprising result [2, 4, nil] suggests that your Ruby implementation is behaving differently.

It appears that your implementation is trying to select elements from the modified array at the same positions as the original elements that passed the test, rather than the actual elements that were tested.

----

My answer:

On line 1, the variable `arr` is initialised with a reference to the array object [`1, 2, 3, 4, 5]`.

On line 2, the variable `new_array` is initialised with a reference to the result of the `select` method invocation with a block that's called on the array object to which `arr` is a reference.

The `select` method call will execute the code in the block for each iteration, assigning the current element of the collection to the local variable `num` and evaluating the conditional expression `arr.delete(num) if num.odd?`. The `select` method will ultimately return a new array containing all elements for which the block returns a truthy value.

The block code contains the conditional expression `arr.delete(num) if num.odd?`: for each iteration, the if statement `if num.odd?` checks whether the current element is an odd number. If the expression evaluates as truthy (i.e. the integer is indeed an odd number), the mutating operation `arr.delete(num)` is executed: the `delete` method with an argument of the value of current iteration is called on the array object, which removes this value from the `arr` collection.

The `select` method creates a return array consisting of the elmeents for which the block returns a truthy value — that is, if the block is evaluated as truthy for that iteration's element, the return array will include that element.

It's important to note that the collection itself is changing during each iteration, which can cause unexpected behaviours, and ultimately has implications for the return values of the block as well as the new array returned by the `select` method call.

(I've outlined what I think is actually happening during each iteration (at least for how my version of Ruby seems to be implementing the select method!). I'm not sure if my terminology is completely accurate, but I hope you understand what I'm trying to communicate!)

Line-by-line:

- On the first iteration (element at index 0), `num = arr[0]`, or for this point in execution, `num = 1`, so the conditional statement evaluates as true. `arr.delete(1)` is executed, removing the argument of integer `1` from the collection; arr is now `[2, 3, 4, 5]`.

Meanwhile, `select` method also creates a temporary return array that is populated with the element for which the block returns a truthy value. At this point in execution, since the block returns a truthy value, the temporary return is populated with the current element: in this case, `arr.delete(num) if num.odd?` is evaluated as `arr.delete(arr[0]) if arr[0].odd?`. It's important to note here that the array object to which `arr` is a reference has been mutated to `[2, 3, 4, 5]`! Therefore `arr[0]` has also changed at this point in execution: `arr[0]` is now `2` so this value is added to the temporary return array (which now consists of `[2]`)

At this point in execution:
`arr` is `[2, 3, 4, 5]`;
temporary return array is `[2]`

- On the second iteration (element at index 1) `num = arr[1]` which evaluates as `3`; the conditional statement evaluates as truthy; `arr.delete(3)` is executed, removing integer `3` from `arr`, and `arr` now points to the the modified array object of `[2, 4, 5]`. The temporary return array is updated with the current element added to it (i.e. the current element `arr[1]` evaluates to `4`).

`arr` is `[2, 4, 5]`;
temporary return array is `[2, 4]`

- On the third iteration (element at index 2), `num = arr[2]` which evaluates as `5`; the conditional statement evaluates as truthy and `arr.delete(5)` is executed; `arr` is changed from `[2, 3, 4]` to `[2, 4]`. The temporary array is updated to include the element at `arr[2]` which is `nil`.

`arr` is `[2, 4]`;
temporary return array is `[2, 4, nil]`

- At this point in execution, the `select` method returns the final result of the return array which is `[2, 4, nil]`. `new_arr` receives a reference to the return array object.

The method calls of `p arr` and `p new_arry` will print 'raw' representations of the arguments that are passed to the p method in a single line, including square brackets and `nil`, followed by a newline.

Thus the output is:

```
[2, 4]
[2, 4, nil]
```

---

What if `arr = [1, 2, 3, 4, 5, 5, 7, 7]`?

```ruby
arr = [1, 2, 3, 4, 5, 5, 7, 7]

new_arr = arr.select do |num|
  arr.delete(num) if num.odd?
end

p arr
p new_arr

# Output:
# [2, 4, 9, 9]
# [2, 4, 7, 9]
```

- On the first iteration (element at index 0), `num = arr[0]` which is integer `1`; the conditional statement evaluates as true; `arr.delete(1)` is executed, removing the argument of integer `1` from the collection;
arr is now `[2, 3, 4, 5, 5, 7, 7]`;
the temporary return array consists of the value at `arr[0]` => `[2]`

(I've simplified the next iterations for clarity:)

- 2nd iteration, index 1, num = arr[1] => `num = 3`;
the conditional statement evaluates as true; 
`arr.delete(3)` is executed (which removes integer `3` from the original array object);

at this point in execution, `arr` => `[2, 4, 5, 5, 7, 7]`;
temp return array adds `array[1]` (=> `4`) to the its collection --> temp new array => `[2, 4]`

- 3rd iteration, index 2, num = arr[2] => `num = 5`;
the conditional statement evaluates as true; 
`arr.delete(5)` is executed (which removes all instances of integer `5` from the original array object);

at this point in execution, `arr` => `[2, 4, 7, 7]`;
temp return array adds `array[2]` (=> `7`) to the its collection --> temp new array => `[2, 4, 7]`

- 4th iteration, index 3, num = arr[3] => `num = 7`;
the conditional statement evaluates as true;
`arr.delete(7)` is executed (which removes all instances of integer `7` from the original array object);

at this point in execution, `arr` => `[2, 4]`;
temp return array adds `array[4]` (=> `nil`) to the its collection --> temp new array => `[2, 4, 7, nil]`

There are no more elements to iterate over on the fifth iteration.

The `select` method's return value is the resulting return array of `[2, 4, 7, nil]`, which `new_arr` receives a reference to.

The final output is:

```
[2, 4]
[2, 4, 7, nil]
```