## Other Collection Methods

[Link to all examples below](https://launchschool.com/lessons/85376b6d/assignments/d86be6b5)

### Example 1

[1, 2, 3].any? do |num|  num > 2end

### Example 2

{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|  value.size > 4end

### Example 3

[1, 2, 3].all? do |num|  num > 2end

### Example 4

{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|  value.length >= 3end

### Example 5

[1, 2, 3].each_with_index do |num, index|  puts "The index of #{num} is #{index}."end

### Example 6

{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|  array << pair.lastend

### Example 7

{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|  hash[value] = keyend

### Example 8

odd, even = [1, 2, 3].partition do |num|  num.odd?endp odd p even
