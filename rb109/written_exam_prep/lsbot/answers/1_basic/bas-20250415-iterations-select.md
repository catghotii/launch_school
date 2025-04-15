### Question 1 (Basic)-20250415

(approx 30 min)

What will the following code output and why? Be specific about the return value versus the output.

```ruby
arr = [1, 2, 3, 4, 5]
new_arr = arr.select do |num|  
  puts num if num.odd?  
end  
p new_arr  
```

The variable `arr` is initialised with a reference to the array object `[1, 2, 3, 4, 5]`.

The variable `new_arr` is initialised with a reference to the return value of the `select` method which is called on `arr` and passed a block as an argument. Unlike the `each` method, which iterates over a collection and returns the original object, the `select` method returns an array containing the elements for which the block returns a truthy value. The `select` method creates an empty array `[]` which stores the elements of the return array if the block returns a truthy value.

In each iteration, the block parameter `num` is assigned to the value of the element of the array, starting at index 0. `puts num if num.odd?` is evaluated: the conditional statement `if num.odd?` is evaluated, and if it evaluates as true, `puts num` outputs the current element. The block's return value is the same as the last evaluated expression in the block. `select` then evaluates the truthiness of the return value of the block: if the value is truthy, the return array by `select` is populated with that iteration's element.

For the odd numbers, `if num.odd?` evaluates as true, so the element is output; the block returns `nil` since `puts` returns `nil`; and then `select` evaluates the return value for truthiness—in this case, `nil` is a falsy value, so nothing happens to the return array.

For the even numbers, `if num.odd?` evaluates as false, and the block returns `nil` (since there is no other branch in the if statement to salvage it, Ruby returns `nil`). The `select` method then evaluates the truthiness of the return value of the block: `nil` is falsy, so nothing happens to the return array.

When all iterations have been completed, the `select` method's return is the resulting return array, which remains `[]`. This return value is passed back to its calling code—`new_arr` references `[]`. When `p new_arr` is called, it outputs a "raw" representation of its argument in a single line, including square brackets. The return value of the code snippet is the value of the last evaluated expression, `p new_arr`, which returns `nil` (since `p` returns `nil`).

The output for this code is:

```
1
3
5
[]
```

This code demonstrates:
- iterating over collections using `select`, which returns an array consisting of elements for which the block returns a truthy value
- how truthiness is used in conditional contexts
- return values of a block vs output (via `puts` and `p` )