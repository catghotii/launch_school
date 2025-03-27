# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

def interleave(array1, array2)
  combined_array = []
  total_size = array1.size + array2.size
  while combined_array.size < total_size 
    combined_array << array1.shift << array2.shift
  end
  combined_array
end

# Example:

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']