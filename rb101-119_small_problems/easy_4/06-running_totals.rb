# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

# A running total is the sum of all values in a list up to and including the current element. Thus, the running total when looking at index 2 of the array [14, 11, 7, 15, 20] is 32 (14 + 11 + 7), while the running total at index 3 is 47 (14 + 11 + 7 + 15).

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# Further Exploration

# Try solving this problem using Enumerable#each_with_object or Enumerable#reduce (note that Enumerable methods can be applied to Arrays).

# each_with_object

def running_total_2(array)
  sum = 0
  array.each_with_object([]) { |i, a| a.push(sum += i) }
end

p running_total_2([2, 5, 13]) == [2, 7, 20]
p running_total_2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total_2([3]) == [3]
p running_total_2([]) == []

# reduce/inject

def running_total_3(array)
  array.map.with_index do |_, index|
    array[0..index].inject(:+)
  end
end

p running_total_3([2, 5, 13]) == [2, 7, 20]
p running_total_3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total_3([3]) == [3]
p running_total_3([]) == []