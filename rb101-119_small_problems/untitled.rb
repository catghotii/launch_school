# Write a function that takes a list of integers and returns a new list containing only the even numbers from the original list. Implement this function twice: once using a for loop and once using a while loop.

integers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

def for_even(array)
  even_numbers = []

  for num in array
    if num % 2 == 0
      even_numbers << num
    end
  end

  even_numbers
end

p for_even(integers)

def while_even(array)
  even_numbers = []
  index = 0

  while index < array.size
    even_numbers.push(array[index]) if array[index] % 2 == 0
    index += 1
  end

  even_numbers
end

p while_even(integers)