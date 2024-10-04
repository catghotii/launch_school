#### Exercise 1

- a method that returns the sum of two integers

```plaintext
Ask user for two integers.
Set a variable for the first integer.
Set another variable for the second integer.
Add the values of both variables together and set the result to a variable.
Display the value of the result variable.
```

```plaintext
START

GET integer
SET integer_1

GET integer
SET integer_2

SET result = 0
result = integer_1 + integer_2

RETURN result

END
```

#### Exercise 2

- a method that takes an array of strings, and returns a string that is all those strings concatenated together

```plaintext
= begin
CASUAL

Given an array of strings to combine into one string.

considerations:
# to combine, go through each element and move that element into an empty string, one by one.
# prepend whitespace during each iteration
# convert array element into a string object

Set a variable for an empty string - final_string
Set a variable for a single whitespace character string.
Set a variable for the current element.
Set a variable for the given array length.

Iterate over the collection of elements
- remove the first element from the array and save into a variable
- convert this element into a string object
- add this string object into the final_string variable
- add a whitespace character into the final_string variable

repeat until the array is empty
delete the last whitespace character

print the final string

=end



=begin
FORMAL

START

# Given an array of strings called "array"

SET final_string = ""
SET whitespace = " "
SET current_element = nil
SET array_length = length of given array

WHILE array_length > 0
  SET current_element = first array element
  convert current_element into a string object
  SET final_string = current_element + whitespace

SET final_string = final_string minus last whitespace character

PRINT final_string

=end
```

```ruby
words = %w(hi how are you)

final_string = ""
whitespace = " "
current_element = nil
array_length = words.length

while words.length > 0
  current_element = words.shift
  final_string = final_string + current_element + whitespace
end

final_string = final_string.delete_suffix!(' ')

p final_string
```

other approaches to delete whitespace:

```none
DELETE trailing whitespace from string_output
```

```none
SET string_output = (string_output - " ")
```

```none
IF string_output[-1] == " "
  remove trailing whitespace
```

#### Exercise 3

- a method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element. For instance:

```ruby
every_other([1,4,7,2,5]) # => [1,7,5]
```

```plaintext
=begin

# INFORMAL

GET an array of integers

Set a variable for the index number    # only values at even indices pushed!
Set a variable for the current element
Set a variable for the new array

- add the first element (index 0) to the new array

Iterate over elements:
- increment the index number by 1
- set the current element
- if the index number % 2 == 1         # basically .odd? method
  - skip the iteration
- else if index number % 2 != 1
	- add the current element to the new array

Stop when the index number is greater than or equal to the length of the new array

Display the new array.
  
=end

=begin

# FORMAL

START

GET array of integers
SET array
SET new_array = []

SET current_element
SET index_count = 0
SET array_length = array.length

WHILE array.length >= index_count
  SET new_array = new_array + current_element
  IF index_count % 2 == 1
    NEXT
  index_count = index_count + 1

PRINT new_array
  
=end
```

```ruby
=begin
# FORMAL

START

GET array of integers
SET array
SET new_array = []

SET index_count = 0
SET current_element = array[index_count]
SET array_length = array.length

WHILE array.length >= index_count
  SET new_array = new_array + current_element
  IF index_count % 2 == 1
    NEXT
  SET index_count = index_count + 1
  SET current_element = array[index_count]

PRINT new_array
  
=end

array = [1,4,7,2,5]
new_array = []
index_count = 0
array_length = array.length
current_element = array[index_count]

new_array = new_array << current_element

loop do
  index_count = index_count + 1
  if index_count % 2 == 1
    next
  end
  current_element = array[index_count]
  new_array = new_array << current_element
  break if index_count > new_array.length
end

p array
p new_array
```

#### Exercise 4

- a method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is `'x'` and the string is `'axbxcdxex'`, the method should return 6 (the index of the 3rd `'x'`). If the given character does not occur at least 3 times, return `nil`.

```plaintext
=begin

# CASUAL

# return the index of the 3rd occurrence of a given character in a string
# return nil if < 3 matches

START

Variables:
- string
- character
- index_counter
- match_counter
- saved_index

Actions:
- Iterate over each character
- Check for a match
  - if match found, match_counter by 1
  - save index to a variable
- Repeat until the end of the string or when three matches are found

- if 3 matches are found: return the saved index
- if < 3 matches found: return nil


# FORMAL

START

GET string
SET string
GET character
SET character

SET index_counter = 0
SET match_counter = 0
SET current_character = string[index_counter]

WHILE match_counter < 3
  SET current_character = string[index_counter]
  IF character == current_character
    match_counter = match_counter + 1
  SET index_counter = index_counter + 1
  SET character_counter = "#{string[index_counter]}"

SET result = index_counter

IF result < 3
  RETURN nil
ELSE
  RETURN result

=end
```

```ruby
string = "axbxcdxex"
char = "x"

idx = 0
char_count = 0
saved_idx = 0
current_char = string[idx]

loop do
  if current_char == char
    char_count = char_count + 1
    saved_idx = idx
  end
  break if char_count == 3 || (string.length <= idx)

  idx = idx + 1
  current_char = string[idx]
end

if char_count < 3
  p nil
else
  p saved_idx
end
```


#### Exercise 5

- a method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes. For instance:

```ruby
merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]
```

You may assume that both array arguments have the same number of elements.

```ruby
=begin

# CASUAL

# returns the result of merging two given arrays of the same length
# new array: even indexes from first array, odd indexes from second array

Set variable for the first array = get
Set variable for the second array = get
Set variable for the merged array = empty

Set variable for index counter = 0
Set variable for current element of first array = index of first array
Set variable for current element of second array = index of second array

Iterate over each array, alternating between the two arrays:

  first array:
  - set the current element by referencing the index
  - add this value to the new array

  second array:
  - set the current element by referencing the index
  - add this value to the new array

  increment index by 1

Repeat until the number of elements in the new array == the sum of both arrays' lengths

Display new array

=end

=begin

# FORMAL

START

GET array_1
SET array_1
GET array_2
SET array_2

SET merged_array = []
SET idx = 0
SET current_element_1 = array_1[idx]
SET current_element_2 = array_2[idx]

WHILE sum length of both arrays > length of merged_array
  SET merged_array = merged_array + array_1[idx] + array_2[idx]
  SET index_counter = index_counter + 1
  SET current_element_1
  SET current_element_2

PRINT merged_array

END

=end

array_1 = [1,2,3]
array_2 = [4,5,6]

merged_array = []
idx = 0
current_element_1 = array_1[idx]
current_element_2 = array_2[idx]

length_total = array_1.length + array_2.length

while length_total > merged_array.length
  merged_array = merged_array.push(current_element_1,current_element_2)
  idx = idx + 1
  current_element_1 = array_1[idx]
  current_element_2 = array_2[idx]
end

p merged_array
```