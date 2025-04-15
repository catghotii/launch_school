### Question 4 (Advanced)

```
start 22:57
end   23:23
total 00:26
```

What will the following code output and why? Focus on variable shadowing, method definitions, and block execution.

```ruby
a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
  puts a
end

puts a
```

In the outer scope, variable `a` is initialised with a reference to the integer `7`. `array` is initialised with a reference to the array object `[1, 2, 3]`.

The `each` method is called on `array` and passed a block, which iterates over the collection it's called on and executes the code in the block for each iteration. In each iteration, the current element is assigned to the block parameter `a`, and then the block is executed: `a += 1` is evaluated, which increments the value of `a` by `1`. `+=` is a reassignment operator, which effectively creates a new integer object, and `a` is then bound to this object. Following the reassignment, `puts a` outputs the value of the new integer referenced by `a`. The block's return value is the same as the result of the last evaluated expression in the block, `puts a`, which returns `nil` (since `puts` returns `nil`). This return value is not used by `each`. Instead, at the end of the method's execution,`each` returns the original object that it is called on, `[1, 2, 3]`.

Line by line, it looks like this:

- On the 1st iteration (element at index 0), `a` is `1`. `a += 1` evaluates as `2`, which is then output. The block returns `nil`.
- On the 2nd iteration (element at index 1), `a` is `2`. `a += 1` evaluates as `3`, which is then output. The block returns `nil`.
- On the 3rd iteration (element at index 2), `a` is `1`. `a += 1` evaluates as `4`, which is then output. The block returns `nil`.

The `puts a` method call on the last line, which outputs `7`, reveals a key concept demonstrated throughout this code: variable scope in relation to blocks and in particular, variable shadowing.

Unlike method definitions that have self-contained scopes (outer code cannot access variables initialised inside of the method, and the method cannot access variables outside of it unless they are passed in as arguments), the variable scope of a block follows the rules that the outer code cannot access variables initialised inside of blocks, while the block can access and modify variables in the outer scope (including reassigning outer variables from within the block). While the outer variable `a` should be available to the block, it actually cannot access or modify it within this particular block due to variable shadowing. Within the block, the parameter `a`, which has the same name as the outer variable, shadows or hides the outer `a`, preventing access from within the block. Additionally, the reassignment occurring in the block `a += 1` is a reassignment of the local variable `a` that was initialised inside the block.

Output

```
2
3
4
7
```